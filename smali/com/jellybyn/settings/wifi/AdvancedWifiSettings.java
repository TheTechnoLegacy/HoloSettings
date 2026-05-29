package com.jellybyn.settings.wifi;

import android.content.ContentResolver;
import android.content.Intent;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceScreen;
import android.provider.Settings.Global;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;
import com.jellybyn.settings.SettingsPreferenceFragment;
import com.jellybyn.settings.Utils;

public class AdvancedWifiSettings extends SettingsPreferenceFragment implements OnPreferenceChangeListener {
    private WifiManager mWifiManager;

    private void initPreferences() {
        boolean z = true;
        CheckBoxPreference notifyOpenNetworks = (CheckBoxPreference) findPreference("notify_open_networks");
        notifyOpenNetworks.setChecked(Global.getInt(getContentResolver(), "wifi_networks_available_notification_on", 0) == 1);
        notifyOpenNetworks.setEnabled(this.mWifiManager.isWifiEnabled());
        CheckBoxPreference poorNetworkDetection = (CheckBoxPreference) findPreference("wifi_poor_network_detection");
        if (poorNetworkDetection != null) {
            if (Utils.isWifiOnly(getActivity())) {
                getPreferenceScreen().removePreference(poorNetworkDetection);
            } else {
                poorNetworkDetection.setChecked(Global.getInt(getContentResolver(), "wifi_watchdog_poor_network_test_enabled", 0) == 1);
            }
        }
        ((CheckBoxPreference) findPreference("wifi_scan_always_available")).setChecked(Global.getInt(getContentResolver(), "wifi_scan_always_enabled", 0) == 1);
        Intent intent = new Intent("android.credentials.INSTALL_AS_USER");
        intent.setClassName("com.android.certinstaller", "com.android.certinstaller.CertInstallerMain");
        intent.putExtra("install_as_uid", 1010);
        findPreference("install_credentials").setIntent(intent);
        CheckBoxPreference suspendOptimizations = (CheckBoxPreference) findPreference("suspend_optimizations");
        if (Global.getInt(getContentResolver(), "wifi_suspend_optimizations_enabled", 1) != 1) {
            z = false;
        }
        suspendOptimizations.setChecked(z);
        ListPreference frequencyPref = (ListPreference) findPreference("frequency_band");
        if (this.mWifiManager.isDualBandSupported()) {
            frequencyPref.setOnPreferenceChangeListener(this);
            int frequencyBand = this.mWifiManager.getFrequencyBand();
            if (frequencyBand != -1) {
                frequencyPref.setValue(String.valueOf(frequencyBand));
                updateFrequencyBandSummary(frequencyPref, frequencyBand);
            } else {
                Log.e("AdvancedWifiSettings", "Failed to fetch frequency band");
            }
        } else if (frequencyPref != null) {
            getPreferenceScreen().removePreference(frequencyPref);
        }
        ListPreference listPreference = (ListPreference) findPreference("sleep_policy");
        if (listPreference != null) {
            if (Utils.isWifiOnly(getActivity())) {
                listPreference.setEntries(2131165211);
            }
            listPreference.setOnPreferenceChangeListener(this);
            String valueOf = String.valueOf(Global.getInt(getContentResolver(), "wifi_sleep_policy", 2));
            listPreference.setValue(valueOf);
            updateSleepPolicySummary(listPreference, valueOf);
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        String key = preference.getKey();
        if ("frequency_band".equals(key)) {
            try {
                int parseInt = Integer.parseInt((String) obj);
                this.mWifiManager.setFrequencyBand(parseInt, true);
                updateFrequencyBandSummary(preference, parseInt);
            } catch (NumberFormatException e) {
                Toast.makeText(getActivity(), 2131427914, 0).show();
                return false;
            }
        }
        if ("sleep_policy".equals(key)) {
            try {
                String str = (String) obj;
                Global.putInt(getContentResolver(), "wifi_sleep_policy", Integer.parseInt(str));
                updateSleepPolicySummary(preference, str);
            } catch (NumberFormatException e2) {
                Toast.makeText(getActivity(), 2131427821, 0).show();
                return false;
            }
        }
        return true;
    }

    private void updateSleepPolicySummary(Preference preference, String str) {
        if (str != null) {
            String[] stringArray = getResources().getStringArray(2131165212);
            String[] stringArray2 = getResources().getStringArray(Utils.isWifiOnly(getActivity()) ? 2131165211 : 2131165210);
            int i = 0;
            while (i < stringArray.length) {
                if (!str.equals(stringArray[i]) || i >= stringArray2.length) {
                    i++;
                } else {
                    preference.setSummary(stringArray2[i]);
                    return;
                }
            }
        }
        preference.setSummary("");
        Log.e("AdvancedWifiSettings", "Invalid sleep policy value: " + str);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        int i = 0;
        String key = preference.getKey();
        ContentResolver contentResolver;
        String str;
        if ("notify_open_networks".equals(key)) {
            contentResolver = getContentResolver();
            str = "wifi_networks_available_notification_on";
            if (((CheckBoxPreference) preference).isChecked()) {
                i = 1;
            }
            Global.putInt(contentResolver, str, i);
            return true;
        } else if ("wifi_poor_network_detection".equals(key)) {
            contentResolver = getContentResolver();
            str = "wifi_watchdog_poor_network_test_enabled";
            if (((CheckBoxPreference) preference).isChecked()) {
                i = 1;
            }
            Global.putInt(contentResolver, str, i);
            return true;
        } else if ("suspend_optimizations".equals(key)) {
            contentResolver = getContentResolver();
            str = "wifi_suspend_optimizations_enabled";
            if (((CheckBoxPreference) preference).isChecked()) {
                i = 1;
            }
            Global.putInt(contentResolver, str, i);
            return true;
        } else if (!"wifi_scan_always_available".equals(key)) {
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        } else {
            contentResolver = getContentResolver();
            str = "wifi_scan_always_enabled";
            if (((CheckBoxPreference) preference).isChecked()) {
                i = 1;
            }
            Global.putInt(contentResolver, str, i);
            return true;
        }
    }

    private void refreshWifiInfo() {
        WifiInfo wifiInfo = this.mWifiManager.getConnectionInfo();
        Preference wifiMacAddressPref = findPreference("mac_address");
        String macAddress = wifiInfo == null ? null : wifiInfo.getMacAddress();
        if (TextUtils.isEmpty(macAddress)) {
            macAddress = getActivity().getString(2131428111);
        }
        wifiMacAddressPref.setSummary(macAddress);
        Preference findPreference = findPreference("current_ip_address");
        CharSequence wifiIpAddresses = Utils.getWifiIpAddresses(getActivity());
        if (wifiIpAddresses == null) {
            wifiIpAddresses = getActivity().getString(2131428111);
        }
        findPreference.setSummary(wifiIpAddresses);
    }

    public void onResume() {
        super.onResume();
        initPreferences();
        refreshWifiInfo();
    }

    private void updateFrequencyBandSummary(Preference preference, int i) {
        preference.setSummary(getResources().getStringArray(2131165213)[i]);
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mWifiManager = (WifiManager) getSystemService("wifi");
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034165);
    }
}