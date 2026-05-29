package android.support.v4.view;

import android.view.View;
import android.view.View.AccessibilityDelegate;

class ViewCompatICS {
    public static void setAccessibilityDelegate(View view, Object obj) {
        view.setAccessibilityDelegate((AccessibilityDelegate) obj);
    }

    ViewCompatICS() {
    }

    public static boolean canScrollHorizontally(View view, int i) {
        return view.canScrollHorizontally(i);
    }
}