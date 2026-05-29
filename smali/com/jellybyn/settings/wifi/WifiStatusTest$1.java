package com.jellybyn.settings.wifi;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.NetworkInfo;
import android.net.wifi.SupplicantState;
import android.util.Log;

class WifiStatusTest$1 extends BroadcastReceiver {
    final /* synthetic */ WifiStatusTest this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.net.wifi.WIFI_STATE_CHANGED")) {
            WifiStatusTest.access$000(this.this$0, intent.getIntExtra("wifi_state", 4));
        } else if (intent.getAction().equals("android.net.wifi.STATE_CHANGE")) {
            WifiStatusTest.access$100(this.this$0, (NetworkInfo) intent.getParcelableExtra("networkInfo"));
        } else if (intent.getAction().equals("android.net.wifi.SCAN_RESULTS")) {
            WifiStatusTest.access$200(this.this$0);
        } else if (!intent.getAction().equals("android.net.wifi.supplicant.CONNECTION_CHANGE")) {
            if (intent.getAction().equals("android.net.wifi.supplicant.STATE_CHANGE")) {
                WifiStatusTest.access$300(this.this$0, (SupplicantState) intent.getParcelableExtra("newState"), intent.hasExtra("supplicantError"), intent.getIntExtra("supplicantError", 0));
            } else if (intent.getAction().equals("android.net.wifi.RSSI_CHANGED")) {
                WifiStatusTest.access$400(this.this$0, intent.getIntExtra("newRssi", 0));
            } else if (!intent.getAction().equals("android.net.wifi.NETWORK_IDS_CHANGED")) {
                Log.e("WifiStatusTest", "Received an unknown Wifi Intent");
            }
        }
    }

    WifiStatusTest$1(WifiStatusTest wifiStatusTest) {
        this.this$0 = wifiStatusTest;
    }
}