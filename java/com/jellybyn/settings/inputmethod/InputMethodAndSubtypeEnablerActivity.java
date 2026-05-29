package com.jellybyn.settings.inputmethod;

import android.content.Intent;
import android.preference.PreferenceActivity;

public class InputMethodAndSubtypeEnablerActivity extends PreferenceActivity {
    public Intent getIntent() {
        Intent intent = new Intent(super.getIntent());
        if (!intent.hasExtra(":android:show_fragment")) {
            intent.putExtra(":android:show_fragment", InputMethodAndSubtypeEnabler.class.getName());
            intent.putExtra(":android:no_headers", true);
        }
        return intent;
    }
}