package com.jellybyn.settings;

import android.content.Intent;
import android.preference.PreferenceActivity;

public class ChooseLockGeneric extends PreferenceActivity {
    public Intent getIntent() {
        Intent modIntent = new Intent(super.getIntent());
        modIntent.putExtra(":android:show_fragment", ChooseLockGenericFragment.class.getName());
        modIntent.putExtra(":android:no_headers", true);
        return modIntent;
    }
}