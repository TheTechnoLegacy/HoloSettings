package com.jellybyn.settings.deviceinfo;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.jellybyn.settings.Utils;

class Status$1 extends BroadcastReceiver {
    final /* synthetic */ Status this$0;

    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction())) {
            Status.access$200(this.this$0).setSummary(Utils.getBatteryPercentage(intent));
            Status.access$300(this.this$0).setSummary(Utils.getBatteryStatus(this.this$0.getResources(), intent));
        }
    }

    Status$1(Status status) {
        this.this$0 = status;
    }
}