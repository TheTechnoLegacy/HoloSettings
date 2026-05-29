package com.jellybyn.settings;

import com.jellybyn.settings.AccessibilitySettings.ToggleScreenMagnificationPreferenceFragment;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch.OnBeforeCheckedChangeListener;

class AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment$1 implements OnBeforeCheckedChangeListener {
    final /* synthetic */ ToggleScreenMagnificationPreferenceFragment this$0;

    public boolean onBeforeCheckedChanged(ToggleSwitch toggleSwitch, boolean z) {
        toggleSwitch.setCheckedInternal(z);
        this.this$0.getArguments().putBoolean("checked", z);
        this.this$0.onPreferenceToggled(this.this$0.mPreferenceKey, z);
        return false;
    }

    AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment$1(ToggleScreenMagnificationPreferenceFragment toggleScreenMagnificationPreferenceFragment) {
        this.this$0 = toggleScreenMagnificationPreferenceFragment;
    }
}