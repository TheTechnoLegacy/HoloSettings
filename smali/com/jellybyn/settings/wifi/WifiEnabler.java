package com.jellybyn.settings.wifi;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.net.NetworkInfo.DetailedState;
import android.net.wifi.WifiManager;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.Switch;
import android.widget.Toast;
import com.jellybyn.settings.WirelessSettings;
import java.util.concurrent.atomic.AtomicBoolean;

public class WifiEnabler implements OnCheckedChangeListener {
    private AtomicBoolean mConnected = new AtomicBoolean(false);
    private final Context mContext;
    private final IntentFilter mIntentFilter;
    private final BroadcastReceiver mReceiver = new 1(this);
    private boolean mStateMachineEvent;
    private Switch mSwitch;
    private final WifiManager mWifiManager;

    public void setSwitch(Switch switchR) {
        boolean z = false;
        if (this.mSwitch != switchR) {
            this.mSwitch.setOnCheckedChangeListener(null);
            this.mSwitch = switchR;
            this.mSwitch.setOnCheckedChangeListener(this);
            int wifiState = this.mWifiManager.getWifiState();
            boolean isEnabled = wifiState == 3;
            boolean z2 = wifiState == 1;
            this.mSwitch.setChecked(isEnabled);
            Switch switchR2 = this.mSwitch;
            if (isEnabled || z2) {
                z = true;
            }
            switchR2.setEnabled(z);
        }
    }

    private void handleWifiStateChanged(int i) {
        switch (i) {
            case 0:
                this.mSwitch.setEnabled(false);
                return;
            case 1:
                setSwitchChecked(false);
                this.mSwitch.setEnabled(true);
                return;
            case 2:
                this.mSwitch.setEnabled(false);
                return;
            case 3:
                setSwitchChecked(true);
                this.mSwitch.setEnabled(true);
                return;
            default:
                setSwitchChecked(false);
                this.mSwitch.setEnabled(true);
                return;
        }
    }

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        if (!this.mStateMachineEvent) {
            if (z && !WirelessSettings.isRadioAllowed(this.mContext, "wifi")) {
                Toast.makeText(this.mContext, 2131427808, 0).show();
                compoundButton.setChecked(false);
            }
            int wifiApState = this.mWifiManager.getWifiApState();
            if (z && (wifiApState == 12 || wifiApState == 13)) {
                this.mWifiManager.setWifiApEnabled(null, false);
            }
            if (this.mWifiManager.setWifiEnabled(z)) {
                this.mSwitch.setEnabled(false);
            } else {
                Toast.makeText(this.mContext, 2131427807, 0).show();
            }
        }
    }

    public WifiEnabler(Context context, Switch switchR) {
        this.mContext = context;
        this.mSwitch = switchR;
        this.mWifiManager = (WifiManager) context.getSystemService("wifi");
        this.mIntentFilter = new IntentFilter("android.net.wifi.WIFI_STATE_CHANGED");
        this.mIntentFilter.addAction("android.net.wifi.supplicant.STATE_CHANGE");
        this.mIntentFilter.addAction("android.net.wifi.STATE_CHANGE");
    }

    private void setSwitchChecked(boolean z) {
        if (z != this.mSwitch.isChecked()) {
            this.mStateMachineEvent = true;
            this.mSwitch.setChecked(z);
            this.mStateMachineEvent = false;
        }
    }

    public void pause() {
        this.mContext.unregisterReceiver(this.mReceiver);
        this.mSwitch.setOnCheckedChangeListener(null);
    }

    public void resume() {
        this.mContext.registerReceiver(this.mReceiver, this.mIntentFilter);
        this.mSwitch.setOnCheckedChangeListener(this);
    }

    private void handleStateChanged(DetailedState detailedState) {
    }
}