package com.jellybyn.settings;

import android.content.Intent;
import android.os.Bundle;
import android.preference.PreferenceActivity;

public class ConfirmLockPattern extends PreferenceActivity {
    public Intent getIntent() {
        Intent intent = new Intent(super.getIntent());
        intent.putExtra(":android:show_fragment", ConfirmLockPatternFragment.class.getName());
        intent.putExtra(":android:no_headers", true);
        return intent;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        CharSequence msg = getText(2131428284);
        showBreadCrumbs(msg, msg);
    }
}