package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.hardware.display.WifiDisplayStatus;

class DisplaySettings$3 extends BroadcastReceiver {
    final /* synthetic */ DisplaySettings this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED")) {
            DisplaySettings.access$202(this.this$0, (WifiDisplayStatus) intent.getParcelableExtra("android.hardware.display.extra.WIFI_DISPLAY_STATUS"));
            DisplaySettings.access$300(this.this$0);
        }
    }

    DisplaySettings$3(DisplaySettings displaySettings) {
        this.this$0 = displaySettings;
    }
}