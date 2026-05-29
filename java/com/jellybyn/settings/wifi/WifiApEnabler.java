package com.jellybyn.settings.wifi;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.preference.CheckBoxPreference;
import android.provider.Settings.Global;
import android.provider.Settings.SettingNotFoundException;

public class WifiApEnabler {
    private final CheckBoxPreference mCheckBox;
    ConnectivityManager mCm;
    private final Context mContext;
    private final IntentFilter mIntentFilter;
    private final CharSequence mOriginalSummary;
    private final BroadcastReceiver mReceiver = new 1(this);
    private WifiManager mWifiManager;
    private String[] mWifiRegexs;

    private void updateTetherState(Object[] objArr, Object[] objArr2, Object[] objArr3) {
        String str;
        boolean wifiTethered = false;
        boolean wifiErrored = false;
        for (Object obj : objArr2) {
            str = (String) obj;
            for (String matches : this.mWifiRegexs) {
                if (str.matches(matches)) {
                    wifiTethered = true;
                }
            }
        }
        for (Object obj2 : objArr3) {
            str = (String) obj2;
            for (String matches2 : this.mWifiRegexs) {
                if (str.matches(matches2)) {
                    wifiErrored = true;
                }
            }
        }
        if (wifiTethered) {
            updateConfigSummary(this.mWifiManager.getWifiApConfiguration());
        } else if (wifiErrored) {
            this.mCheckBox.setSummary(2131427807);
        }
    }

    public void setSoftapEnabled(boolean z) {
        ContentResolver cr = this.mContext.getContentResolver();
        int wifiState = this.mWifiManager.getWifiState();
        if (z && (wifiState == 2 || wifiState == 3)) {
            this.mWifiManager.setWifiEnabled(false);
            Global.putInt(cr, "wifi_saved_state", 1);
        }
        if (this.mWifiManager.setWifiApEnabled(null, z)) {
            this.mCheckBox.setEnabled(false);
        } else {
            this.mCheckBox.setSummary(2131427807);
        }
        if (!z) {
            int wifiSavedState = 0;
            try {
                wifiSavedState = Global.getInt(cr, "wifi_saved_state");
            } catch (SettingNotFoundException e) {
            }
            if (wifiSavedState == 1) {
                this.mWifiManager.setWifiEnabled(true);
                Global.putInt(cr, "wifi_saved_state", 0);
            }
        }
    }

    private void handleWifiApStateChanged(int i) {
        switch (i) {
            case 10:
                this.mCheckBox.setSummary(2131427950);
                this.mCheckBox.setEnabled(false);
                return;
            case 11:
                this.mCheckBox.setChecked(false);
                this.mCheckBox.setSummary(this.mOriginalSummary);
                enableWifiCheckBox();
                return;
            case 12:
                this.mCheckBox.setSummary(2131427949);
                this.mCheckBox.setEnabled(false);
                return;
            case 13:
                this.mCheckBox.setChecked(true);
                this.mCheckBox.setEnabled(true);
                return;
            default:
                this.mCheckBox.setChecked(false);
                this.mCheckBox.setSummary(2131427807);
                enableWifiCheckBox();
                return;
        }
    }

    public WifiApEnabler(Context context, CheckBoxPreference checkBoxPreference) {
        this.mContext = context;
        this.mCheckBox = checkBoxPreference;
        this.mOriginalSummary = checkBoxPreference.getSummary();
        checkBoxPreference.setPersistent(false);
        this.mWifiManager = (WifiManager) context.getSystemService("wifi");
        this.mCm = (ConnectivityManager) this.mContext.getSystemService("connectivity");
        this.mWifiRegexs = this.mCm.getTetherableWifiRegexs();
        this.mIntentFilter = new IntentFilter("android.net.wifi.WIFI_AP_STATE_CHANGED");
        this.mIntentFilter.addAction("android.net.conn.TETHER_STATE_CHANGED");
        this.mIntentFilter.addAction("android.intent.action.AIRPLANE_MODE");
    }

    private void enableWifiCheckBox() {
        if (Global.getInt(this.mContext.getContentResolver(), "airplane_mode_on", 0) != 0) {
            this.mCheckBox.setSummary(this.mOriginalSummary);
            this.mCheckBox.setEnabled(false);
            return;
        }
        this.mCheckBox.setEnabled(true);
    }

    public void updateConfigSummary(WifiConfiguration wifiConfiguration) {
        String s = this.mContext.getString(17040436);
        CheckBoxPreference checkBoxPreference = this.mCheckBox;
        String string = this.mContext.getString(2131427951);
        Object[] objArr = new Object[1];
        if (wifiConfiguration != null) {
            s = wifiConfiguration.SSID;
        }
        objArr[0] = s;
        checkBoxPreference.setSummary(String.format(string, objArr));
    }

    public void resume() {
        this.mContext.registerReceiver(this.mReceiver, this.mIntentFilter);
        enableWifiCheckBox();
    }

    public void pause() {
        this.mContext.unregisterReceiver(this.mReceiver);
    }
}