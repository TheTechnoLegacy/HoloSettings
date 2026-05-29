package android.support.v4.view;

import android.support.v4.view.AccessibilityDelegateCompat.AccessibilityDelegateIcsImpl;
import android.support.v4.view.AccessibilityDelegateCompatIcs.AccessibilityDelegateBridge;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;

class AccessibilityDelegateCompat$AccessibilityDelegateIcsImpl$1 implements AccessibilityDelegateBridge {
    final /* synthetic */ AccessibilityDelegateIcsImpl this$0;
    final /* synthetic */ AccessibilityDelegateCompat val$compat;

    public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        this.val$compat.onInitializeAccessibilityEvent(view, accessibilityEvent);
    }

    public void onInitializeAccessibilityNodeInfo(View view, Object obj) {
        this.val$compat.onInitializeAccessibilityNodeInfo(view, new AccessibilityNodeInfoCompat(obj));
    }

    public void onPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        this.val$compat.onPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public void sendAccessibilityEvent(View view, int i) {
        this.val$compat.sendAccessibilityEvent(view, i);
    }

    public void sendAccessibilityEventUnchecked(View view, AccessibilityEvent accessibilityEvent) {
        this.val$compat.sendAccessibilityEventUnchecked(view, accessibilityEvent);
    }

    AccessibilityDelegateCompat$AccessibilityDelegateIcsImpl$1(AccessibilityDelegateIcsImpl accessibilityDelegateIcsImpl, AccessibilityDelegateCompat accessibilityDelegateCompat) {
        this.this$0 = accessibilityDelegateIcsImpl;
        this.val$compat = accessibilityDelegateCompat;
    }

    public boolean dispatchPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        return this.val$compat.dispatchPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public boolean onRequestSendAccessibilityEvent(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        return this.val$compat.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
    }
}