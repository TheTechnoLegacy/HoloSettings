package com.jellybyn.settings.net;

import android.content.Context;
import android.net.NetworkPolicy;
import android.net.NetworkPolicyManager;
import android.net.NetworkTemplate;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import com.jellybyn.settings.DataUsageSummary;
import com.jellybyn.settings.SettingsPreferenceFragment;

public class DataUsageMeteredSettings extends SettingsPreferenceFragment {
    private PreferenceCategory mMobileCategory;
    private NetworkPolicyEditor mPolicyEditor;
    private NetworkPolicyManager mPolicyManager;
    private PreferenceCategory mWifiCategory;
    private Preference mWifiDisabled;
    private WifiManager mWifiManager;

    private class MeteredPreference extends CheckBoxPreference {
        private boolean mBinding = true;
        private final NetworkTemplate mTemplate;

        public MeteredPreference(Context context, NetworkTemplate networkTemplate) {
            super(context);
            this.mTemplate = networkTemplate;
            setPersistent(false);
            NetworkPolicy policy = DataUsageMeteredSettings.this.mPolicyEditor.getPolicyMaybeUnquoted(networkTemplate);
            if (policy == null) {
                setChecked(false);
            } else if (policy.limitBytes != -1) {
                setChecked(true);
                setEnabled(false);
            } else {
                setChecked(policy.metered);
            }
            this.mBinding = false;
        }

        protected void notifyChanged() {
            super.notifyChanged();
            if (!this.mBinding) {
                DataUsageMeteredSettings.this.mPolicyEditor.setPolicyMetered(this.mTemplate, isChecked());
            }
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Context context = getActivity();
        this.mPolicyManager = NetworkPolicyManager.from(context);
        this.mWifiManager = (WifiManager) context.getSystemService("wifi");
        this.mPolicyEditor = new NetworkPolicyEditor(this.mPolicyManager);
        this.mPolicyEditor.read();
        addPreferencesFromResource(2131034122);
        this.mMobileCategory = (PreferenceCategory) findPreference("mobile");
        this.mWifiCategory = (PreferenceCategory) findPreference("wifi");
        this.mWifiDisabled = findPreference("wifi_disabled");
        updateNetworks(context);
    }

    private void updateNetworks(Context context) {
        getPreferenceScreen().removePreference(this.mMobileCategory);
        this.mWifiCategory.removeAll();
        if (DataUsageSummary.hasWifiRadio(context) && this.mWifiManager.isWifiEnabled()) {
            for (WifiConfiguration wifiConfiguration : this.mWifiManager.getConfiguredNetworks()) {
                if (wifiConfiguration.SSID != null) {
                    this.mWifiCategory.addPreference(buildWifiPref(context, wifiConfiguration));
                }
            }
            return;
        }
        this.mWifiCategory.addPreference(this.mWifiDisabled);
    }

    private Preference buildWifiPref(Context context, WifiConfiguration wifiConfiguration) {
        String networkId = wifiConfiguration.SSID;
        MeteredPreference pref = new MeteredPreference(context, NetworkTemplate.buildTemplateWifi(networkId));
        pref.setTitle(WifiInfo.removeDoubleQuotes(networkId));
        return pref;
    }
}