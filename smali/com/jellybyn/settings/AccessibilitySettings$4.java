package com.jellybyn.settings;

import android.content.Context;
import android.preference.Preference;
import android.view.View;
import android.widget.TextView;

class AccessibilitySettings$4 extends Preference {
    final /* synthetic */ AccessibilitySettings this$0;

    protected void onBindView(View view) {
        super.onBindView(view);
        ((TextView) view.findViewById(2131230917)).setText(this.this$0.getString(2131428616));
    }

    AccessibilitySettings$4(AccessibilitySettings accessibilitySettings, Context context) {
        this.this$0 = accessibilitySettings;
        super(context);
    }
}