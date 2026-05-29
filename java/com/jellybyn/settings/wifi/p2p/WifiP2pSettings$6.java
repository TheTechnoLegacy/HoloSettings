package com.jellybyn.settings.wifi.p2p;

import android.net.wifi.p2p.WifiP2pManager.ActionListener;
import android.util.Log;
import android.widget.Toast;

class WifiP2pSettings$6 implements ActionListener {
    final /* synthetic */ WifiP2pSettings this$0;

    public void onFailure(int i) {
        Log.e("WifiP2pSettings", " connect fail " + i);
        Toast.makeText(this.this$0.getActivity(), 2131427940, 0).show();
    }

    WifiP2pSettings$6(WifiP2pSettings wifiP2pSettings) {
        this.this$0 = wifiP2pSettings;
    }

    public void onSuccess() {
    }
}