package com.jellybyn.settings;

import com.jellybyn.settings.AccessibilitySettings.ToggleGlobalGesturePreferenceFragment;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch.OnBeforeCheckedChangeListener;

class AccessibilitySettings$ToggleGlobalGesturePreferenceFragment$1 implements OnBeforeCheckedChangeListener {
    final /* synthetic */ ToggleGlobalGesturePreferenceFragment this$0;

    public boolean onBeforeCheckedChanged(ToggleSwitch toggleSwitch, boolean z) {
        toggleSwitch.setCheckedInternal(z);
        this.this$0.getArguments().putBoolean("checked", z);
        this.this$0.onPreferenceToggled(this.this$0.mPreferenceKey, z);
        return false;
    }

    AccessibilitySettings$ToggleGlobalGesturePreferenceFragment$1(ToggleGlobalGesturePreferenceFragment toggleGlobalGesturePreferenceFragment) {
        this.this$0 = toggleGlobalGesturePreferenceFragment;
    }
}