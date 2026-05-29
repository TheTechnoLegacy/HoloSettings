package android.support.v4.view;

import android.graphics.Paint;
import android.support.v4.view.ViewCompat.ViewCompatImpl;
import android.view.View;

class ViewCompat$BaseViewCompatImpl implements ViewCompatImpl {
    public void postInvalidateOnAnimation(View view) {
        view.postInvalidateDelayed(getFrameTime());
    }

    public void postOnAnimation(View view, Runnable runnable) {
        view.postDelayed(runnable, getFrameTime());
    }

    ViewCompat$BaseViewCompatImpl() {
    }

    public boolean canScrollHorizontally(View view, int i) {
        return false;
    }

    long getFrameTime() {
        return 10;
    }

    public int getImportantForAccessibility(View view) {
        return 0;
    }

    public int getOverScrollMode(View view) {
        return 2;
    }

    public void setAccessibilityDelegate(View view, AccessibilityDelegateCompat accessibilityDelegateCompat) {
    }

    public void setImportantForAccessibility(View view, int i) {
    }

    public void setLayerType(View view, int i, Paint paint) {
    }
}