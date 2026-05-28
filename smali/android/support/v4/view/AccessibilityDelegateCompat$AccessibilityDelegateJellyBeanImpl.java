package android.support.v4.view;

import android.os.Bundle;
import android.support.v4.view.AccessibilityDelegateCompat.AccessibilityDelegateIcsImpl;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompat;
import android.view.View;

class AccessibilityDelegateCompat$AccessibilityDelegateJellyBeanImpl extends AccessibilityDelegateIcsImpl {
    public AccessibilityNodeProviderCompat getAccessibilityNodeProvider(Object obj, View view) {
        Object provider = AccessibilityDelegateCompatJellyBean.getAccessibilityNodeProvider(obj, view);
        return provider != null ? new AccessibilityNodeProviderCompat(provider) : null;
    }

    AccessibilityDelegateCompat$AccessibilityDelegateJellyBeanImpl() {
    }

    public Object newAccessiblityDelegateBridge(AccessibilityDelegateCompat accessibilityDelegateCompat) {
        return AccessibilityDelegateCompatJellyBean.newAccessibilityDelegateBridge(new 1(this, accessibilityDelegateCompat));
    }

    public boolean performAccessibilityAction(Object obj, View view, int i, Bundle bundle) {
        return AccessibilityDelegateCompatJellyBean.performAccessibilityAction(obj, view, i, bundle);
    }
}