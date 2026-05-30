package com.jellybyn.settings.fuelgauge;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class PowerUsageDetail$1 extends BroadcastReceiver {
    final /* synthetic */ PowerUsageDetail this$0;

    public void onReceive(Context context, Intent intent) {
        PowerUsageDetail.access$000(this.this$0).setEnabled(getResultCode() != 0);
    }

    PowerUsageDetail$1(PowerUsageDetail powerUsageDetail) {
        this.this$0 = powerUsageDetail;
    }
}