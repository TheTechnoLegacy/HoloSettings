package com.jellybyn.settings;

import android.content.Intent;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.view.KeyEvent;

public class ChooseLockPattern extends PreferenceActivity {
    public Intent getIntent() {
        Intent intent = new Intent(super.getIntent());
        intent.putExtra(":android:show_fragment", ChooseLockPatternFragment.class.getName());
        intent.putExtra(":android:no_headers", true);
        return intent;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        CharSequence msg = getText(2131428281);
        showBreadCrumbs(msg, msg);
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        return super.onKeyDown(i, keyEvent);
    }
}