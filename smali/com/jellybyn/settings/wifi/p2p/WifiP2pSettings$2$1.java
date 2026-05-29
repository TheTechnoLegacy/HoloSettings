package com.jellybyn.settings.wifi.p2p;

import android.net.wifi.p2p.WifiP2pManager.ActionListener;
import android.widget.Toast;
import com.jellybyn.settings.wifi.p2p.WifiP2pSettings.2;

class WifiP2pSettings$2$1 implements ActionListener {
    final /* synthetic */ 2 this$1;

    public void onFailure(int i) {
        Toast.makeText(this.this$1.this$0.getActivity(), 2131427941, 1).show();
    }

    WifiP2pSettings$2$1(2 2) {
        this.this$1 = 2;
    }

    public void onSuccess() {
    }
}