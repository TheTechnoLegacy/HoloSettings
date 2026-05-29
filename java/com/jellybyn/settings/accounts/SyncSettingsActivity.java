package com.jellybyn.settings.accounts;

import android.content.Intent;
import android.preference.PreferenceActivity;

public class SyncSettingsActivity extends PreferenceActivity {
    public Intent getIntent() {
        Intent intent = new Intent(super.getIntent());
        intent.putExtra(":android:show_fragment", SyncSettings.class.getName());
        intent.putExtra(":android:no_headers", true);
        return intent;
    }
}