package com.jellybyn.settings.widget;

import android.net.wifi.WifiManager;
import android.os.AsyncTask;
import com.jellybyn.settings.widget.SettingsAppWidgetProvider.WifiStateTracker;

class SettingsAppWidgetProvider$WifiStateTracker$1 extends AsyncTask<Void, Void, Void> {
    final /* synthetic */ WifiStateTracker this$0;
    final /* synthetic */ boolean val$desiredState;
    final /* synthetic */ WifiManager val$wifiManager;

    protected Void doInBackground(Void... voidArr) {
        int wifiApState = this.val$wifiManager.getWifiApState();
        if (this.val$desiredState && (wifiApState == 12 || wifiApState == 13)) {
            this.val$wifiManager.setWifiApEnabled(null, false);
        }
        this.val$wifiManager.setWifiEnabled(this.val$desiredState);
        return null;
    }

    SettingsAppWidgetProvider$WifiStateTracker$1(WifiStateTracker wifiStateTracker, WifiManager wifiManager, boolean z) {
        this.this$0 = wifiStateTracker;
        this.val$wifiManager = wifiManager;
        this.val$desiredState = z;
    }
}