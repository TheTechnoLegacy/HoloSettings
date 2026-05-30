package com.jellybyn.settings;

import android.content.Context;
import android.preference.ListPreference;
import android.util.AttributeSet;

public class WarnedListPreference extends ListPreference {
    public WarnedListPreference(Context context, AttributeSet attributeSet) {
    }

    public void click() {
        super.onClick();
    }

    protected void onClick() {
    }
}