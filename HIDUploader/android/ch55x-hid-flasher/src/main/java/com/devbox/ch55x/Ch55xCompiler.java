package com.devbox.ch55x;

import android.annotation.SuppressLint;
import android.content.Context;
import android.hardware.usb.UsbDevice;
import android.os.Handler;
import android.os.Looper;
import android.webkit.JavascriptInterface;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * On-device C code compiler for CH552 microcontrollers on Android.
 * Supports:
 *  1. Local On-Device Compilation via WebAssembly (headless WebView).
 *  2. Remote/Network Compilation Service (HTTP POST API).
 */
public class Ch55xCompiler {

    public interface UnifiedCallback {
        void onCompilerStatus(String status);
        void onFlashProgress(int percent, int currentBytes, int totalBytes);
        void onFlashStatus(String status);
        void onSuccess();
        void onError(String message, Throwable error);
    }

    private final Context context;
    private final Handler mainHandler;
    private final ExecutorService executor;
    private WebView headlessWebView;
    private boolean isWasmLoaded = false;
    private CompilerCallback pendingCallback;
    private String remoteServerUrl = null;

    public Ch55xCompiler(Context context) {
        this.context = context.getApplicationContext();
        this.mainHandler = new Handler(Looper.getMainLooper());
        this.executor = Executors.newSingleThreadExecutor();
        initHeadlessWebView();
    }

    /**
     * Optional: Set a remote or local Wi-Fi build server URL (e.g. "http://192.168.1.50:5000/compile").
     * When set, compile() can use the build server instead of on-device WebAssembly.
     */
    public void setRemoteServerUrl(String url) {
        this.remoteServerUrl = url;
    }

    /**
     * Compiles C code into Intel HEX.
     * @param cSourceCode The C source code string.
     * @param callback Callback with the generated Intel HEX or error messages.
     */
    public void compile(String cSourceCode, CompilerCallback callback) {
        if (remoteServerUrl != null && !remoteServerUrl.isEmpty()) {
            compileViaRemoteServer(cSourceCode, callback);
        } else {
            compileViaWasm(cSourceCode, callback);
        }
    }

    /**
     * One-step helper: Compiles C source code and immediately flashes it to the connected CH552 device.
     */
    public void compileAndFlash(
            Ch55xHidFlasher flasher,
            UsbDevice device,
            String cSourceCode,
            UnifiedCallback callback
    ) {
        callback.onCompilerStatus("Compiling C code on device...");

        compile(cSourceCode, new CompilerCallback() {
            @Override
            public void onStatus(String message) {
                mainHandler.post(() -> callback.onCompilerStatus(message));
            }

            @Override
            public void onSuccess(String hexContent, String compileLog) {
                mainHandler.post(() -> {
                    callback.onCompilerStatus("Compilation successful! Initiating USB flash...");

                    flasher.flash(device, hexContent, new FlasherCallback() {
                        @Override
                        public void onProgress(int percent, int currentBytes, int totalBytes) {
                            callback.onFlashProgress(percent, currentBytes, totalBytes);
                        }

                        @Override
                        public void onStatus(String message) {
                            callback.onFlashStatus(message);
                        }

                        @Override
                        public void onSuccess() {
                            callback.onSuccess();
                        }

                        @Override
                        public void onError(Throwable error) {
                            callback.onError("Flash Error: " + error.getMessage(), error);
                        }
                    });
                });
            }

            @Override
            public void onError(String errorMessage) {
                mainHandler.post(() -> callback.onError("Compilation Failed: " + errorMessage, null));
            }
        });
    }

    /**
     * Executes compilation on device using headless WebAssembly engine.
     */
    private void compileViaWasm(String cSourceCode, CompilerCallback callback) {
        this.pendingCallback = callback;
        callback.onStatus("Running on-device SDCC WebAssembly compiler...");

        mainHandler.post(() -> {
            if (headlessWebView == null) {
                initHeadlessWebView();
            }

            try {
                // Escape C code safely as JSON string
                JSONObject json = new JSONObject();
                json.put("source", cSourceCode);
                String escapedSource = json.getString("source")
                        .replace("\\", "\\\\")
                        .replace("\"", "\\\"")
                        .replace("\n", "\\n")
                        .replace("\r", "");

                String jsCall = "javascript:compileSource(\"" + escapedSource + "\");";
                headlessWebView.evaluateJavascript(jsCall, null);

            } catch (Exception e) {
                callback.onError("Failed to dispatch code to WASM engine: " + e.getMessage());
            }
        });
    }

    /**
     * Executes compilation via a remote/local HTTP compilation service.
     */
    private void compileViaRemoteServer(String cSourceCode, CompilerCallback callback) {
        callback.onStatus("Sending code to compilation server (" + remoteServerUrl + ")...");

        executor.execute(() -> {
            HttpURLConnection conn = null;
            try {
                URL url = new URL(remoteServerUrl);
                conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", "application/json");
                conn.setDoOutput(true);
                conn.setConnectTimeout(6000);
                conn.setReadTimeout(12000);

                JSONObject payload = new JSONObject();
                payload.put("source", cSourceCode);

                byte[] postBytes = payload.toString().getBytes(StandardCharsets.UTF_8);
                try (OutputStream os = conn.getOutputStream()) {
                    os.write(postBytes);
                    os.flush();
                }

                int responseCode = conn.getResponseCode();
                BufferedReader reader = new BufferedReader(new InputStreamReader(
                        responseCode == 200 ? conn.getInputStream() : conn.getErrorStream(),
                        StandardCharsets.UTF_8
                ));

                StringBuilder response = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line).append("\n");
                }

                if (responseCode == 200) {
                    JSONObject resJson = new JSONObject(response.toString());
                    String hex = resJson.optString("hex", "");
                    String log = resJson.optString("log", "");

                    if (hex.isEmpty()) {
                        mainHandler.post(() -> callback.onError("Server returned empty HEX output. Log: " + log));
                    } else {
                        mainHandler.post(() -> callback.onSuccess(hex, log));
                    }
                } else {
                    mainHandler.post(() -> callback.onError("Server HTTP error (" + responseCode + "): " + response));
                }

            } catch (Exception e) {
                mainHandler.post(() -> callback.onError("Network compilation failed: " + e.getMessage()));
            } finally {
                if (conn != null) {
                    conn.disconnect();
                }
            }
        });
    }

    @SuppressLint({"SetJavaScriptEnabled", "JavascriptInterface"})
    private void initHeadlessWebView() {
        mainHandler.post(() -> {
            headlessWebView = new WebView(context);
            WebSettings settings = headlessWebView.getSettings();
            settings.setJavaScriptEnabled(true);
            settings.setDomStorageEnabled(true);

            // Interface bridging WASM output back to Java
            headlessWebView.addJavascriptInterface(new Object() {
                @JavascriptInterface
                public void onWasmReady() {
                    isWasmLoaded = true;
                }

                @JavascriptInterface
                public void onCompileSuccess(String hexResult, String log) {
                    if (pendingCallback != null) {
                        mainHandler.post(() -> pendingCallback.onSuccess(hexResult, log));
                    }
                }

                @JavascriptInterface
                public void onCompileError(String errorMsg) {
                    if (pendingCallback != null) {
                        mainHandler.post(() -> pendingCallback.onError(errorMsg));
                    }
                }
            }, "AndroidCompilerBridge");

            headlessWebView.setWebViewClient(new WebViewClient());

            // Embedded HTML compiler host
            String compilerHtml = "<!DOCTYPE html><html><head><meta charset='utf-8'></head><body>"
                    + "<script>"
                    + "function compileSource(src) {"
                    + "  try {"
                    + "    if (window.sdccCompile) {"
                    + "      window.sdccCompile(src);"
                    + "    } else {"
                    + "      AndroidCompilerBridge.onCompileError('SDCC WASM module is initializing or not loaded in assets.');"
                    + "    }"
                    + "  } catch(e) {"
                    + "    AndroidCompilerBridge.onCompileError(e.toString());"
                    + "  }"
                    + "}"
                    + "</script>"
                    + "</body></html>";

            headlessWebView.loadDataWithBaseURL("file:///android_asset/", compilerHtml, "text/html", "UTF-8", null);
        });
    }

    /**
     * Cleans up resources when the activity or service is destroyed.
     */
    public void destroy() {
        mainHandler.post(() -> {
            if (headlessWebView != null) {
                headlessWebView.destroy();
                headlessWebView = null;
            }
        });
        executor.shutdown();
    }
}
