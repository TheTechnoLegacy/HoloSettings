package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.admin.DevicePolicyManager;
import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.UserHandle;
import android.os.UserManager;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.provider.Settings.Global;
import android.provider.Settings.Secure;
import android.security.KeyStore;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.android.internal.widget.LockPatternUtils;
import java.util.ArrayList;

public class SecuritySettings extends SettingsPreferenceFragment implements OnClickListener, OnPreferenceChangeListener {
    private CheckBoxPreference mBiometricWeakLiveliness;
    private ChooseLockSettingsHelper mChooseLockSettingsHelper;
    DevicePolicyManager mDPM;
    private boolean mIsPrimary;
    private KeyStore mKeyStore;
    private ListPreference mLockAfter;
    private LockPatternUtils mLockPatternUtils;
    private Preference mNotificationAccess;
    private PackageManager mPM;
    private CheckBoxPreference mPowerButtonInstantlyLocks;
    private Preference mResetCredentials;
    private CheckBoxPreference mShowPassword;
    private CheckBoxPreference mToggleAppInstallation;
    private CheckBoxPreference mToggleVerifyApps;
    private CheckBoxPreference mVisiblePattern;
    private DialogInterface mWarnInstallApps;

    private PreferenceScreen createPreferenceHierarchy() {
        PreferenceScreen root = getPreferenceScreen();
        if (root != null) {
            root.removeAll();
        }
        addPreferencesFromResource(2131034137);
        root = getPreferenceScreen();
        int resid = 0;
        if (!this.mLockPatternUtils.isSecure()) {
            resid = ((((UserManager) getSystemService("user")).getUsers(true).size() == 1 ? 1 : null) == null || !this.mLockPatternUtils.isLockScreenDisabled()) ? 2131034139 : 2131034141;
        } else if (!this.mLockPatternUtils.usingBiometricWeak() || !this.mLockPatternUtils.isBiometricWeakInstalled()) {
            switch (this.mLockPatternUtils.getKeyguardStoredPasswordQuality()) {
                case 65536:
                    resid = 2131034144;
                    break;
                case 131072:
                    resid = 2131034146;
                    break;
                case 262144:
                case 327680:
                case 393216:
                    resid = 2131034143;
                    break;
                default:
                    break;
            }
        } else {
            resid = 2131034138;
        }
        addPreferencesFromResource(resid);
        DevicePolicyManager dpm = (DevicePolicyManager) getSystemService("device_policy");
        this.mIsPrimary = UserHandle.myUserId() == 0;
        if (!this.mIsPrimary) {
            Preference findPreference = findPreference("owner_info_settings");
            if (findPreference != null) {
                if (UserManager.get(getActivity()).isLinkedUser()) {
                    findPreference.setTitle(2131427610);
                } else {
                    findPreference.setTitle(2131427608);
                }
            }
        }
        if (this.mIsPrimary) {
            switch (dpm.getStorageEncryptionStatus()) {
                case 1:
                    addPreferencesFromResource(2131034147);
                    break;
                case 3:
                    addPreferencesFromResource(2131034140);
                    break;
            }
        }
        this.mLockAfter = (ListPreference) root.findPreference("lock_after_timeout");
        if (this.mLockAfter != null) {
            setupLockAfterPreference();
            updateLockAfterPreferenceSummary();
        }
        this.mBiometricWeakLiveliness = (CheckBoxPreference) root.findPreference("biometric_weak_liveliness");
        this.mVisiblePattern = (CheckBoxPreference) root.findPreference("visiblepattern");
        this.mPowerButtonInstantlyLocks = (CheckBoxPreference) root.findPreference("power_button_instantly_locks");
        if (resid == 2131034138 && this.mLockPatternUtils.getKeyguardStoredPasswordQuality() != 65536) {
            PreferenceGroup preferenceGroup = (PreferenceGroup) root.findPreference("security_category");
            if (!(preferenceGroup == null || this.mVisiblePattern == null)) {
                preferenceGroup.removePreference(root.findPreference("visiblepattern"));
            }
        }
        addPreferencesFromResource(2131034142);
        TelephonyManager tm = TelephonyManager.getDefault();
        if (!this.mIsPrimary || !tm.hasIccCard()) {
            root.removePreference(root.findPreference("sim_lock"));
        } else if (TelephonyManager.getDefault().getSimState() == 1 || TelephonyManager.getDefault().getSimState() == 0) {
            root.findPreference("sim_lock").setEnabled(false);
        }
        this.mShowPassword = (CheckBoxPreference) root.findPreference("show_password");
        if (((UserManager) getActivity().getSystemService("user")).hasUserRestriction("no_config_credentials")) {
            removePreference("credentials_management");
        } else {
            this.mKeyStore = KeyStore.getInstance();
            root.findPreference("credential_storage_type").setSummary(this.mKeyStore.isHardwareBacked() ? 2131428765 : 2131428766);
            this.mResetCredentials = root.findPreference("reset_credentials");
        }
        PreferenceGroup deviceAdminCategory = (PreferenceGroup) root.findPreference("device_admin_category");
        this.mToggleAppInstallation = (CheckBoxPreference) findPreference("toggle_install_applications");
        this.mToggleAppInstallation.setChecked(isNonMarketAppsAllowed());
        this.mToggleAppInstallation.setEnabled(this.mIsPrimary);
        this.mToggleVerifyApps = (CheckBoxPreference) findPreference("toggle_verify_applications");
        if (this.mIsPrimary && showVerifierSetting()) {
            if (isVerifierInstalled()) {
                this.mToggleVerifyApps.setChecked(isVerifyAppsEnabled());
            } else {
                this.mToggleVerifyApps.setChecked(false);
                this.mToggleVerifyApps.setEnabled(false);
            }
        } else if (deviceAdminCategory != null) {
            deviceAdminCategory.removePreference(this.mToggleVerifyApps);
        } else {
            this.mToggleVerifyApps.setEnabled(false);
        }
        this.mNotificationAccess = findPreference("manage_notification_access");
        if (this.mNotificationAccess != null) {
            if (NotificationAccessSettings.getListenersCount(this.mPM) != 0) {
                int n = getNumEnabledNotificationListeners();
                if (n == 0) {
                    this.mNotificationAccess.setSummary(getResources().getString(2131427690));
                } else {
                    this.mNotificationAccess.setSummary(String.format(getResources().getQuantityString(2131623943, n, new Object[]{Integer.valueOf(n)}), new Object[0]));
                }
            } else if (deviceAdminCategory != null) {
                deviceAdminCategory.removePreference(this.mNotificationAccess);
            }
        }
        return root;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        int i = 0;
        String key = preference.getKey();
        LockPatternUtils lockPatternUtils = this.mChooseLockSettingsHelper.utils();
        ContentResolver contentResolver;
        String str;
        if ("unlock_set_or_change".equals(key)) {
            startFragment(this, "com.jellybyn.settings.ChooseLockGeneric$ChooseLockGenericFragment", 123, null);
            return true;
        } else if ("biometric_weak_improve_matching".equals(key)) {
            if (new ChooseLockSettingsHelper(getActivity(), this).launchConfirmationActivity(124, null, null)) {
                return true;
            }
            startBiometricWeakImprove();
            return true;
        } else if ("biometric_weak_liveliness".equals(key)) {
            if (isToggled(preference)) {
                lockPatternUtils.setBiometricWeakLivelinessEnabled(true);
                return true;
            }
            this.mBiometricWeakLiveliness.setChecked(true);
            if (new ChooseLockSettingsHelper(getActivity(), this).launchConfirmationActivity(125, null, null)) {
                return true;
            }
            lockPatternUtils.setBiometricWeakLivelinessEnabled(false);
            this.mBiometricWeakLiveliness.setChecked(false);
            return true;
        } else if ("lockenabled".equals(key)) {
            lockPatternUtils.setLockPatternEnabled(isToggled(preference));
            return true;
        } else if ("visiblepattern".equals(key)) {
            lockPatternUtils.setVisiblePatternEnabled(isToggled(preference));
            return true;
        } else if ("power_button_instantly_locks".equals(key)) {
            lockPatternUtils.setPowerButtonInstantlyLocks(isToggled(preference));
            return true;
        } else if (preference == this.mShowPassword) {
            contentResolver = getContentResolver();
            str = "show_password";
            if (this.mShowPassword.isChecked()) {
                i = 1;
            }
            Global.putInt(contentResolver, str, i);
            return true;
        } else if (preference == this.mToggleAppInstallation) {
            if (this.mToggleAppInstallation.isChecked()) {
                this.mToggleAppInstallation.setChecked(false);
                warnAppInstallation();
                return true;
            }
            setNonMarketAppsAllowed(false);
            return true;
        } else if (!"toggle_verify_applications".equals(key)) {
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        } else {
            contentResolver = getContentResolver();
            str = "package_verifier_enable";
            if (this.mToggleVerifyApps.isChecked()) {
                i = 1;
            }
            Global.putInt(contentResolver, str, i);
            return true;
        }
    }

    private void disableUnusableTimeouts(long j) {
        CharSequence[] entries = this.mLockAfter.getEntries();
        CharSequence[] values = this.mLockAfter.getEntryValues();
        ArrayList<CharSequence> revisedEntries = new ArrayList();
        ArrayList<CharSequence> revisedValues = new ArrayList();
        for (int i = 0; i < values.length; i++) {
            if (Long.valueOf(values[i].toString()).longValue() <= j) {
                revisedEntries.add(entries[i]);
                revisedValues.add(values[i]);
            }
        }
        if (!(revisedEntries.size() == entries.length && revisedValues.size() == values.length)) {
            this.mLockAfter.setEntries((CharSequence[]) revisedEntries.toArray(new CharSequence[revisedEntries.size()]));
            this.mLockAfter.setEntryValues((CharSequence[]) revisedValues.toArray(new CharSequence[revisedValues.size()]));
            int intValue = Integer.valueOf(this.mLockAfter.getValue()).intValue();
            if (((long) intValue) <= j) {
                this.mLockAfter.setValue(String.valueOf(intValue));
            }
        }
        this.mLockAfter.setEnabled(revisedEntries.size() > 0);
    }

    public void onResume() {
        boolean z = true;
        super.onResume();
        createPreferenceHierarchy();
        LockPatternUtils lockPatternUtils = this.mChooseLockSettingsHelper.utils();
        if (this.mBiometricWeakLiveliness != null) {
            this.mBiometricWeakLiveliness.setChecked(lockPatternUtils.isBiometricWeakLivelinessEnabled());
        }
        if (this.mVisiblePattern != null) {
            this.mVisiblePattern.setChecked(lockPatternUtils.isVisiblePatternEnabled());
        }
        if (this.mPowerButtonInstantlyLocks != null) {
            this.mPowerButtonInstantlyLocks.setChecked(lockPatternUtils.getPowerButtonInstantlyLocks());
        }
        if (this.mShowPassword != null) {
            this.mShowPassword.setChecked(Global.getInt(getContentResolver(), "show_password", 1) != 0);
        }
        if (this.mResetCredentials != null) {
            Preference preference = this.mResetCredentials;
            if (this.mKeyStore.isEmpty()) {
                z = false;
            }
            preference.setEnabled(z);
        }
    }

    private void updateLockAfterPreferenceSummary() {
        long currentTimeout = Secure.getLong(getContentResolver(), "lock_screen_lock_after_timeout", 5000);
        CharSequence[] entries = this.mLockAfter.getEntries();
        CharSequence[] values = this.mLockAfter.getEntryValues();
        int best = 0;
        for (int i = 0; i < values.length; i++) {
            if (currentTimeout >= Long.valueOf(values[i].toString()).longValue()) {
                best = i;
            }
        }
        this.mLockAfter.setSummary(getString(2131427602, new Object[]{entries[best]}));
    }

    private void setupLockAfterPreference() {
        this.mLockAfter.setValue(String.valueOf(Secure.getLong(getContentResolver(), "lock_screen_lock_after_timeout", 5000)));
        this.mLockAfter.setOnPreferenceChangeListener(this);
        long maximumTimeToLock = this.mDPM != null ? this.mDPM.getMaximumTimeToLock(null) : 0;
        long max = (long) Math.max(0, Global.getInt(getContentResolver(), "screen_off_timeout", 0));
        if (maximumTimeToLock > 0) {
            disableUnusableTimeouts(Math.max(0, maximumTimeToLock - max));
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 124 && i2 == -1) {
            startBiometricWeakImprove();
        } else if (i == 125 && i2 == -1) {
            this.mChooseLockSettingsHelper.utils().setBiometricWeakLivelinessEnabled(false);
        } else {
            createPreferenceHierarchy();
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (preference == this.mLockAfter) {
            try {
                Global.putInt(getContentResolver(), "lock_screen_lock_after_timeout", Integer.parseInt((String) obj));
            } catch (NumberFormatException e) {
                Log.e("SecuritySettings", "could not persist lockAfter timeout setting", e);
            }
            updateLockAfterPreferenceSummary();
        }
        return true;
    }

    private boolean isVerifierInstalled() {
        PackageManager pm = getPackageManager();
        Intent verification = new Intent("android.intent.action.PACKAGE_NEEDS_VERIFICATION");
        verification.setType("application/vnd.android.package-archive");
        verification.addFlags(1);
        return pm.queryBroadcastReceivers(verification, 0).size() > 0;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mLockPatternUtils = new LockPatternUtils(getActivity());
        this.mPM = getActivity().getPackageManager();
        this.mDPM = (DevicePolicyManager) getSystemService("device_policy");
        this.mChooseLockSettingsHelper = new ChooseLockSettingsHelper(getActivity());
    }

    private int getNumEnabledNotificationListeners() {
        String flat = Secure.getString(getContentResolver(), "enabled_notification_listeners");
        return (flat == null || "".equals(flat)) ? 0 : flat.split(":").length;
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (dialogInterface == this.mWarnInstallApps && i == -1) {
            setNonMarketAppsAllowed(true);
            if (this.mToggleAppInstallation != null) {
                this.mToggleAppInstallation.setChecked(true);
            }
        }
    }

    private void setNonMarketAppsAllowed(boolean z) {
        if (!((UserManager) getActivity().getSystemService("user")).hasUserRestriction("no_install_unknown_sources")) {
            Global.putInt(getContentResolver(), "install_non_market_apps", z ? 1 : 0);
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mWarnInstallApps != null) {
            this.mWarnInstallApps.dismiss();
        }
    }

    public void startBiometricWeakImprove() {
        Intent intent = new Intent();
        intent.setClassName("com.android.facelock", "com.android.facelock.AddToSetup");
        startActivity(intent);
    }

    private void warnAppInstallation() {
        this.mWarnInstallApps = new Builder(getActivity()).setTitle(getResources().getString(2131428190)).setIcon(17301543).setMessage(getResources().getString(2131428329)).setPositiveButton(17039379, this).setNegativeButton(17039369, null).show();
    }

    private boolean isNonMarketAppsAllowed() {
        return Global.getInt(getContentResolver(), "install_non_market_apps", 0) > 0;
    }

    private boolean isToggled(Preference preference) {
        return ((CheckBoxPreference) preference).isChecked();
    }

    private boolean isVerifyAppsEnabled() {
        return Global.getInt(getContentResolver(), "package_verifier_enable", 1) > 0;
    }

    private boolean showVerifierSetting() {
        return Global.getInt(getContentResolver(), "verifier_setting_visible", 1) > 0;
    }

    protected int getHelpResource() {
        return 2131429128;
    }
}