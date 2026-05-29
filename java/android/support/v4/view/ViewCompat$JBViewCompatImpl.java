package android.support.v4.view;

import android.support.v4.view.ViewCompat.ICSViewCompatImpl;
import android.view.View;

class ViewCompat$JBViewCompatImpl extends ICSViewCompatImpl {
    public void postInvalidateOnAnimation(View view) {
        postInvalidateOnAnimation(view);
    }

    public void postOnAnimation(View view, Runnable runnable) {
        postOnAnimation(view, runnable);
    }

    public void setImportantForAccessibility(View view, int i) {
        ViewCompatJB.setImportantForAccessibility(view, i);
    }

    ViewCompat$JBViewCompatImpl() {
    }

    public int getImportantForAccessibility(View view) {
        return ViewCompatJB.getImportantForAccessibility(view);
    }
}