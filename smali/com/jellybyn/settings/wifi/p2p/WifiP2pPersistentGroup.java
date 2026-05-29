package com.jellybyn.settings.wifi.p2p;

import android.content.Context;
import android.net.wifi.p2p.WifiP2pGroup;
import android.preference.Preference;
import android.view.View;

public class WifiP2pPersistentGroup extends Preference {
    public WifiP2pGroup mGroup;

    public WifiP2pPersistentGroup(Context context, WifiP2pGroup wifiP2pGroup) {
        super(context);
        this.mGroup = wifiP2pGroup;
    }

    protected void onBindView(View view) {
        setTitle(this.mGroup.getNetworkName());
        super.onBindView(view);
    }

    int getNetworkId() {
        return this.mGroup.getNetworkId();
    }
}