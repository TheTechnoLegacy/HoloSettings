package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class IccLockSettings$2 extends BroadcastReceiver {
    final /* synthetic */ IccLockSettings this$0;

    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.SIM_STATE_CHANGED".equals(intent.getAction())) {
            IccLockSettings.access$300(this.this$0).sendMessage(IccLockSettings.access$300(this.this$0).obtainMessage(102));
        }
    }

    IccLockSettings$2(IccLockSettings iccLockSettings) {
        this.this$0 = iccLockSettings;
    }
}