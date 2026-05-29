package com.jellybyn.settings.wifi;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.widget.Button;
import com.jellybyn.settings.ButtonBarHandler;

public class WifiPickerActivity extends PreferenceActivity implements ButtonBarHandler {
    public void startWithFragment(String str, Bundle bundle, Fragment fragment, int i) {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.setClass(this, getClass());
        intent.putExtra(":android:show_fragment", str);
        intent.putExtra(":android:show_fragment_args", bundle);
        intent.putExtra(":android:no_headers", true);
        Intent orgIntent = getIntent();
        if (orgIntent.hasExtra("extra_prefs_show_button_bar")) {
            intent.putExtra("extra_prefs_show_button_bar", orgIntent.getBooleanExtra("extra_prefs_show_button_bar", false));
        }
        if (orgIntent.hasExtra("extra_prefs_set_next_text")) {
            intent.putExtra("extra_prefs_set_next_text", orgIntent.getStringExtra("extra_prefs_set_next_text"));
        }
        if (orgIntent.hasExtra("extra_prefs_set_back_text")) {
            intent.putExtra("extra_prefs_set_back_text", orgIntent.getStringExtra("extra_prefs_set_back_text"));
        }
        if (orgIntent.hasExtra("wifi_show_action_bar")) {
            intent.putExtra("wifi_show_action_bar", orgIntent.getBooleanExtra("wifi_show_action_bar", true));
        }
        if (orgIntent.hasExtra("wifi_show_menus")) {
            intent.putExtra("wifi_show_menus", orgIntent.getBooleanExtra("wifi_show_menus", true));
        }
        if (fragment == null) {
            startActivity(intent);
        } else {
            fragment.startActivityForResult(intent, i);
        }
    }

    public Intent getIntent() {
        Intent intent = new Intent(super.getIntent());
        if (!intent.hasExtra(":android:show_fragment")) {
            intent.putExtra(":android:show_fragment", WifiSettings.class.getName());
        }
        intent.putExtra(":android:no_headers", true);
        return intent;
    }

    public Button getNextButton() {
        return super.getNextButton();
    }

    public boolean hasNextButton() {
        return super.hasNextButton();
    }
}