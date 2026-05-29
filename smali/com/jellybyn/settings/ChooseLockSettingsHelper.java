package com.jellybyn.settings;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import com.android.internal.widget.LockPatternUtils;

public final class ChooseLockSettingsHelper {
    private Activity mActivity;
    private Fragment mFragment;
    private LockPatternUtils mLockPatternUtils;

    private boolean confirmPattern(int i, CharSequence charSequence, CharSequence charSequence2) {
        if (!this.mLockPatternUtils.isLockPatternEnabled() || !this.mLockPatternUtils.savedPatternExists()) {
            return false;
        }
        Intent intent = new Intent();
        intent.putExtra("com.jellybyn.settings.ConfirmLockPattern.header", charSequence);
        intent.putExtra("com.jellybyn.settings.ConfirmLockPattern.footer", charSequence2);
        intent.setClassName("com.jellybyn.settings", "com.jellybyn.settings.ConfirmLockPattern");
        if (this.mFragment != null) {
            this.mFragment.startActivityForResult(intent, i);
        } else {
            this.mActivity.startActivityForResult(intent, i);
        }
        return true;
    }

    private boolean confirmPassword(int i) {
        if (!this.mLockPatternUtils.isLockPasswordEnabled()) {
            return false;
        }
        Intent intent = new Intent();
        intent.setClassName("com.jellybyn.settings", "com.jellybyn.settings.ConfirmLockPassword");
        if (this.mFragment != null) {
            this.mFragment.startActivityForResult(intent, i);
        } else {
            this.mActivity.startActivityForResult(intent, i);
        }
        return true;
    }

    boolean launchConfirmationActivity(int i, CharSequence charSequence, CharSequence charSequence2) {
        switch (this.mLockPatternUtils.getKeyguardStoredPasswordQuality()) {
            case 65536:
                return confirmPattern(i, charSequence, charSequence2);
            case 131072:
            case 262144:
            case 327680:
            case 393216:
                return confirmPassword(i);
            default:
                return false;
        }
    }

    public ChooseLockSettingsHelper(Activity activity) {
        this.mActivity = activity;
        this.mLockPatternUtils = new LockPatternUtils(activity);
    }

    public ChooseLockSettingsHelper(Activity activity, Fragment fragment) {
        this(activity);
        this.mFragment = fragment;
    }

    public LockPatternUtils utils() {
        return this.mLockPatternUtils;
    }
}