package android.support.v4.view;

import android.os.Bundle;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompat;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;

interface AccessibilityDelegateCompat$AccessibilityDelegateImpl {
    boolean dispatchPopulateAccessibilityEvent(Object obj, View view, AccessibilityEvent accessibilityEvent);

    AccessibilityNodeProviderCompat getAccessibilityNodeProvider(Object obj, View view);

    Object newAccessiblityDelegateBridge(AccessibilityDelegateCompat accessibilityDelegateCompat);

    Object newAccessiblityDelegateDefaultImpl();

    void onInitializeAccessibilityEvent(Object obj, View view, AccessibilityEvent accessibilityEvent);

    void onInitializeAccessibilityNodeInfo(Object obj, View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat);

    void onPopulateAccessibilityEvent(Object obj, View view, AccessibilityEvent accessibilityEvent);

    boolean onRequestSendAccessibilityEvent(Object obj, ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent);

    boolean performAccessibilityAction(Object obj, View view, int i, Bundle bundle);

    void sendAccessibilityEvent(Object obj, View view, int i);

    void sendAccessibilityEventUnchecked(Object obj, View view, AccessibilityEvent accessibilityEvent);
}