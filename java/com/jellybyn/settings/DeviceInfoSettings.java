package com.jellybyn.settings;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.SELinux;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.util.Log;
import android.widget.Toast;
import com.android.internal.app.PlatLogoActivity;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DeviceInfoSettings extends SettingsPreferenceFragment {
    int mDevHitCountdown;
    Toast mDevHitToast;
    long[] mHits = new long[3];

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034126);
        setStringSummary("firmware_version", VERSION.RELEASE);
        findPreference("firmware_version").setEnabled(true);
        setValueSummary("baseband_version", "gsm.version.baseband");
        setStringSummary("device_model", Build.MODEL + getMsvSuffix());
        setValueSummary("fcc_equipment_id", "ro.ril.fccid");
        setStringSummary("device_model", Build.MODEL);
        setStringSummary("build_number", Build.DISPLAY);
        findPreference("build_number").setEnabled(true);
        findPreference("kernel_version").setSummary(getFormattedKernelVersion());
        if (!SELinux.isSELinuxEnabled()) {
            setStringSummary("selinux_status", getResources().getString(2131429065));
        } else if (!SELinux.isSELinuxEnforced()) {
            setStringSummary("selinux_status", getResources().getString(2131429066));
        }
        removePreferenceIfPropertyMissing(getPreferenceScreen(), "selinux_status", "ro.build.selinux");
        removePreferenceIfPropertyMissing(getPreferenceScreen(), "safetylegal", "ro.url.safetylegal");
        removePreferenceIfPropertyMissing(getPreferenceScreen(), "fcc_equipment_id", "ro.ril.fccid");
        if (Utils.isWifiOnly(getActivity())) {
            getPreferenceScreen().removePreference(findPreference("baseband_version"));
        }
        Activity act = getActivity();
        PreferenceGroup parentPreference = (PreferenceGroup) findPreference("container");
        Utils.updatePreferenceToSpecificActivityOrRemove(act, parentPreference, "terms", 1);
        Utils.updatePreferenceToSpecificActivityOrRemove(act, parentPreference, "license", 1);
        Utils.updatePreferenceToSpecificActivityOrRemove(act, parentPreference, "copyright", 1);
        Utils.updatePreferenceToSpecificActivityOrRemove(act, parentPreference, "team", 1);
        parentPreference = getPreferenceScreen();
        if (UserHandle.myUserId() == 0) {
            Utils.updatePreferenceToSpecificActivityOrRemove(act, parentPreference, "system_update_settings", 1);
        } else {
            removePreference("system_update_settings");
        }
        Utils.updatePreferenceToSpecificActivityOrRemove(act, parentPreference, "contributors", 1);
        removePreferenceIfBoolFalse("additional_system_update_settings", 2131296259);
        removePreferenceIfBoolFalse("regulatory_info", 2131296261);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (preference.getKey().equals("firmware_version")) {
            System.arraycopy(this.mHits, 1, this.mHits, 0, this.mHits.length - 1);
            this.mHits[this.mHits.length - 1] = SystemClock.uptimeMillis();
            if (this.mHits[0] >= SystemClock.uptimeMillis() - 500) {
                Intent fileReader = new FileReader("android.intent.action.MAIN");
                fileReader.setClassName("android", PlatLogoActivity.class.getName());
                try {
                    startActivity(fileReader);
                } catch (Exception e) {
                    Log.e("DeviceInfoSettings", "Unable to start activity " + fileReader.toString());
                }
            }
        } else if (preference.getKey().equals("build_number")) {
            if (UserHandle.myUserId() != 0) {
                return true;
            }
            if (this.mDevHitCountdown > 0) {
                this.mDevHitCountdown--;
                if (this.mDevHitCountdown == 0) {
                    getActivity().getSharedPreferences("development", 0).edit().putBoolean("show", true).apply();
                    if (this.mDevHitToast != null) {
                        this.mDevHitToast.cancel();
                    }
                    this.mDevHitToast = Toast.makeText(getActivity(), 2131427340, 1);
                    this.mDevHitToast.show();
                } else if (this.mDevHitCountdown > 0 && this.mDevHitCountdown < 5) {
                    if (this.mDevHitToast != null) {
                        this.mDevHitToast.cancel();
                    }
                    this.mDevHitToast = Toast.makeText(getActivity(), getResources().getQuantityString(2131623936, this.mDevHitCountdown, new Object[]{Integer.valueOf(this.mDevHitCountdown)}), 0);
                    this.mDevHitToast.show();
                }
            } else if (this.mDevHitCountdown < 0) {
                if (this.mDevHitToast != null) {
                    this.mDevHitToast.cancel();
                }
                this.mDevHitToast = Toast.makeText(getActivity(), 2131427341, 1);
                this.mDevHitToast.show();
            }
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    public static String formatKernelVersion(String str) {
        String PROC_VERSION_REGEX = "Linux version (\\S+) \\((\\S+?)\\) (?:\\(gcc.+? \\)) (#\\d+) (?:.*?)?((Sun|Mon|Tue|Wed|Thu|Fri|Sat).+)";
        Matcher m = Pattern.compile("Linux version (\\S+) \\((\\S+?)\\) (?:\\(gcc.+? \\)) (#\\d+) (?:.*?)?((Sun|Mon|Tue|Wed|Thu|Fri|Sat).+)").matcher(str);
        if (!m.matches()) {
            Log.e("DeviceInfoSettings", "Regex did not match on /proc/version: " + str);
            return "Unavailable";
        } else if (m.groupCount() >= 4) {
            return m.group(1) + "\n" + m.group(2) + " " + m.group(3) + "\n" + m.group(4);
        } else {
            Log.e("DeviceInfoSettings", "Regex match on /proc/version only returned " + m.groupCount() + " groups");
            return "Unavailable";
        }
    }

    private String getMsvSuffix() {
        try {
            if (Long.parseLong(readLine("/sys/board_properties/soc/msv"), 16) == 0) {
                return " (ENGINEERING)";
            }
        } catch (IOException e) {
        } catch (NumberFormatException e2) {
        }
        return "";
    }

    public static String getFormattedKernelVersion() {
        try {
            return formatKernelVersion(readLine("/proc/version"));
        } catch (IOException e) {
            Log.e("DeviceInfoSettings", "IO Exception when getting kernel version for Device Info screen", e);
            return "Unavailable";
        }
    }

    private void removePreferenceIfBoolFalse(String str, int i) {
        if (!getResources().getBoolean(i)) {
            Preference findPreference = findPreference(str);
            if (findPreference != null) {
                getPreferenceScreen().removePreference(findPreference);
            }
        }
    }

    private void removePreferenceIfPropertyMissing(PreferenceGroup preferenceGroup, String str, String str2) {
        if (SystemProperties.get(str2).equals("")) {
            try {
                preferenceGroup.removePreference(findPreference(str));
            } catch (RuntimeException e) {
                Log.d("DeviceInfoSettings", "Property '" + str2 + "' missing and no '" + str + "' preference");
            }
        }
    }

    public void onResume() {
        super.onResume();
        this.mDevHitCountdown = getActivity().getSharedPreferences("development", 0).getBoolean("show", Build.TYPE.equals("eng")) ? -1 : 7;
        this.mDevHitToast = null;
    }

    private void setStringSummary(String str, String str2) {
        try {
            findPreference(str).setSummary(str2);
        } catch (RuntimeException e) {
            findPreference(str).setSummary(getResources().getString(2131427339));
        }
    }

    private static String readLine(String str) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(str), 256);
        try {
            String readLine = reader.readLine();
            return readLine;
        } finally {
            reader.close();
        }
    }

    private void setValueSummary(String str, String str2) {
        try {
            findPreference(str).setSummary(SystemProperties.get(str2, getResources().getString(2131427339)));
        } catch (RuntimeException e) {
        }
    }
}