package com.jellybyn.settings;

import android.provider.Settings.Global;
import com.jellybyn.settings.AccessibilitySettings.ToggleFeaturePreferenceFragment;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch.OnBeforeCheckedChangeListener;

public class AccessibilitySettings$ToggleGlobalGesturePreferenceFragment extends ToggleFeaturePreferenceFragment {
    protected void onInstallActionBarToggleSwitch() {
        super.onInstallActionBarToggleSwitch();
        this.mToggleSwitch.setOnBeforeCheckedChangeListener(new OnBeforeCheckedChangeListener() {
            public boolean onBeforeCheckedChanged(ToggleSwitch toggleSwitch, boolean z) {
                toggleSwitch.setCheckedInternal(z);
                AccessibilitySettings$ToggleGlobalGesturePreferenceFragment.this.getArguments().putBoolean("checked", z);
                AccessibilitySettings$ToggleGlobalGesturePreferenceFragment.this.onPreferenceToggled(AccessibilitySettings$ToggleGlobalGesturePreferenceFragment.this.mPreferenceKey, z);
                return false;
            }
        });
    }

    protected void onPreferenceToggled(String str, boolean z) {
        Global.putInt(getContentResolver(), "enable_accessibility_global_gesture_enabled", z ? 1 : 0);
    }
}