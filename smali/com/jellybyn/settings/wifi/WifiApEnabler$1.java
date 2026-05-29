package com.jellybyn.settings.wifi;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class WifiApEnabler$1 extends BroadcastReceiver {
    final /* synthetic */ WifiApEnabler this$0;

    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if ("android.net.wifi.WIFI_AP_STATE_CHANGED".equals(action)) {
            WifiApEnabler.access$000(this.this$0, intent.getIntExtra("wifi_state", 14));
        } else if ("android.net.conn.TETHER_STATE_CHANGED".equals(action)) {
            WifiApEnabler.access$100(this.this$0, intent.getStringArrayListExtra("availableArray").toArray(), intent.getStringArrayListExtra("activeArray").toArray(), intent.getStringArrayListExtra("erroredArray").toArray());
        } else if ("android.intent.action.AIRPLANE_MODE".equals(action)) {
            WifiApEnabler.access$200(this.this$0);
        }
    }

    WifiApEnabler$1(WifiApEnabler wifiApEnabler) {
        this.this$0 = wifiApEnabler;
    }
}