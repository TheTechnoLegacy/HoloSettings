package com.jellybyn.settings;

import android.content.Context;
import android.preference.SwitchPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

/* compiled from: LocationSettings */
class WrappingSwitchPreference extends SwitchPreference {
    protected void onBindView(View view) {
        super.onBindView(view);
        TextView title = (TextView) view.findViewById(16908310);
        if (title != null) {
            title.setSingleLine(false);
            title.setMaxLines(3);
        }
    }

    public WrappingSwitchPreference(Context context, AttributeSet attributeSet) {
    }

    public WrappingSwitchPreference(Context context, AttributeSet attributeSet, int i) {
    }
}