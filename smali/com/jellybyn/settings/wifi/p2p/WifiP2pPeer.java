package com.jellybyn.settings.wifi.p2p;

import android.content.Context;
import android.net.wifi.WifiManager;
import android.net.wifi.p2p.WifiP2pDevice;
import android.preference.Preference;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;

public class WifiP2pPeer extends Preference {
    private static final int[] STATE_SECURED = new int[]{2130771968};
    public WifiP2pDevice device;
    private int mRssi = 60;
    private ImageView mSignal;

    protected void onBindView(View view) {
        if (TextUtils.isEmpty(this.device.deviceName)) {
            setTitle(this.device.deviceAddress);
        } else {
            setTitle(this.device.deviceName);
        }
        this.mSignal = (ImageView) view.findViewById(2131230965);
        if (this.mRssi == Integer.MAX_VALUE) {
            this.mSignal.setImageDrawable(null);
        } else {
            this.mSignal.setImageResource(2130837673);
            this.mSignal.setImageState(STATE_SECURED, true);
        }
        refresh();
        super.onBindView(view);
    }

    public int compareTo(Preference preference) {
        if (!(preference instanceof WifiP2pPeer)) {
            return 1;
        }
        WifiP2pPeer other = (WifiP2pPeer) preference;
        return this.device.status != other.device.status ? this.device.status < other.device.status ? -1 : 1 : this.device.deviceName != null ? this.device.deviceName.compareToIgnoreCase(other.device.deviceName) : this.device.deviceAddress.compareToIgnoreCase(other.device.deviceAddress);
    }

    private void refresh() {
        if (this.mSignal != null) {
            Context context = getContext();
            this.mSignal.setImageLevel(getLevel());
            setSummary(context.getResources().getStringArray(2131165207)[this.device.status]);
        }
    }

    public WifiP2pPeer(Context context, WifiP2pDevice wifiP2pDevice) {
        super(context);
        this.device = wifiP2pDevice;
        setWidgetLayoutResource(2130968678);
    }

    int getLevel() {
        return this.mRssi == Integer.MAX_VALUE ? -1 : WifiManager.calculateSignalLevel(this.mRssi, 4);
    }
}