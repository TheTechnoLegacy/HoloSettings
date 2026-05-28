package android.support.v4.view;

import android.graphics.Paint;
import android.os.Build.VERSION;
import android.view.View;

public class ViewCompat {
    static final ViewCompatImpl IMPL;

    static {
        int version = VERSION.SDK_INT;
        if (version >= 17) {
            IMPL = new JbMr1ViewCompatImpl();
        } else if (version >= 16) {
            IMPL = new JBViewCompatImpl();
        } else if (version >= 14) {
            IMPL = new ICSViewCompatImpl();
        } else if (version >= 11) {
            IMPL = new HCViewCompatImpl();
        } else if (version >= 9) {
            IMPL = new GBViewCompatImpl();
        } else {
            IMPL = new BaseViewCompatImpl();
        }
    }

    public static void postInvalidateOnAnimation(View view) {
        IMPL.postInvalidateOnAnimation(view);
    }

    public static void postOnAnimation(View view, Runnable runnable) {
        IMPL.postOnAnimation(view, runnable);
    }

    public static void setAccessibilityDelegate(View view, AccessibilityDelegateCompat accessibilityDelegateCompat) {
        IMPL.setAccessibilityDelegate(view, accessibilityDelegateCompat);
    }

    public static void setImportantForAccessibility(View view, int i) {
        IMPL.setImportantForAccessibility(view, i);
    }

    public static void setLayerType(View view, int i, Paint paint) {
        IMPL.setLayerType(view, i, paint);
    }

    public static boolean canScrollHorizontally(View view, int i) {
        return IMPL.canScrollHorizontally(view, i);
    }

    public static int getImportantForAccessibility(View view) {
        return IMPL.getImportantForAccessibility(view);
    }

    public static int getOverScrollMode(View view) {
        return IMPL.getOverScrollMode(view);
    }
}