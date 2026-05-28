package com.jellybyn.settings.accounts;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.preference.Preference;

public class ProviderPreference extends Preference {
    private String mAccountType;

    public ProviderPreference(Context context, String str, Drawable drawable, CharSequence charSequence) {
        super(context);
        this.mAccountType = str;
        setIcon(drawable);
        setPersistent(false);
        setTitle(charSequence);
    }

    public String getAccountType() {
        return this.mAccountType;
    }
}