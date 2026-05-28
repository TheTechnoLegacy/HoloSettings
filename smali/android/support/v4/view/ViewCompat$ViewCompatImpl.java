package android.support.v4.view;

import android.graphics.Paint;
import android.view.View;

interface ViewCompat$ViewCompatImpl {
    boolean canScrollHorizontally(View view, int i);

    int getImportantForAccessibility(View view);

    int getOverScrollMode(View view);

    void postInvalidateOnAnimation(View view);

    void postOnAnimation(View view, Runnable runnable);

    void setAccessibilityDelegate(View view, AccessibilityDelegateCompat accessibilityDelegateCompat);

    void setImportantForAccessibility(View view, int i);

    void setLayerType(View view, int i, Paint paint);
}