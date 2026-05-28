package com.jellybyn.settings;

import android.os.Handler;
import android.os.Message;

class AccessibilitySettings$1 extends Handler {
    final /* synthetic */ AccessibilitySettings this$0;

    public void dispatchMessage(Message message) {
        super.dispatchMessage(message);
        AccessibilitySettings.access$100(this.this$0);
        AccessibilitySettings.access$200(this.this$0);
    }

    AccessibilitySettings$1(AccessibilitySettings accessibilitySettings) {
        this.this$0 = accessibilitySettings;
    }
}