package android.support.v4.view.accessibility;

import android.graphics.Rect;

interface AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl {
    void addAction(Object obj, int i);

    int getActions(Object obj);

    void getBoundsInParent(Object obj, Rect rect);

    void getBoundsInScreen(Object obj, Rect rect);

    CharSequence getClassName(Object obj);

    CharSequence getContentDescription(Object obj);

    CharSequence getPackageName(Object obj);

    CharSequence getText(Object obj);

    String getViewIdResourceName(Object obj);

    boolean isCheckable(Object obj);

    boolean isChecked(Object obj);

    boolean isClickable(Object obj);

    boolean isEnabled(Object obj);

    boolean isFocusable(Object obj);

    boolean isFocused(Object obj);

    boolean isLongClickable(Object obj);

    boolean isPassword(Object obj);

    boolean isScrollable(Object obj);

    boolean isSelected(Object obj);

    void setClassName(Object obj, CharSequence charSequence);

    void setScrollable(Object obj, boolean z);
}