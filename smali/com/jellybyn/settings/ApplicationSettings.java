package com.jellybyn.settings;

import android.content.Intent;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.provider.Settings.Global;
import android.provider.Settings.Secure;

public class ApplicationSettings extends SettingsPreferenceFragment {
    private ListPreference mInstallLocation;
    private CheckBoxPreference mToggleAdvancedSettings;

    public void onCreate(Bundle bundle) {
        boolean userSetInstLocation = false;
        super.onCreate(bundle);
        addPreferencesFromResource(2131034118);
        this.mToggleAdvancedSettings = (CheckBoxPreference) findPreference("toggle_advanced_settings");
        this.mToggleAdvancedSettings.setChecked(isAdvancedSettingsEnabled());
        getPreferenceScreen().removePreference(this.mToggleAdvancedSettings);
        this.mInstallLocation = (ListPreference) findPreference("app_install_location");
        if (Global.getInt(getContentResolver(), "set_install_location", 0) != 0) {
            userSetInstLocation = true;
        }
        if (userSetInstLocation) {
            this.mInstallLocation.setValue(getAppInstallLocation());
            this.mInstallLocation.setOnPreferenceChangeListener(new 1(this));
            return;
        }
        getPreferenceScreen().removePreference(this.mInstallLocation);
    }

    private String getAppInstallLocation() {
        int selectedLocation = Global.getInt(getContentResolver(), "default_install_location", 0);
        if (selectedLocation == 1) {
            return "device";
        }
        if (selectedLocation == 2) {
            return "sdcard";
        }
        return selectedLocation == 0 ? "auto" : "auto";
    }

    protected void handleUpdateAppInstallLocation(String str) {
        if ("device".equals(str)) {
            Secure.putInt(getContentResolver(), "default_install_location", 1);
        } else if ("sdcard".equals(str)) {
            Secure.putInt(getContentResolver(), "default_install_location", 2);
        } else if ("auto".equals(str)) {
            Secure.putInt(getContentResolver(), "default_install_location", 0);
        } else {
            Secure.putInt(getContentResolver(), "default_install_location", 0);
        }
        this.mInstallLocation.setValue(str);
    }

    private void setAdvancedSettingsEnabled(boolean z) {
        int i = z ? 1 : 0;
        Secure.putInt(getContentResolver(), "advanced_settings", i);
        Intent intent = new Intent("android.intent.action.ADVANCED_SETTINGS");
        intent.putExtra("state", i);
        getActivity().sendBroadcast(intent);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (preference == this.mToggleAdvancedSettings) {
            setAdvancedSettingsEnabled(this.mToggleAdvancedSettings.isChecked());
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    private boolean isAdvancedSettingsEnabled() {
        return Global.getInt(getContentResolver(), "advanced_settings", 0) > 0;
    }
}