package com.jellybyn.settings;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

class ApnSettings$RestoreApnProcessHandler extends Handler {
    private Handler mRestoreApnUiHandler;
    final /* synthetic */ ApnSettings this$0;

    public void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                this.this$0.getContentResolver().delete(ApnSettings.access$400(), null, null);
                this.mRestoreApnUiHandler.sendEmptyMessage(2);
                return;
            default:
                return;
        }
    }

    public ApnSettings$RestoreApnProcessHandler(ApnSettings apnSettings, Looper looper, Handler handler) {
        this.this$0 = apnSettings;
        super(looper);
        this.mRestoreApnUiHandler = handler;
    }
}