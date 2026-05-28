package android.support.v4.view;

class AccessibilityDelegateCompat$AccessibilityDelegateIcsImpl extends android.support.v4.view.AccessibilityDelegateCompat.AccessibilityDelegateStubImpl {
    AccessibilityDelegateCompat$AccessibilityDelegateIcsImpl() {
        r0 = this;
        r0.<init>();
        return;
    }

    public boolean dispatchPopulateAccessibilityEvent(java.lang.Object r2, android.view.View r3, android.view.accessibility.AccessibilityEvent r4) {
        r1 = this;
        r0 = dispatchPopulateAccessibilityEvent(r2, r3, r4);
        return r0;
    }

    public java.lang.Object newAccessiblityDelegateBridge(android.support.v4.view.AccessibilityDelegateCompat r2) {
        r1 = this;
        r0 = new android.support.v4.view.AccessibilityDelegateCompat$AccessibilityDelegateIcsImpl$1;
        r0.<init>(r1, r2);
        r0 = android.support.v4.view.AccessibilityDelegateCompatIcs.newAccessibilityDelegateBridge(r0);
        return r0;
    }

    public java.lang.Object newAccessiblityDelegateDefaultImpl() {
        r1 = this;
        r0 = android.support.v4.view.AccessibilityDelegateCompatIcs.newAccessibilityDelegateDefaultImpl();
        return r0;
    }

    public void onInitializeAccessibilityEvent(java.lang.Object r1, android.view.View r2, android.view.accessibility.AccessibilityEvent r3) {
        r0 = this;
        onInitializeAccessibilityEvent(r1, r2, r3);
        return;
    }

    public void onInitializeAccessibilityNodeInfo(java.lang.Object r2, android.view.View r3, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat r4) {
        r1 = this;
        r0 = r4.getInfo();
        android.support.v4.view.AccessibilityDelegateCompatIcs.onInitializeAccessibilityNodeInfo(r2, r3, r0);
        return;
    }

    public void onPopulateAccessibilityEvent(java.lang.Object r1, android.view.View r2, android.view.accessibility.AccessibilityEvent r3) {
        r0 = this;
        onPopulateAccessibilityEvent(r1, r2, r3);
        return;
    }

    public boolean onRequestSendAccessibilityEvent(java.lang.Object r2, android.view.ViewGroup r3, android.view.View r4, android.view.accessibility.AccessibilityEvent r5) {
        r1 = this;
        r0 = android.support.v4.view.AccessibilityDelegateCompatIcs.onRequestSendAccessibilityEvent(r2, r3, r4, r5);
        return r0;
    }

    public void sendAccessibilityEvent(java.lang.Object r1, android.view.View r2, int r3) {
        r0 = this;
        sendAccessibilityEvent(r1, r2, r3);
        return;
    }

    public void sendAccessibilityEventUnchecked(java.lang.Object r1, android.view.View r2, android.view.accessibility.AccessibilityEvent r3) {
        r0 = this;
        sendAccessibilityEventUnchecked(r1, r2, r3);
        return;
    }
}