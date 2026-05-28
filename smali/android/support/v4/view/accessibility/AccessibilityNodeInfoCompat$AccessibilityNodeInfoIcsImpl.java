package android.support.v4.view.accessibility;

import android.graphics.Rect;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl;

class AccessibilityNodeInfoCompat$AccessibilityNodeInfoIcsImpl extends AccessibilityNodeInfoStubImpl {
    public void addAction(Object obj, int i) {
        AccessibilityNodeInfoCompatIcs.addAction(obj, i);
    }

    public void getBoundsInParent(Object obj, Rect rect) {
        getBoundsInParent(obj, rect);
    }

    public void getBoundsInScreen(Object obj, Rect rect) {
        getBoundsInScreen(obj, rect);
    }

    public void setClassName(Object obj, CharSequence charSequence) {
        setClassName(obj, charSequence);
    }

    public void setScrollable(Object obj, boolean z) {
        setScrollable(obj, z);
    }

    AccessibilityNodeInfoCompat$AccessibilityNodeInfoIcsImpl() {
    }

    public int getActions(Object obj) {
        return getActions(obj);
    }

    public CharSequence getClassName(Object obj) {
        return getClassName(obj);
    }

    public CharSequence getContentDescription(Object obj) {
        return AccessibilityNodeInfoCompatIcs.getContentDescription(obj);
    }

    public CharSequence getPackageName(Object obj) {
        return getPackageName(obj);
    }

    public CharSequence getText(Object obj) {
        return AccessibilityNodeInfoCompatIcs.getText(obj);
    }

    public boolean isCheckable(Object obj) {
        return AccessibilityNodeInfoCompatIcs.isCheckable(obj);
    }

    public boolean isChecked(Object obj) {
        return AccessibilityNodeInfoCompatIcs.isChecked(obj);
    }

    public boolean isClickable(Object obj) {
        return AccessibilityNodeInfoCompatIcs.isClickable(obj);
    }

    public boolean isEnabled(Object obj) {
        return isEnabled(obj);
    }

    public boolean isFocusable(Object obj) {
        return AccessibilityNodeInfoCompatIcs.isFocusable(obj);
    }

    public boolean isFocused(Object obj) {
        return isFocused(obj);
    }

    public boolean isLongClickable(Object obj) {
        return isLongClickable(obj);
    }

    public boolean isPassword(Object obj) {
        return isPassword(obj);
    }

    public boolean isScrollable(Object obj) {
        return AccessibilityNodeInfoCompatIcs.isScrollable(obj);
    }

    public boolean isSelected(Object obj) {
        return AccessibilityNodeInfoCompatIcs.isSelected(obj);
    }
}