package com.jellybyn.settings.wifi;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class WifiSettings$1 extends BroadcastReceiver {
    final /* synthetic */ WifiSettings this$0;

    public void onReceive(Context context, Intent intent) {
        WifiSettings.access$000(this.this$0, context, intent);
    }

    WifiSettings$1(WifiSettings wifiSettings) {
        this.this$0 = wifiSettings;
    }
}