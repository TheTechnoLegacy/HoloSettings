package android.support.v4.view;

import android.os.Bundle;
import android.support.v4.view.AccessibilityDelegateCompat.AccessibilityDelegateJellyBeanImpl;
import android.support.v4.view.AccessibilityDelegateCompatJellyBean.AccessibilityDelegateBridgeJellyBean;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompat;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;

class AccessibilityDelegateCompat$AccessibilityDelegateJellyBeanImpl$1 implements AccessibilityDelegateBridgeJellyBean {
    final /* synthetic */ AccessibilityDelegateJellyBeanImpl this$0;
    final /* synthetic */ AccessibilityDelegateCompat val$compat;

    public Object getAccessibilityNodeProvider(View view) {
        AccessibilityNodeProviderCompat provider = this.val$compat.getAccessibilityNodeProvider(view);
        return provider != null ? provider.getProvider() : null;
    }

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

    AccessibilityDelegateCompat$AccessibilityDelegateJellyBeanImpl$1(AccessibilityDelegateJellyBeanImpl accessibilityDelegateJellyBeanImpl, AccessibilityDelegateCompat accessibilityDelegateCompat) {
        this.this$0 = accessibilityDelegateJellyBeanImpl;
        this.val$compat = accessibilityDelegateCompat;
    }

    public boolean dispatchPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        return this.val$compat.dispatchPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public boolean onRequestSendAccessibilityEvent(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        return this.val$compat.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
    }

    public boolean performAccessibilityAction(View view, int i, Bundle bundle) {
        return this.val$compat.performAccessibilityAction(view, i, bundle);
    }
}