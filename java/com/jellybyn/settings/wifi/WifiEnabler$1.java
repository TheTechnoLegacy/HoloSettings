package com.jellybyn.settings.wifi;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.NetworkInfo;
import android.net.wifi.SupplicantState;
import android.net.wifi.WifiInfo;

class WifiEnabler$1 extends BroadcastReceiver {
    final /* synthetic */ WifiEnabler this$0;

    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if ("android.net.wifi.WIFI_STATE_CHANGED".equals(action)) {
            WifiEnabler.access$000(this.this$0, intent.getIntExtra("wifi_state", 4));
        } else if ("android.net.wifi.supplicant.STATE_CHANGE".equals(action)) {
            if (!WifiEnabler.access$100(this.this$0).get()) {
                WifiEnabler.access$200(this.this$0, WifiInfo.getDetailedStateOf((SupplicantState) intent.getParcelableExtra("newState")));
            }
        } else if ("android.net.wifi.STATE_CHANGE".equals(action)) {
            NetworkInfo info = (NetworkInfo) intent.getParcelableExtra("networkInfo");
            WifiEnabler.access$100(this.this$0).set(info.isConnected());
            WifiEnabler.access$200(this.this$0, info.getDetailedState());
        }
    }

    WifiEnabler$1(WifiEnabler wifiEnabler) {
        this.this$0 = wifiEnabler;
    }
}