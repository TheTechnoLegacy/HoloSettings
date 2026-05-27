package com.jellybyn.settings.applications;

import android.content.Intent;
import android.preference.PreferenceActivity;

public class InstalledAppDetailsTop extends PreferenceActivity {
    public Intent getIntent() {
        Intent intent = new Intent(super.getIntent());
        intent.putExtra(":android:show_fragment", InstalledAppDetails.class.getName());
        intent.putExtra(":android:no_headers", true);
        return intent;
    }
}