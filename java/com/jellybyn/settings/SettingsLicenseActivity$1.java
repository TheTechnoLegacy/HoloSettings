package com.jellybyn.settings;

import android.os.Handler;
import android.os.Message;

class SettingsLicenseActivity$1 extends Handler {
    final /* synthetic */ SettingsLicenseActivity this$0;

    public void handleMessage(Message message) {
        super.handleMessage(message);
        if (message.what == 0) {
            SettingsLicenseActivity.access$000(this.this$0, (String) message.obj);
            return;
        }
        SettingsLicenseActivity.access$100(this.this$0);
    }

    SettingsLicenseActivity$1(SettingsLicenseActivity settingsLicenseActivity) {
        this.this$0 = settingsLicenseActivity;
    }
}