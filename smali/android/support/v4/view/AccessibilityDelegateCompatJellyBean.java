package android.support.v4.view;

import android.os.Bundle;
import android.view.View;
import android.view.View.AccessibilityDelegate;

class AccessibilityDelegateCompatJellyBean {
    AccessibilityDelegateCompatJellyBean() {
    }

    public static Object getAccessibilityNodeProvider(Object obj, View view) {
        return ((AccessibilityDelegate) obj).getAccessibilityNodeProvider(view);
    }

    public static Object newAccessibilityDelegateBridge(AccessibilityDelegateBridgeJellyBean accessibilityDelegateBridgeJellyBean) {
        return new 1(accessibilityDelegateBridgeJellyBean);
    }

    public static boolean performAccessibilityAction(Object obj, View view, int i, Bundle bundle) {
        return ((AccessibilityDelegate) obj).performAccessibilityAction(view, i, bundle);
    }
}