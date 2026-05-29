package android.support.v4.view;

import android.support.v4.view.ViewCompat.HCViewCompatImpl;
import android.view.View;

class ViewCompat$ICSViewCompatImpl extends HCViewCompatImpl {
    public void setAccessibilityDelegate(View view, AccessibilityDelegateCompat accessibilityDelegateCompat) {
        ViewCompatICS.setAccessibilityDelegate(view, accessibilityDelegateCompat.getBridge());
    }

    ViewCompat$ICSViewCompatImpl() {
    }

    public boolean canScrollHorizontally(View view, int i) {
        return ViewCompatICS.canScrollHorizontally(view, i);
    }
}