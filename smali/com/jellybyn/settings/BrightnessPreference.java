package com.jellybyn.settings;

import android.content.Context;
import android.content.Intent;
import android.os.UserHandle;
import android.preference.Preference;
import android.util.AttributeSet;

public class BrightnessPreference extends Preference {
    protected void onClick() {
        getContext().sendBroadcastAsUser(new Intent("android.intent.action.SHOW_BRIGHTNESS_DIALOG"), UserHandle.CURRENT_OR_SELF);
    }

    public BrightnessPreference(Context context, AttributeSet attributeSet) {
    }
}