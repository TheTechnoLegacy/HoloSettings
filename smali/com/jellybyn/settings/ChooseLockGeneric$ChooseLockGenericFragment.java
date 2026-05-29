package com.jellybyn.settings;

import android.app.PendingIntent;
import android.app.admin.DevicePolicyManager;
import android.content.Intent;
import android.os.Bundle;
import android.os.UserManager;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.security.KeyStore;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import libcore.util.MutableBoolean;

public class ChooseLockGeneric$ChooseLockGenericFragment extends SettingsPreferenceFragment {
    private ChooseLockSettingsHelper mChooseLockSettingsHelper;
    private DevicePolicyManager mDPM;
    private boolean mFinishPending = false;
    private KeyStore mKeyStore;
    private boolean mPasswordConfirmed = false;
    private boolean mWaitingForConfirmation = false;

    void updateUnlockMethodAndFinish(int i, boolean z) {
        int i2 = 4;
        if (this.mPasswordConfirmed) {
            boolean booleanExtra = getActivity().getIntent().getBooleanExtra("lockscreen.biometric_weak_fallback", false);
            int upgradeQuality = upgradeQuality(i, null);
            Intent intent;
            if (upgradeQuality >= 131072) {
                int passwordMinimumLength = this.mDPM.getPasswordMinimumLength(null);
                if (passwordMinimumLength >= 4) {
                    i2 = passwordMinimumLength;
                }
                passwordMinimumLength = this.mDPM.getPasswordMaximumLength(upgradeQuality);
                Intent intent2 = new Intent().setClass(getActivity(), ChooseLockPassword.class);
                intent2.putExtra("lockscreen.password_type", upgradeQuality);
                intent2.putExtra("lockscreen.password_min", i2);
                intent2.putExtra("lockscreen.password_max", passwordMinimumLength);
                intent2.putExtra("confirm_credentials", false);
                intent2.putExtra("lockscreen.biometric_weak_fallback", booleanExtra);
                if (booleanExtra) {
                    startActivityForResult(intent2, 101);
                    return;
                }
                this.mFinishPending = true;
                intent2.addFlags(33554432);
                startActivity(intent2);
                return;
            } else if (upgradeQuality == 65536) {
                intent = new Intent(getActivity(), ChooseLockPattern.class);
                intent.putExtra("key_lock_method", "pattern");
                intent.putExtra("confirm_credentials", false);
                intent.putExtra("lockscreen.biometric_weak_fallback", booleanExtra);
                if (booleanExtra) {
                    startActivityForResult(intent, 101);
                    return;
                }
                this.mFinishPending = true;
                intent.addFlags(33554432);
                startActivity(intent);
                return;
            } else if (upgradeQuality == 32768) {
                intent = getBiometricSensorIntent();
                this.mFinishPending = true;
                startActivity(intent);
                return;
            } else if (upgradeQuality == 0) {
                this.mChooseLockSettingsHelper.utils().clearLock(false);
                this.mChooseLockSettingsHelper.utils().setLockScreenDisabled(z);
                getActivity().setResult(-1);
                finish();
                return;
            } else {
                finish();
                return;
            }
        }
        throw new IllegalStateException("Tried to update password without confirming it");
    }

    private void disableUnusablePreferences(int i, MutableBoolean mutableBoolean) {
        PreferenceScreen entries = getPreferenceScreen();
        boolean onlyShowFallback = getActivity().getIntent().getBooleanExtra("lockscreen.biometric_weak_fallback", false);
        boolean weakBiometricAvailable = this.mChooseLockSettingsHelper.utils().isBiometricWeakInstalled();
        boolean singleUser = ((UserManager) getSystemService("user")).getUsers(true).size() == 1;
        for (int i2 = entries.getPreferenceCount() - 1; i2 >= 0; i2--) {
            Preference preference = entries.getPreference(i2);
            if (preference instanceof PreferenceScreen) {
                String key = ((PreferenceScreen) preference).getKey();
                Object obj = 1;
                boolean z = true;
                if ("unlock_set_off".equals(key)) {
                    obj = i <= 0 ? 1 : null;
                    z = singleUser;
                } else if ("unlock_set_none".equals(key)) {
                    obj = i <= 0 ? 1 : null;
                } else if ("unlock_set_biometric_weak".equals(key)) {
                    obj = (i <= 32768 || mutableBoolean.value) ? 1 : null;
                    z = weakBiometricAvailable;
                } else if ("unlock_set_pattern".equals(key)) {
                    obj = i <= 65536 ? 1 : null;
                } else if ("unlock_set_pin".equals(key)) {
                    obj = i <= 131072 ? 1 : null;
                } else if ("unlock_set_password".equals(key)) {
                    obj = i <= 393216 ? 1 : null;
                }
                if (!z || (onlyShowFallback && !allowedForFallback(key))) {
                    entries.removePreference(preference);
                } else if (obj == null) {
                    preference.setSummary(2131427654);
                    preference.setEnabled(false);
                }
            }
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mDPM = (DevicePolicyManager) getSystemService("device_policy");
        this.mKeyStore = KeyStore.getInstance();
        this.mChooseLockSettingsHelper = new ChooseLockSettingsHelper(getActivity());
        this.mPasswordConfirmed = !getActivity().getIntent().getBooleanExtra("confirm_credentials", true);
        if (bundle != null) {
            this.mPasswordConfirmed = bundle.getBoolean("password_confirmed");
            this.mWaitingForConfirmation = bundle.getBoolean("waiting_for_confirmation");
            this.mFinishPending = bundle.getBoolean("finish_pending");
        }
        if (this.mPasswordConfirmed) {
            updatePreferencesOrFinish();
        } else if (!this.mWaitingForConfirmation) {
            if (new ChooseLockSettingsHelper(getActivity(), this).launchConfirmationActivity(100, null, null)) {
                this.mWaitingForConfirmation = true;
                return;
            }
            this.mPasswordConfirmed = true;
            updatePreferencesOrFinish();
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        String key = preference.getKey();
        if ("unlock_set_off".equals(key)) {
            updateUnlockMethodAndFinish(0, true);
            return true;
        } else if ("unlock_set_none".equals(key)) {
            updateUnlockMethodAndFinish(0, false);
            return true;
        } else if ("unlock_set_biometric_weak".equals(key)) {
            updateUnlockMethodAndFinish(32768, false);
            return true;
        } else if ("unlock_set_pattern".equals(key)) {
            updateUnlockMethodAndFinish(65536, false);
            return true;
        } else if ("unlock_set_pin".equals(key)) {
            updateUnlockMethodAndFinish(131072, false);
            return true;
        } else if (!"unlock_set_password".equals(key)) {
            return false;
        } else {
            updateUnlockMethodAndFinish(262144, false);
            return true;
        }
    }

    private void updatePreferencesOrFinish() {
        Intent intent = getActivity().getIntent();
        int quality = intent.getIntExtra("lockscreen.password_type", -1);
        if (quality == -1) {
            quality = intent.getIntExtra("minimum_quality", -1);
            MutableBoolean mutableBoolean = new MutableBoolean(false);
            quality = upgradeQuality(quality, mutableBoolean);
            PreferenceScreen preferenceScreen = getPreferenceScreen();
            if (preferenceScreen != null) {
                preferenceScreen.removeAll();
            }
            addPreferencesFromResource(2131034145);
            disableUnusablePreferences(quality, mutableBoolean);
            return;
        }
        updateUnlockMethodAndFinish(quality, false);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        this.mWaitingForConfirmation = false;
        if (i == 100 && i2 == -1) {
            this.mPasswordConfirmed = true;
            updatePreferencesOrFinish();
        } else if (i == 101) {
            this.mChooseLockSettingsHelper.utils().deleteTempGallery();
            getActivity().setResult(i2);
            finish();
        } else {
            getActivity().setResult(0);
            finish();
        }
    }

    private Intent getBiometricSensorIntent() {
        Intent intent = new Intent().setClass(getActivity(), ChooseLockGeneric.class);
        intent.putExtra("lockscreen.biometric_weak_fallback", true);
        intent.putExtra("confirm_credentials", false);
        intent.putExtra(":android:show_fragment_title", 2131427636);
        Intent intent2 = new Intent();
        intent2.setClassName("com.android.facelock", "com.android.facelock.SetupIntro");
        intent2.putExtra("showTutorial", true);
        intent2.putExtra("PendingIntent", PendingIntent.getActivity(getActivity(), 0, intent, 0));
        return intent2;
    }

    private int upgradeQuality(int i, MutableBoolean mutableBoolean) {
        i = upgradeQualityForKeyStore(upgradeQualityForDPM(i));
        int encryptionQuality = upgradeQualityForEncryption(i);
        if (encryptionQuality > i) {
            if (mutableBoolean != null) {
                mutableBoolean.value = i <= 32768;
            } else if (i == 32768) {
                return i;
            }
        }
        return encryptionQuality;
    }

    private int upgradeQualityForEncryption(int i) {
        int encryptionStatus = this.mDPM.getStorageEncryptionStatus();
        Object obj = (encryptionStatus == 3 || encryptionStatus == 2) ? 1 : null;
        return (obj == null || i >= 131072) ? i : 131072;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View v = super.onCreateView(layoutInflater, viewGroup, bundle);
        if (getActivity().getIntent().getBooleanExtra("lockscreen.biometric_weak_fallback", false)) {
            ((ListView) v.findViewById(16908298)).addHeaderView(View.inflate(getActivity(), 2130968713, null), null, false);
        }
        return v;
    }

    public void onResume() {
        super.onResume();
        if (this.mFinishPending) {
            this.mFinishPending = false;
            finish();
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("password_confirmed", this.mPasswordConfirmed);
        bundle.putBoolean("waiting_for_confirmation", this.mWaitingForConfirmation);
        bundle.putBoolean("finish_pending", this.mFinishPending);
    }

    private int upgradeQualityForDPM(int i) {
        int minQuality = this.mDPM.getPasswordQuality(null);
        return i < minQuality ? minQuality : i;
    }

    private int upgradeQualityForKeyStore(int i) {
        return (this.mKeyStore.isEmpty() || i >= 65536) ? i : 65536;
    }

    private boolean allowedForFallback(String str) {
        return "unlock_backup_info".equals(str) || "unlock_set_pattern".equals(str) || "unlock_set_pin".equals(str);
    }

    protected int getHelpResource() {
        return 2131429122;
    }
}