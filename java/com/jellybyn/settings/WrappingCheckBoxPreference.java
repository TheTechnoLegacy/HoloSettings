package com.jellybyn.settings;

import android.content.Context;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

/* compiled from: LocationSettings */
class WrappingCheckBoxPreference extends CheckBoxPreference {
    protected void onBindView(View view) {
        super.onBindView(view);
        TextView title = (TextView) view.findViewById(16908310);
        if (title != null) {
            title.setSingleLine(false);
            title.setMaxLines(3);
        }
    }

    public WrappingCheckBoxPreference(Context context, AttributeSet attributeSet) {
    }

    public WrappingCheckBoxPreference(Context context, AttributeSet attributeSet, int i) {
    }
}