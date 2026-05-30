package com.jellybyn.settings;

import android.content.ContentQueryMap;
import android.content.ContentResolver;
import android.content.Intent;
import android.os.UserManager;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.provider.Settings.Global;
import android.provider.Settings.Secure;
import java.util.Observer;

public class LocationSettings extends SettingsPreferenceFragment implements OnPreferenceChangeListener {
    private CheckBoxPreference mAssistedGps;
    private ContentQueryMap mContentQueryMap;
    private CheckBoxPreference mGps;
    private SwitchPreference mLocationAccess;
    private CheckBoxPreference mNetwork;
    private Observer mSettingsObserver;

    private PreferenceScreen createPreferenceHierarchy() {
        PreferenceScreen root = getPreferenceScreen();
        if (root != null) {
            root.removeAll();
        }
        addPreferencesFromResource(2131034132);
        root = getPreferenceScreen();
        this.mLocationAccess = (SwitchPreference) root.findPreference("location_toggle");
        this.mNetwork = (CheckBoxPreference) root.findPreference("location_network");
        this.mGps = (CheckBoxPreference) root.findPreference("location_gps");
        this.mAssistedGps = (CheckBoxPreference) root.findPreference("assisted_gps");
        boolean z = !((UserManager) getActivity().getSystemService("user")).hasUserRestriction("no_share_location");
        if (this.mLocationAccess != null) {
            this.mLocationAccess.setEnabled(z);
        }
        if (this.mNetwork != null) {
            this.mNetwork.setEnabled(z);
        }
        if (this.mGps != null) {
            this.mGps.setEnabled(z);
        }
        if (this.mAssistedGps != null) {
            this.mAssistedGps.setEnabled(z);
        }
        this.mLocationAccess.setOnPreferenceChangeListener(this);
        return root;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        ContentResolver cr = getContentResolver();
        UserManager um = (UserManager) getActivity().getSystemService("user");
        if (preference == this.mNetwork) {
            if (um.hasUserRestriction("no_share_location")) {
                return true;
            }
            Secure.setLocationProviderEnabled(cr, "network", this.mNetwork.isChecked());
            return true;
        } else if (preference == this.mGps) {
            boolean isChecked = this.mGps.isChecked();
            if (um.hasUserRestriction("no_share_location")) {
                return true;
            }
            Secure.setLocationProviderEnabled(cr, "gps", isChecked);
            if (this.mAssistedGps == null) {
                return true;
            }
            this.mAssistedGps.setEnabled(isChecked);
            return true;
        } else if (preference != this.mAssistedGps) {
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        } else {
            Global.putInt(cr, "assisted_gps_enabled", this.mAssistedGps.isChecked() ? 1 : 0);
            return true;
        }
    }

    private void updateLocationToggles() {
        boolean z = true;
        ContentResolver res = getContentResolver();
        boolean gpsEnabled = Secure.isLocationProviderEnabled(res, "gps");
        boolean networkEnabled = Secure.isLocationProviderEnabled(res, "network");
        this.mGps.setChecked(gpsEnabled);
        this.mNetwork.setChecked(networkEnabled);
        SwitchPreference switchPreference = this.mLocationAccess;
        boolean z2 = gpsEnabled || networkEnabled;
        switchPreference.setChecked(z2);
        if (this.mAssistedGps != null) {
            CheckBoxPreference checkBoxPreference = this.mAssistedGps;
            if (Global.getInt(res, "assisted_gps_enabled", 2) != 1) {
                z = false;
            }
            checkBoxPreference.setChecked(z);
            this.mAssistedGps.setEnabled(gpsEnabled);
        }
    }

    private void onToggleLocationAccess(boolean z) {
        if (!((UserManager) getActivity().getSystemService("user")).hasUserRestriction("no_share_location")) {
            ContentResolver cr = getContentResolver();
            Secure.setLocationProviderEnabled(cr, "gps", z);
            Secure.setLocationProviderEnabled(cr, "network", z);
            updateLocationToggles();
        }
    }

    public void onResume() {
        super.onResume();
        createPreferenceHierarchy();
        updateLocationToggles();
        if (this.mSettingsObserver == null) {
            this.mSettingsObserver = new 1(this);
        }
        this.mContentQueryMap.addObserver(this.mSettingsObserver);
    }

    public void onStop() {
        super.onStop();
        if (this.mSettingsObserver != null) {
            this.mContentQueryMap.deleteObserver(this.mSettingsObserver);
        }
        this.mContentQueryMap.close();
    }

    public void onStart() {
        super.onStart();
        this.mContentQueryMap = new ContentQueryMap(getContentResolver().query(Secure.CONTENT_URI, null, "(name=?)", new String[]{"location_providers_allowed"}, null), "name", true, null);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        createPreferenceHierarchy();
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (preference.getKey().equals("location_toggle")) {
            onToggleLocationAccess(((Boolean) obj).booleanValue());
        }
        return true;
    }

    public int getHelpResource() {
        return 2131429127;
    }
}