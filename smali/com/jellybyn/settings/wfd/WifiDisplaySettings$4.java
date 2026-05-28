package com.jellybyn.settings.wfd;

import android.provider.Settings.Global;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;

class WifiDisplaySettings$4 implements OnCheckedChangeListener {
    final /* synthetic */ WifiDisplaySettings this$0;

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        WifiDisplaySettings.access$202(this.this$0, z);
        Global.putInt(WifiDisplaySettings.access$300(this.this$0), "wifi_display_on", z ? 1 : 0);
    }

    WifiDisplaySettings$4(WifiDisplaySettings wifiDisplaySettings) {
        this.this$0 = wifiDisplaySettings;
    }
}