package com.devbox.ch55x;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.hardware.usb.UsbConstants;
import android.hardware.usb.UsbDevice;
import android.hardware.usb.UsbDeviceConnection;
import android.hardware.usb.UsbEndpoint;
import android.hardware.usb.UsbInterface;
import android.hardware.usb.UsbManager;
import android.os.Build;

import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Android USB Host library for flashing WCH CH552 microcontrollers over USB HID (Java).
 */
public class Ch55xHidFlasher {

    public static final int VENDOR_ID = 0x1209;
    public static final int PRODUCT_ID = 0xC55D;

    public static final byte CMD_HELLO = 0x01;
    public static final byte CMD_UNLOCK = 0x02;
    public static final byte CMD_WRITE_BLOCK = 0x04;
    public static final byte CMD_VERIFY_CRC = 0x05;
    public static final byte CMD_REBOOT = 0x06;

    public static final int CHUNK_SIZE = 48;
    public static final int USB_TIMEOUT_MS = 2000;
    private static final String ACTION_USB_PERMISSION = "com.devbox.ch55x.USB_PERMISSION";

    public interface PermissionCallback {
        void onPermissionResult(boolean granted);
    }

    private final Context context;
    private final UsbManager usbManager;
    private final ExecutorService executor;

    public Ch55xHidFlasher(Context context) {
        this.context = context.getApplicationContext();
        this.usbManager = (UsbManager) context.getSystemService(Context.USB_SERVICE);
        this.executor = Executors.newSingleThreadExecutor();
    }

    /**
     * Finds connected CH552 HID devices matching VID 0x1209 and PID 0xC55D.
     */
    public UsbDevice findConnectedDevice() {
        HashMap<String, UsbDevice> deviceList = usbManager.getDeviceList();
        for (UsbDevice device : deviceList.values()) {
            if (device.getVendorId() == VENDOR_ID && device.getProductId() == PRODUCT_ID) {
                return device;
            }
        }
        return null;
    }

    /**
     * Checks if permission is granted for the given USB device.
     */
    public boolean hasPermission(UsbDevice device) {
        return usbManager.hasPermission(device);
    }

    /**
     * Requests USB permission from the user for the given device.
     */
    public void requestPermission(UsbDevice device, PermissionCallback callback) {
        if (hasPermission(device)) {
            callback.onPermissionResult(true);
            return;
        }

        int flags = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) ? PendingIntent.FLAG_MUTABLE : 0;
        PendingIntent permissionIntent = PendingIntent.getBroadcast(
                context,
                0,
                new Intent(ACTION_USB_PERMISSION),
                flags
        );

        BroadcastReceiver receiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context c, Intent intent) {
                if (ACTION_USB_PERMISSION.equals(intent.getAction())) {
                    context.unregisterReceiver(this);
                    boolean granted = intent.getBooleanExtra(UsbManager.EXTRA_PERMISSION_GRANTED, false);
                    callback.onPermissionResult(granted);
                }
            }
        };

        IntentFilter filter = new IntentFilter(ACTION_USB_PERMISSION);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            context.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
        } else {
            context.registerReceiver(receiver, filter);
        }

        usbManager.requestPermission(device, permissionIntent);
    }

    /**
     * Asynchronously flashes an Intel HEX string to the connected CH552 device.
     */
    public void flash(UsbDevice device, String hexText, FlasherCallback callback) {
        executor.execute(() -> {
            UsbDeviceConnection connection = null;
            UsbInterface usbInterface = null;

            try {
                callback.onStatus("Opening USB device connection...");
                connection = usbManager.openDevice(device);
                if (connection == null) {
                    throw new IOException("Failed to open USB device connection. Ensure permissions are granted.");
                }

                usbInterface = device.getInterface(0);
                if (!connection.claimInterface(usbInterface, true)) {
                    throw new IOException("Failed to claim USB HID interface 0.");
                }

                UsbEndpoint epOut = null;
                UsbEndpoint epIn = null;

                for (int i = 0; i < usbInterface.getEndpointCount(); i++) {
                    UsbEndpoint ep = usbInterface.getEndpoint(i);
                    if (ep.getDirection() == UsbConstants.USB_DIR_OUT) {
                        epOut = ep;
                    } else if (ep.getDirection() == UsbConstants.USB_DIR_IN) {
                        epIn = ep;
                    }
                }

                if (epOut == null || epIn == null) {
                    throw new IOException("Required USB HID endpoints (IN/OUT) not found on device interface.");
                }

                // 1. Handshake (CMD_HELLO)
                callback.onStatus("Connecting to bootloader (CMD_HELLO)...");
                byte seq = 0;
                byte[] helloResp = transceive(connection, epOut, epIn, CMD_HELLO, seq++, 0, new byte[0]);
                int chipId = helloResp[4] & 0xFF;
                int version = helloResp[5] & 0xFF;
                int maxFlash = (helloResp[6] & 0xFF) | ((helloResp[7] & 0xFF) << 8);

                callback.onStatus("Detected chip ID 0x" + Integer.toHexString(chipId) +
                        " (v" + version + ".0, limit " + maxFlash + " bytes)");

                // 2. Parse Intel HEX
                callback.onStatus("Parsing Intel HEX firmware...");
                IntelHexParser.ParsedHex parsed = IntelHexParser.parse(hexText, maxFlash);
                byte[] binData = parsed.getData();
                int totalBytes = parsed.getEndAddress();
                int expectedCrc = parsed.getCrc16();

                // 3. Unlock Flash engine (CMD_UNLOCK)
                callback.onStatus("Unlocking IAP Flash engine...");
                byte[] unlockToken = new byte[]{(byte) 0x5A, (byte) 0xC3, (byte) 0x3C, (byte) 0xA5};
                byte[] unlockResp = transceive(connection, epOut, epIn, CMD_UNLOCK, seq++, 0, unlockToken);
                if (unlockResp[59] != 0) {
                    throw new IOException("Bootloader rejected IAP unlock key.");
                }

                // 4. Flash blocks (CMD_WRITE_BLOCK)
                callback.onStatus("Writing firmware (" + totalBytes + " bytes)...");
                int offset = 0;
                while (offset < totalBytes) {
                    int remaining = totalBytes - offset;
                    int chunkSize = Math.min(remaining, CHUNK_SIZE);
                    byte[] chunk = new byte[chunkSize];
                    System.arraycopy(binData, offset, chunk, 0, chunkSize);

                    byte[] writeResp = transceive(connection, epOut, epIn, CMD_WRITE_BLOCK, seq++, offset, chunk);
                    int status = writeResp[59];
                    if (status != 0) {
                        throw new IOException("Flash write failed at offset 0x" + Integer.toHexString(offset) +
                                " with error code 0x" + Integer.toHexString(status));
                    }

                    offset += chunkSize;
                    int percent = (int) (((double) offset / totalBytes) * 100);
                    callback.onProgress(percent, offset, totalBytes);
                }

                // 5. Verify CRC (CMD_VERIFY_CRC)
                callback.onStatus("Verifying written firmware integrity (CRC16)...");
                byte[] crcPayload = new byte[]{(byte) (expectedCrc & 0xFF), (byte) ((expectedCrc >> 8) & 0xFF)};
                byte[] verifyResp = transceive(connection, epOut, epIn, CMD_VERIFY_CRC, seq++, totalBytes, crcPayload);
                if (verifyResp[59] != 0) {
                    int chipCrc = (verifyResp[4] & 0xFF) | ((verifyResp[5] & 0xFF) << 8);
                    throw new IOException("CRC check failed! Chip: 0x" + Integer.toHexString(chipCrc) +
                            ", Expected: 0x" + Integer.toHexString(expectedCrc));
                }

                // 6. Reboot device (CMD_REBOOT)
                callback.onStatus("Rebooting device into user application...");
                try {
                    transceive(connection, epOut, epIn, CMD_REBOOT, seq++, 0, new byte[0], 300);
                } catch (Exception ignored) {
                    // Detaches immediately on reboot
                }

                callback.onStatus("Done! Microcontroller successfully programmed.");
                callback.onSuccess();

            } catch (Exception e) {
                callback.onError(e);
            } finally {
                if (usbInterface != null && connection != null) {
                    connection.releaseInterface(usbInterface);
                }
                if (connection != null) {
                    connection.close();
                }
            }
        });
    }

    private byte[] transceive(
            UsbDeviceConnection connection,
            UsbEndpoint epOut,
            UsbEndpoint epIn,
            byte cmd,
            byte seq,
            int addr,
            byte[] payload
    ) throws IOException {
        return transceive(connection, epOut, epIn, cmd, seq, addr, payload, USB_TIMEOUT_MS);
    }

    private byte[] transceive(
            UsbDeviceConnection connection,
            UsbEndpoint epOut,
            UsbEndpoint epIn,
            byte cmd,
            byte seq,
            int addr,
            byte[] payload,
            int timeoutMs
    ) throws IOException {
        byte[] txPacket = new byte[64];
        txPacket[0] = cmd;
        txPacket[1] = seq;
        txPacket[2] = (byte) (addr & 0xFF);
        txPacket[3] = (byte) ((addr >> 8) & 0xFF);
        txPacket[4] = (byte) payload.length;

        System.arraycopy(payload, 0, txPacket, 5, payload.length);

        int sent = connection.bulkTransfer(epOut, txPacket, 64, timeoutMs);
        if (sent < 64) {
            throw new IOException("USB write error: sent " + sent + "/64 bytes for command 0x" + Integer.toHexString(cmd));
        }

        byte[] rxPacket = new byte[64];
        int received = connection.bulkTransfer(epIn, rxPacket, 64, timeoutMs);
        if (received < 64) {
            throw new IOException("USB read error: received " + received + "/64 bytes for command 0x" + Integer.toHexString(cmd));
        }

        return rxPacket;
    }
}
