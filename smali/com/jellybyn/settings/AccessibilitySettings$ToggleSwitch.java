package com.jellybyn.settings;

import android.content.Context;
import android.widget.Switch;

public class AccessibilitySettings$ToggleSwitch extends Switch {
    private OnBeforeCheckedChangeListener mOnBeforeListener;

    public interface OnBeforeCheckedChangeListener {
        boolean onBeforeCheckedChanged(AccessibilitySettings$ToggleSwitch accessibilitySettings$ToggleSwitch, boolean z);
    }

    public void setChecked(boolean z) {
        if (this.mOnBeforeListener == null || !this.mOnBeforeListener.onBeforeCheckedChanged(this, z)) {
            super.setChecked(z);
        }
    }

    public AccessibilitySettings$ToggleSwitch(Context context) {
        super(context);
    }

    public void setCheckedInternal(boolean z) {
        super.setChecked(z);
    }

    public void setOnBeforeCheckedChangeListener(OnBeforeCheckedChangeListener onBeforeCheckedChangeListener) {
        this.mOnBeforeListener = onBeforeCheckedChangeListener;
    }
}