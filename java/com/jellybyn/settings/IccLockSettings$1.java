package com.jellybyn.settings;

import android.os.AsyncResult;
import android.os.Handler;
import android.os.Message;

class IccLockSettings$1 extends Handler {
    final /* synthetic */ IccLockSettings this$0;

    public void handleMessage(Message message) {
        boolean z = true;
        AsyncResult ar = message.obj;
        IccLockSettings iccLockSettings;
        switch (message.what) {
            case 100:
                iccLockSettings = this.this$0;
                if (ar.exception != null) {
                    z = false;
                }
                IccLockSettings.access$000(iccLockSettings, z);
                return;
            case 101:
                iccLockSettings = this.this$0;
                if (ar.exception != null) {
                    z = false;
                }
                IccLockSettings.access$100(iccLockSettings, z);
                return;
            case 102:
                IccLockSettings.access$200(this.this$0);
                return;
            default:
                return;
        }
    }

    IccLockSettings$1(IccLockSettings iccLockSettings) {
        this.this$0 = iccLockSettings;
    }
}