package com.devbox.sample;

import android.hardware.usb.UsbDevice;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.devbox.ch55x.Ch55xHidFlasher;
import com.devbox.ch55x.FlasherCallback;

public class MainActivity extends AppCompatActivity {

    private Ch55xHidFlasher flasher;
    private TextView statusText;
    private ProgressBar progressBar;
    private Button btnSendA;
    private Button btnSendB;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        flasher = new Ch55xHidFlasher(this);
        statusText = findViewById(R.id.statusText);
        progressBar = findViewById(R.id.progressBar);
        btnSendA = findViewById(R.id.btnSendA);
        btnSendB = findViewById(R.id.btnSendB);

        // Button 1: Flash code that sends 'A' over Serial every 1 second
        btnSendA.setOnClickListener(v -> flashFirmware(DemoHexPresets.HEX_SEND_A, "Serial Send 'A' every 1s"));

        // Button 2: Flash code that sends 'B' over Serial every 1 second
        btnSendB.setOnClickListener(v -> flashFirmware(DemoHexPresets.HEX_SEND_B, "Serial Send 'B' every 1s"));
    }

    private void flashFirmware(String hexContent, String firmwareDescription) {
        setButtonsEnabled(false);
        progressBar.setProgress(0);
        statusText.setText("Initiating flashing for: " + firmwareDescription);

        flasher.flashAuto(hexContent, new FlasherCallback() {
            @Override
            public void onProgress(int percent, int currentBytes, int totalBytes) {
                progressBar.setProgress(percent);
                statusText.setText("Flashing: " + percent + "% (" + currentBytes + "/" + totalBytes + " bytes)");
            }

            @Override
            public void onStatus(String message) {
                statusText.setText(message);
            }

            @Override
            public void onSuccess() {
                setButtonsEnabled(true);
                progressBar.setProgress(100);
                statusText.setText("Success! Board is now running " + firmwareDescription);
                Toast.makeText(MainActivity.this, "CH552 successfully programmed!", Toast.LENGTH_LONG).show();
            }

            @Override
            public void onError(Throwable error) {
                setButtonsEnabled(true);
                statusText.setText("Error: " + error.getMessage());
                Toast.makeText(MainActivity.this, "Error: " + error.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
    }

    private void setButtonsEnabled(boolean enabled) {
        btnSendA.setEnabled(enabled);
        btnSendB.setEnabled(enabled);
    }
}
