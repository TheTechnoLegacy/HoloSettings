package com.jellybyn.settings.deviceinfo;

import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.hardware.usb.UsbManager;
import android.os.Bundle;
import android.os.UserManager;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.util.Log;
import com.jellybyn.settings.SettingsPreferenceFragment;
import com.jellybyn.settings.Utils;

public class UsbSettings extends SettingsPreferenceFragment {
    private CheckBoxPreference mMtp;
    private CheckBoxPreference mPtp;
    private final BroadcastReceiver mStateReceiver = new 1(this);
    private boolean mUsbAccessoryMode;
    private UsbManager mUsbManager;

    private void updateToggles(String str) {
        if ("mtp".equals(str)) {
            this.mMtp.setChecked(true);
            this.mPtp.setChecked(false);
        } else if ("ptp".equals(str)) {
            this.mMtp.setChecked(false);
            this.mPtp.setChecked(true);
        } else {
            this.mMtp.setChecked(false);
            this.mPtp.setChecked(false);
        }
        if (((UserManager) getActivity().getSystemService("user")).hasUserRestriction("no_usb_file_transfer")) {
            Log.e("UsbSettings", "USB is locked down");
            this.mMtp.setEnabled(false);
            this.mPtp.setEnabled(false);
        } else if (this.mUsbAccessoryMode) {
            Log.e("UsbSettings", "USB Accessory Mode");
            this.mMtp.setEnabled(false);
            this.mPtp.setEnabled(false);
        } else {
            Log.e("UsbSettings", "USB Normal Mode");
            this.mMtp.setEnabled(true);
            this.mPtp.setEnabled(true);
        }
    }

    private PreferenceScreen createPreferenceHierarchy() {
        PreferenceScreen root = getPreferenceScreen();
        if (root != null) {
            root.removeAll();
        }
        addPreferencesFromResource(2131034159);
        root = getPreferenceScreen();
        this.mMtp = (CheckBoxPreference) root.findPreference("usb_mtp");
        this.mPtp = (CheckBoxPreference) root.findPreference("usb_ptp");
        if (((UserManager) getActivity().getSystemService("user")).hasUserRestriction("no_usb_file_transfer")) {
            this.mMtp.setEnabled(false);
            this.mPtp.setEnabled(false);
        }
        return root;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (!(Utils.isMonkeyRunning() || ((UserManager) getActivity().getSystemService("user")).hasUserRestriction("no_usb_file_transfer"))) {
            String function = "none";
            if (preference == this.mMtp && this.mMtp.isChecked()) {
                function = "mtp";
            } else if (preference == this.mPtp && this.mPtp.isChecked()) {
                function = "ptp";
            }
            this.mUsbManager.setCurrentFunction(function, true);
            updateToggles(function);
        }
        return true;
    }

    public void onResume() {
        super.onResume();
        createPreferenceHierarchy();
        getActivity().registerReceiver(this.mStateReceiver, new IntentFilter("android.hardware.usb.action.USB_STATE"));
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mUsbManager = (UsbManager) getSystemService("usb");
    }

    public void onPause() {
        super.onPause();
        getActivity().unregisterReceiver(this.mStateReceiver);
    }
}