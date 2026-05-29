package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.jellybyn.settings.ApnSettings.2;

class ApnSettings$1 extends BroadcastReceiver {
    final /* synthetic */ ApnSettings this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.intent.action.ANY_DATA_STATE")) {
            switch (2.$SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[ApnSettings.access$000(intent).ordinal()]) {
                case 1:
                    if (ApnSettings.access$100()) {
                        this.this$0.showDialog(1001);
                        return;
                    } else {
                        ApnSettings.access$200(this.this$0);
                        return;
                    }
                default:
                    return;
            }
        }
    }

    ApnSettings$1(ApnSettings apnSettings) {
        this.this$0 = apnSettings;
    }
}