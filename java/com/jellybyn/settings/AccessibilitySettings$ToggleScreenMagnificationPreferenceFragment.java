package com.jellybyn.settings;

import android.provider.Settings.Secure;
import com.jellybyn.settings.AccessibilitySettings.ToggleFeaturePreferenceFragment;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch.OnBeforeCheckedChangeListener;

public class AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment extends ToggleFeaturePreferenceFragment {
    protected void onInstallActionBarToggleSwitch() {
        super.onInstallActionBarToggleSwitch();
        this.mToggleSwitch.setOnBeforeCheckedChangeListener(new OnBeforeCheckedChangeListener() {
            public boolean onBeforeCheckedChanged(ToggleSwitch toggleSwitch, boolean z) {
                toggleSwitch.setCheckedInternal(z);
                AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment.this.getArguments().putBoolean("checked", z);
                AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment.this.onPreferenceToggled(AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment.this.mPreferenceKey, z);
                return false;
            }
        });
    }

    protected void onPreferenceToggled(String str, boolean z) {
        Secure.putInt(getContentResolver(), "accessibility_display_magnification_enabled", z ? 1 : 0);
    }
}