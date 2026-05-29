package com.jellybyn.settings;

import com.android.internal.content.PackageMonitor;

class AccessibilitySettings$SettingsPackageMonitor extends PackageMonitor {
    final /* synthetic */ AccessibilitySettings this$0;

    public void onPackageAdded(String str, int i) {
        AccessibilitySettings.access$400(this.this$0).sendMessageDelayed(AccessibilitySettings.access$400(this.this$0).obtainMessage(), 1000);
    }

    public void onPackageAppeared(String str, int i) {
        AccessibilitySettings.access$400(this.this$0).sendMessageDelayed(AccessibilitySettings.access$400(this.this$0).obtainMessage(), 1000);
    }

    public void onPackageDisappeared(String str, int i) {
        AccessibilitySettings.access$400(this.this$0).sendMessageDelayed(AccessibilitySettings.access$400(this.this$0).obtainMessage(), 1000);
    }

    public void onPackageRemoved(String str, int i) {
        AccessibilitySettings.access$400(this.this$0).sendMessageDelayed(AccessibilitySettings.access$400(this.this$0).obtainMessage(), 1000);
    }

    private AccessibilitySettings$SettingsPackageMonitor(AccessibilitySettings accessibilitySettings) {
        this.this$0 = accessibilitySettings;
    }
}