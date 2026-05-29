package com.jellybyn.settings.wifi;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.view.View;
import android.view.View.OnClickListener;

class WifiSettings$4 implements OnClickListener {
    final /* synthetic */ WifiSettings this$0;

    public void onClick(View view) {
        boolean isConnected = false;
        ConnectivityManager connectivity = (ConnectivityManager) this.this$0.getActivity().getSystemService("connectivity");
        if (connectivity != null) {
            NetworkInfo activeNetworkInfo = connectivity.getActiveNetworkInfo();
            isConnected = activeNetworkInfo != null && activeNetworkInfo.isConnected();
        }
        if (isConnected) {
            WifiSettings.access$400(this.this$0, 4);
        } else {
            WifiSettings.access$500(this.this$0, 5);
        }
    }

    WifiSettings$4(WifiSettings wifiSettings) {
        this.this$0 = wifiSettings;
    }
}