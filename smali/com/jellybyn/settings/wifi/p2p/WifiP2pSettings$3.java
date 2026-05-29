package com.jellybyn.settings.wifi.p2p;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class WifiP2pSettings$3 implements OnClickListener {
    final /* synthetic */ WifiP2pSettings this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        if (i == -1 && WifiP2pSettings.access$400(this.this$0) != null) {
            WifiP2pSettings.access$400(this.this$0).removeGroup(WifiP2pSettings.access$500(this.this$0), new 1(this));
        }
    }

    WifiP2pSettings$3(WifiP2pSettings wifiP2pSettings) {
        this.this$0 = wifiP2pSettings;
    }
}