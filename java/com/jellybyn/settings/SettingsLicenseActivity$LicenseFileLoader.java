package com.jellybyn.settings;

import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.zip.GZIPInputStream;

class SettingsLicenseActivity$LicenseFileLoader implements Runnable {
    private String mFileName;
    private Handler mHandler;
    final /* synthetic */ SettingsLicenseActivity this$0;

    public void run() {
        int status = 0;
        InputStreamReader inputReader = null;
        StringBuilder data = new StringBuilder(2048);
        try {
            char[] cArr = new char[2048];
            inputReader = this.mFileName.endsWith(".gz") ? new InputStreamReader(new GZIPInputStream(new FileInputStream(this.mFileName))) : new FileInputStream(this.mFileName);
            while (true) {
                int read = inputReader.read(cArr);
                if (read < 0) {
                    break;
                }
                data.append(cArr, 0, read);
            }
            if (inputReader != null) {
                try {
                    inputReader.close();
                } catch (IOException e) {
                }
            }
        } catch (FileNotFoundException e2) {
            Log.e("SettingsLicenseActivity.LicenseFileLoader", "License HTML file not found at " + this.mFileName, e2);
            status = 1;
            if (inputReader != null) {
                try {
                    inputReader.close();
                } catch (IOException e3) {
                }
            }
        } catch (IOException e4) {
            Log.e("SettingsLicenseActivity.LicenseFileLoader", "Error reading license HTML file at " + this.mFileName, e4);
            status = 2;
            if (inputReader != null) {
                try {
                    inputReader.close();
                } catch (IOException e5) {
                }
            }
        } catch (Throwable th) {
            if (inputReader != null) {
                try {
                    inputReader.close();
                } catch (IOException e6) {
                }
            }
        }
        if (status == 0 && TextUtils.isEmpty(data)) {
            Log.e("SettingsLicenseActivity.LicenseFileLoader", "License HTML is empty (from " + this.mFileName + ")");
            status = 3;
        }
        Message obtainMessage = this.mHandler.obtainMessage(status, null);
        if (status == 0) {
            obtainMessage.obj = data.toString();
        }
        this.mHandler.sendMessage(obtainMessage);
    }

    public SettingsLicenseActivity$LicenseFileLoader(SettingsLicenseActivity settingsLicenseActivity, String str, Handler handler) {
        this.this$0 = settingsLicenseActivity;
        this.mFileName = str;
        this.mHandler = handler;
    }
}