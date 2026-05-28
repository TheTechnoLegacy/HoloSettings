package com.jellybyn.settings.wfd;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.hardware.display.WifiDisplay;

class WifiDisplaySettings$3 implements OnClickListener {
    final /* synthetic */ WifiDisplaySettings this$0;
    final /* synthetic */ WifiDisplay val$display;

    public void onClick(DialogInterface dialogInterface, int i) {
        WifiDisplaySettings.access$100(this.this$0).forgetWifiDisplay(this.val$display.getDeviceAddress());
    }

    WifiDisplaySettings$3(WifiDisplaySettings wifiDisplaySettings, WifiDisplay wifiDisplay) {
        this.this$0 = wifiDisplaySettings;
        this.val$display = wifiDisplay;
    }
}