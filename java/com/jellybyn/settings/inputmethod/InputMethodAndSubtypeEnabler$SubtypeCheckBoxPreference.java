package com.jellybyn.settings.inputmethod;

import android.content.Context;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.text.TextUtils;
import android.util.Log;
import java.text.Collator;

class InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference extends CheckBoxPreference {
    private final Collator mCollator;
    private final boolean mIsSystemLanguage;
    private final boolean mIsSystemLocale;

    public int compareTo(Preference preference) {
        if (preference instanceof InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference) {
            InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference inputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference = (InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference) preference;
            CharSequence title = getTitle();
            CharSequence title2 = inputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference.getTitle();
            if (TextUtils.equals(title, title2)) {
                return 0;
            }
            if (this.mIsSystemLocale) {
                return -1;
            }
            if (inputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference.mIsSystemLocale) {
                return 1;
            }
            if (this.mIsSystemLanguage) {
                return -1;
            }
            if (inputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference.mIsSystemLanguage) {
                return 1;
            }
            if (TextUtils.isEmpty(title)) {
                return 1;
            }
            return !TextUtils.isEmpty(title2) ? this.mCollator.compare(title.toString(), title2.toString()) : -1;
        } else {
            Log.w(InputMethodAndSubtypeEnabler.access$100(), "Illegal preference type.");
            return super.compareTo(preference);
        }
    }

    public InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference(Context context, String str, String str2, Collator collator) {
        boolean z = false;
        super(context);
        if (TextUtils.isEmpty(str)) {
            this.mIsSystemLocale = false;
            this.mIsSystemLanguage = false;
        } else {
            this.mIsSystemLocale = str.equals(str2);
            if (this.mIsSystemLocale || str.startsWith(str2.substring(0, 2))) {
                z = true;
            }
            this.mIsSystemLanguage = z;
        }
        this.mCollator = collator;
    }
}