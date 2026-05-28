package android.support.v4.view;

import android.os.Bundle;
import android.support.v4.view.AccessibilityDelegateCompat.AccessibilityDelegateImpl;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompat;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;

class AccessibilityDelegateCompat$AccessibilityDelegateStubImpl implements AccessibilityDelegateImpl {
    AccessibilityDelegateCompat$AccessibilityDelegateStubImpl() {
    }

    public boolean dispatchPopulateAccessibilityEvent(Object obj, View view, AccessibilityEvent accessibilityEvent) {
        return false;
    }

    public AccessibilityNodeProviderCompat getAccessibilityNodeProvider(Object obj, View view) {
        return null;
    }

    public Object newAccessiblityDelegateBridge(AccessibilityDelegateCompat accessibilityDelegateCompat) {
        return null;
    }

    public Object newAccessiblityDelegateDefaultImpl() {
        return null;
    }

    public void onInitializeAccessibilityEvent(Object obj, View view, AccessibilityEvent accessibilityEvent) {
    }

    public void onInitializeAccessibilityNodeInfo(Object obj, View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
    }

    public void onPopulateAccessibilityEvent(Object obj, View view, AccessibilityEvent accessibilityEvent) {
    }

    public boolean onRequestSendAccessibilityEvent(Object obj, ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        return true;
    }

    public boolean performAccessibilityAction(Object obj, View view, int i, Bundle bundle) {
        return false;
    }

    public void sendAccessibilityEvent(Object obj, View view, int i) {
    }

    public void sendAccessibilityEventUnchecked(Object obj, View view, AccessibilityEvent accessibilityEvent) {
    }
}