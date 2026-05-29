package com.jellybyn.settings;

import android.app.Activity;
import android.app.Fragment;
import android.app.admin.DevicePolicyManager;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import com.android.internal.widget.LockPatternUtils;

public class CryptKeeperSettings extends Fragment {
    private View mBatteryWarning;
    private View mContentView;
    private Button mInitiateButton;
    private OnClickListener mInitiateListener = new 1(this);
    private IntentFilter mIntentFilter;
    private BroadcastReceiver mIntentReceiver = new 1(this);
    private View mPowerWarning;

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        if ("android.app.action.START_ENCRYPTION".equals(activity.getIntent().getAction())) {
            DevicePolicyManager devicePolicyManager = (DevicePolicyManager) activity.getSystemService("device_policy");
            if (devicePolicyManager != null && devicePolicyManager.getStorageEncryptionStatus() != 1) {
                activity.finish();
            }
        }
    }

    private boolean runKeyguardConfirmation(int i) {
        LockPatternUtils lockPatternUtils = new LockPatternUtils(getActivity());
        int quality = lockPatternUtils.getActivePasswordQuality();
        if (quality == 32768 && lockPatternUtils.isLockPasswordEnabled()) {
            quality = lockPatternUtils.getKeyguardStoredPasswordQuality();
        }
        if (quality < 131072) {
            return false;
        }
        Resources res = getActivity().getResources();
        return new ChooseLockSettingsHelper(getActivity(), this).launchConfirmationActivity(i, res.getText(2131428209), res.getText(2131428210));
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mContentView = layoutInflater.inflate(2130968607, null);
        this.mIntentFilter = new IntentFilter();
        this.mIntentFilter.addAction("android.intent.action.BATTERY_CHANGED");
        this.mInitiateButton = (Button) this.mContentView.findViewById(2131230786);
        this.mInitiateButton.setOnClickListener(this.mInitiateListener);
        this.mInitiateButton.setEnabled(false);
        this.mPowerWarning = this.mContentView.findViewById(2131230785);
        this.mBatteryWarning = this.mContentView.findViewById(2131230784);
        return this.mContentView;
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 55 && i2 == -1 && intent != null) {
            String password = intent.getStringExtra("password");
            if (!TextUtils.isEmpty(password)) {
                showFinalConfirmation(password);
            }
        }
    }

    private void showFinalConfirmation(String str) {
        Preference preference = new Preference(getActivity());
        preference.setFragment(CryptKeeperConfirm.class.getName());
        preference.setTitle(2131427626);
        preference.getExtras().putString("password", str);
        ((PreferenceActivity) getActivity()).onPreferenceStartFragment(null, preference);
    }

    public void onPause() {
        super.onPause();
        getActivity().unregisterReceiver(this.mIntentReceiver);
    }

    public void onResume() {
        super.onResume();
        getActivity().registerReceiver(this.mIntentReceiver, this.mIntentFilter);
    }
}