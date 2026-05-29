package com.jellybyn.settings;

import android.net.Uri;
import android.os.Handler;
import android.provider.Settings.Secure;
import com.jellybyn.settings.AccessibilitySettings.SettingsContentObserver;
import com.jellybyn.settings.AccessibilitySettings.ToggleAccessibilityServicePreferenceFragment;

class AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$1 extends SettingsContentObserver {
    final /* synthetic */ ToggleAccessibilityServicePreferenceFragment this$0;

    public void onChange(boolean z, Uri uri) {
        this.this$0.mToggleSwitch.setCheckedInternal(Secure.getString(this.this$0.getContentResolver(), "enabled_accessibility_services").contains(ToggleAccessibilityServicePreferenceFragment.access$500(this.this$0).flattenToString()));
    }

    AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$1(ToggleAccessibilityServicePreferenceFragment toggleAccessibilityServicePreferenceFragment, Handler handler) {
        this.this$0 = toggleAccessibilityServicePreferenceFragment;
        super(handler);
    }
}