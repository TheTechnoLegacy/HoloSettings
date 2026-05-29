package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.widget.Button;

class CryptKeeperSettings$1 extends BroadcastReceiver {
    final /* synthetic */ CryptKeeperSettings this$0;

    public void onReceive(Context context, Intent intent) {
        int i = 8;
        boolean z = true;
        if (intent.getAction().equals("android.intent.action.BATTERY_CHANGED")) {
            int level = intent.getIntExtra("level", 0);
            int plugged = intent.getIntExtra("plugged", 0);
            int invalidCharger = intent.getIntExtra("invalid_charger", 0);
            boolean levelOk = level >= 80;
            boolean pluggedOk = (plugged & 7) != 0 && invalidCharger == 0;
            Button access$000 = CryptKeeperSettings.access$000(this.this$0);
            if (!(levelOk && pluggedOk)) {
                z = false;
            }
            access$000.setEnabled(z);
            CryptKeeperSettings.access$100(this.this$0).setVisibility(pluggedOk ? 8 : 0);
            View access$200 = CryptKeeperSettings.access$200(this.this$0);
            if (!levelOk) {
                i = 0;
            }
            access$200.setVisibility(i);
        }
    }

    CryptKeeperSettings$1(CryptKeeperSettings cryptKeeperSettings) {
        this.this$0 = cryptKeeperSettings;
    }
}