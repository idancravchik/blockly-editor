package com.devbox.ch55x;

/**
 * Callback listener for CH552 C code compilation events.
 */
public interface CompilerCallback {
    /**
     * Informational status messages during compilation.
     */
    void onStatus(String message);

    /**
     * Called when C code was successfully compiled to Intel HEX.
     * @param hexContent The generated Intel HEX firmware string.
     * @param compileLog Detailed compiler stdout/stderr output.
     */
    void onSuccess(String hexContent, String compileLog);

    /**
     * Called if a syntax, preprocessor, or link error occurs.
     * @param errorMessage Description of the compiler error.
     */
    void onError(String errorMessage);
}
