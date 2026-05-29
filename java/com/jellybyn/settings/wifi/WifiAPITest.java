package com.jellybyn.settings.wifi;

import android.app.AlertDialog.Builder;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.widget.EditText;

public class WifiAPITest extends PreferenceActivity implements OnPreferenceClickListener {
    private Preference mWifiDisableNetwork;
    private Preference mWifiDisconnect;
    private Preference mWifiEnableNetwork;
    private WifiManager mWifiManager;
    private int netid;

    public boolean onPreferenceClick(Preference preference) {
        Builder alert;
        EditText input;
        if (preference == this.mWifiDisconnect) {
            this.mWifiManager.disconnect();
        } else if (preference == this.mWifiDisableNetwork) {
            alert = new Builder(this);
            alert.setTitle("Input");
            alert.setMessage("Enter Network ID");
            input = new EditText(this);
            alert.setView(input);
            alert.setPositiveButton("Ok", new 1(this, input));
            alert.setNegativeButton("Cancel", new 2(this));
            alert.show();
        } else if (preference == this.mWifiEnableNetwork) {
            alert = new Builder(this);
            alert.setTitle("Input");
            alert.setMessage("Enter Network ID");
            input = new EditText(this);
            alert.setView(input);
            alert.setPositiveButton("Ok", new 3(this, input));
            alert.setNegativeButton("Cancel", new 2(this));
            alert.show();
        }
        return true;
    }

    private void onCreatePreferences() {
        addPreferencesFromResource(2130968716);
        PreferenceScreen preferenceScreen = getPreferenceScreen();
        this.mWifiDisconnect = preferenceScreen.findPreference("disconnect");
        this.mWifiDisconnect.setOnPreferenceClickListener(this);
        this.mWifiDisableNetwork = preferenceScreen.findPreference("disable_network");
        this.mWifiDisableNetwork.setOnPreferenceClickListener(this);
        this.mWifiEnableNetwork = preferenceScreen.findPreference("enable_network");
        this.mWifiEnableNetwork.setOnPreferenceClickListener(this);
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        onCreatePreferences();
        this.mWifiManager = (WifiManager) getSystemService("wifi");
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        super.onPreferenceTreeClick(preferenceScreen, preference);
        return false;
    }
}