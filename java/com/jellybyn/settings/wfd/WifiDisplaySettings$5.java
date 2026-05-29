package com.jellybyn.settings.wfd;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.hardware.display.WifiDisplayStatus;

class WifiDisplaySettings$5 extends BroadcastReceiver {
    final /* synthetic */ WifiDisplaySettings this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED")) {
            WifiDisplaySettings.access$002(this.this$0, (WifiDisplayStatus) intent.getParcelableExtra("android.hardware.display.extra.WIFI_DISPLAY_STATUS"));
            WifiDisplaySettings.access$400(this.this$0);
        }
    }

    WifiDisplaySettings$5(WifiDisplaySettings wifiDisplaySettings) {
        this.this$0 = wifiDisplaySettings;
    }
}