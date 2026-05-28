package com.jellybyn.settings.fuelgauge;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.jellybyn.settings.Utils;

class PowerUsageSummary$1 extends BroadcastReceiver {
    final /* synthetic */ PowerUsageSummary this$0;

    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction())) {
            String batteryPercentage = Utils.getBatteryPercentage(intent);
            String batteryStatus = Utils.getBatteryStatus(this.this$0.getResources(), intent);
            PowerUsageSummary.access$000(this.this$0).setTitle(context.getResources().getString(2131428624, new Object[]{batteryPercentage, batteryStatus}));
            this.this$0.mStats = null;
            PowerUsageSummary.access$100(this.this$0);
        }
    }

    PowerUsageSummary$1(PowerUsageSummary powerUsageSummary) {
        this.this$0 = powerUsageSummary;
    }
}