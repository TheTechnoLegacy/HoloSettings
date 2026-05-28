package com.jellybyn.settings.accounts;

import android.app.ActivityManager;
import android.content.ContentResolver;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.util.Log;

class SyncSettings$1 implements OnPreferenceChangeListener {
    final /* synthetic */ SyncSettings this$0;

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (ActivityManager.isUserAMonkey()) {
            Log.d("SyncSettings", "ignoring monkey's attempt to flip sync state");
        } else {
            ContentResolver.setMasterSyncAutomatically(((Boolean) obj).booleanValue());
        }
        return true;
    }

    SyncSettings$1(SyncSettings syncSettings) {
        this.this$0 = syncSettings;
    }
}