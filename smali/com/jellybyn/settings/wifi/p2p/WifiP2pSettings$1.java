package com.jellybyn.settings.wifi.p2p;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.NetworkInfo;
import android.net.wifi.p2p.WifiP2pDevice;
import android.net.wifi.p2p.WifiP2pDeviceList;
import android.net.wifi.p2p.WifiP2pInfo;

class WifiP2pSettings$1 extends BroadcastReceiver {
    final /* synthetic */ WifiP2pSettings this$0;

    public void onReceive(Context context, Intent intent) {
        boolean z = true;
        String action = intent.getAction();
        if ("android.net.wifi.p2p.STATE_CHANGED".equals(action)) {
            WifiP2pSettings wifiP2pSettings = this.this$0;
            if (intent.getIntExtra("wifi_p2p_state", 1) != 2) {
                z = false;
            }
            WifiP2pSettings.access$002(wifiP2pSettings, z);
            WifiP2pSettings.access$100(this.this$0);
        } else if ("android.net.wifi.p2p.PEERS_CHANGED".equals(action)) {
            WifiP2pSettings.access$202(this.this$0, (WifiP2pDeviceList) intent.getParcelableExtra("wifiP2pDeviceList"));
            WifiP2pSettings.access$300(this.this$0);
        } else if ("android.net.wifi.p2p.CONNECTION_STATE_CHANGE".equals(action)) {
            if (WifiP2pSettings.access$400(this.this$0) != null) {
                NetworkInfo networkInfo = (NetworkInfo) intent.getParcelableExtra("networkInfo");
                WifiP2pInfo wifiP2pInfo = (WifiP2pInfo) intent.getParcelableExtra("wifiP2pInfo");
                if (WifiP2pSettings.access$400(this.this$0) != null) {
                    WifiP2pSettings.access$400(this.this$0).requestGroupInfo(WifiP2pSettings.access$500(this.this$0), this.this$0);
                }
                if (!(networkInfo.isConnected() || WifiP2pSettings.access$600(this.this$0))) {
                    WifiP2pSettings.access$700(this.this$0);
                }
                WifiP2pSettings.access$602(this.this$0, wifiP2pInfo.groupFormed);
            }
        } else if ("android.net.wifi.p2p.THIS_DEVICE_CHANGED".equals(action)) {
            WifiP2pSettings.access$802(this.this$0, (WifiP2pDevice) intent.getParcelableExtra("wifiP2pDevice"));
            WifiP2pSettings.access$900(this.this$0);
        } else if ("android.net.wifi.p2p.DISCOVERY_STATE_CHANGE".equals(action)) {
            if (intent.getIntExtra("discoveryState", 1) == 2) {
                WifiP2pSettings.access$1000(this.this$0, true);
            } else {
                WifiP2pSettings.access$1000(this.this$0, false);
            }
        } else if ("android.net.wifi.p2p.PERSISTENT_GROUPS_CHANGED".equals(action) && WifiP2pSettings.access$400(this.this$0) != null) {
            WifiP2pSettings.access$400(this.this$0).requestPersistentGroupInfo(WifiP2pSettings.access$500(this.this$0), this.this$0);
        }
    }

    WifiP2pSettings$1(WifiP2pSettings wifiP2pSettings) {
        this.this$0 = wifiP2pSettings;
    }
}