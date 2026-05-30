package com.jellybyn.settings;

import android.content.ComponentName;
import android.graphics.drawable.Drawable;

public class DreamBackend$DreamInfo {
    CharSequence caption;
    public ComponentName componentName;
    Drawable icon;
    boolean isActive;
    public ComponentName settingsComponentName;

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder(DreamBackend$DreamInfo.class.getSimpleName());
        stringBuilder.append('[').append(this.caption);
        if (this.isActive) {
            stringBuilder.append(",active");
        }
        stringBuilder.append(',').append(this.componentName);
        if (this.settingsComponentName != null) {
            stringBuilder.append("settings=").append(this.settingsComponentName);
        }
        return stringBuilder.append(']').toString();
    }
}