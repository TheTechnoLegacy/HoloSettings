package android.support.v4.view;

import android.support.v4.view.AccessibilityDelegateCompatIcs.AccessibilityDelegateBridge;
import android.view.View;
import android.view.View.AccessibilityDelegate;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

class AccessibilityDelegateCompatIcs$1 extends AccessibilityDelegate {
    final /* synthetic */ AccessibilityDelegateBridge val$bridge;

    public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        this.val$bridge.onInitializeAccessibilityEvent(view, accessibilityEvent);
    }

    public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfo accessibilityNodeInfo) {
        this.val$bridge.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfo);
    }

    public void onPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        this.val$bridge.onPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public void sendAccessibilityEvent(View view, int i) {
        this.val$bridge.sendAccessibilityEvent(view, i);
    }

    public void sendAccessibilityEventUnchecked(View view, AccessibilityEvent accessibilityEvent) {
        this.val$bridge.sendAccessibilityEventUnchecked(view, accessibilityEvent);
    }

    AccessibilityDelegateCompatIcs$1(AccessibilityDelegateBridge accessibilityDelegateBridge) {
        this.val$bridge = accessibilityDelegateBridge;
    }

    public boolean dispatchPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        return this.val$bridge.dispatchPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public boolean onRequestSendAccessibilityEvent(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        return this.val$bridge.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
    }
}