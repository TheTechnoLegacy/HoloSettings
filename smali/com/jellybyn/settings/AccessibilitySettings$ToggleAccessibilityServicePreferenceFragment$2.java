package com.jellybyn.settings;

import com.jellybyn.settings.AccessibilitySettings.ToggleAccessibilityServicePreferenceFragment;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch.OnBeforeCheckedChangeListener;

class AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$2 implements OnBeforeCheckedChangeListener {
    final /* synthetic */ ToggleAccessibilityServicePreferenceFragment this$0;

    public boolean onBeforeCheckedChanged(ToggleSwitch toggleSwitch, boolean z) {
        if (z) {
            toggleSwitch.setCheckedInternal(false);
            this.this$0.getArguments().putBoolean("checked", false);
            this.this$0.showDialog(1);
        } else {
            toggleSwitch.setCheckedInternal(true);
            this.this$0.getArguments().putBoolean("checked", true);
            this.this$0.showDialog(2);
        }
        return true;
    }

    AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$2(ToggleAccessibilityServicePreferenceFragment toggleAccessibilityServicePreferenceFragment) {
        this.this$0 = toggleAccessibilityServicePreferenceFragment;
    }
}