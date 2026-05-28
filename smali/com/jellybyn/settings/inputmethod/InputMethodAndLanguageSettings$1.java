package com.jellybyn.settings.inputmethod;

import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;

class InputMethodAndLanguageSettings$1 implements OnPreferenceClickListener {
    final /* synthetic */ InputMethodAndLanguageSettings this$0;
    final /* synthetic */ String val$inputDeviceDescriptor;

    public boolean onPreferenceClick(Preference preference) {
        InputMethodAndLanguageSettings.access$000(this.this$0, this.val$inputDeviceDescriptor);
        return true;
    }

    InputMethodAndLanguageSettings$1(InputMethodAndLanguageSettings inputMethodAndLanguageSettings, String str) {
        this.this$0 = inputMethodAndLanguageSettings;
        this.val$inputDeviceDescriptor = str;
    }
}