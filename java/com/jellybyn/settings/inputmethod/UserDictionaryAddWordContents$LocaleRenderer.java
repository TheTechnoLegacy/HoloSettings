package com.jellybyn.settings.inputmethod;

import android.content.Context;
import com.jellybyn.settings.Utils;

public class UserDictionaryAddWordContents$LocaleRenderer {
    private final String mDescription;
    private final String mLocaleString;

    public UserDictionaryAddWordContents$LocaleRenderer(Context context, String str) {
        this.mLocaleString = str;
        if (str == null) {
            this.mDescription = context.getString(2131428517);
        } else if ("".equals(str)) {
            this.mDescription = context.getString(2131428516);
        } else {
            this.mDescription = Utils.createLocaleFromString(str).getDisplayName();
        }
    }

    public String getLocaleString() {
        return this.mLocaleString;
    }

    public boolean isMoreLanguages() {
        return this.mLocaleString == null;
    }

    public String toString() {
        return this.mDescription;
    }
}