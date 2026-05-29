package com.jellybyn.settings.wfd;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.hardware.display.WifiDisplay;

class WifiDisplaySettings$1 implements OnClickListener {
    final /* synthetic */ WifiDisplaySettings this$0;
    final /* synthetic */ WifiDisplay val$display;

    public void onClick(DialogInterface dialogInterface, int i) {
        if (this.val$display.equals(WifiDisplaySettings.access$000(this.this$0).getActiveDisplay())) {
            WifiDisplaySettings.access$100(this.this$0).disconnectWifiDisplay();
        }
    }

    WifiDisplaySettings$1(WifiDisplaySettings wifiDisplaySettings, WifiDisplay wifiDisplay) {
        this.this$0 = wifiDisplaySettings;
        this.val$display = wifiDisplay;
    }
}