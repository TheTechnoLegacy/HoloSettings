package com.jellybyn.settings;

import android.net.Uri;
import android.os.Handler;
import com.jellybyn.settings.AccessibilitySettings.SettingsContentObserver;

class AccessibilitySettings$2 extends SettingsContentObserver {
    final /* synthetic */ AccessibilitySettings this$0;

    public void onChange(boolean z, Uri uri) {
        AccessibilitySettings.access$100(this.this$0);
        AccessibilitySettings.access$200(this.this$0);
    }

    AccessibilitySettings$2(AccessibilitySettings accessibilitySettings, Handler handler) {
        this.this$0 = accessibilitySettings;
        super(handler);
    }
}