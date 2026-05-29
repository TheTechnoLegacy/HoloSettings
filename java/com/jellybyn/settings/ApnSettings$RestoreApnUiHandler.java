package com.jellybyn.settings;

import android.os.Handler;
import android.os.Message;
import android.widget.Toast;

class ApnSettings$RestoreApnUiHandler extends Handler {
    final /* synthetic */ ApnSettings this$0;

    public void handleMessage(Message message) {
        switch (message.what) {
            case 2:
                ApnSettings.access$200(this.this$0);
                this.this$0.getPreferenceScreen().setEnabled(true);
                ApnSettings.access$102(false);
                this.this$0.dismissDialog(1001);
                Toast.makeText(this.this$0, this.this$0.getResources().getString(2131428197), 1).show();
                return;
            default:
                return;
        }
    }

    private ApnSettings$RestoreApnUiHandler(ApnSettings apnSettings) {
        this.this$0 = apnSettings;
    }
}