package com.jellybyn.settings.wifi;

import android.view.View;
import android.view.View.OnClickListener;

class WifiSettings$2 implements OnClickListener {
    final /* synthetic */ WifiSettings this$0;

    public void onClick(View view) {
        if (WifiSettings.access$200(this.this$0).isWifiEnabled()) {
            this.this$0.onAddNetworkPressed();
        }
    }

    WifiSettings$2(WifiSettings wifiSettings) {
        this.this$0 = wifiSettings;
    }
}