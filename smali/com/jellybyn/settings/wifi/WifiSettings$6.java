package com.jellybyn.settings.wifi;

import android.app.Activity;
import android.net.wifi.WifiManager.ActionListener;
import android.widget.Toast;

class WifiSettings$6 implements ActionListener {
    final /* synthetic */ WifiSettings this$0;

    public void onFailure(int i) {
        Activity activity = this.this$0.getActivity();
        if (activity != null) {
            Toast.makeText(activity, 2131427904, 0).show();
        }
    }

    WifiSettings$6(WifiSettings wifiSettings) {
        this.this$0 = wifiSettings;
    }

    public void onSuccess() {
    }
}