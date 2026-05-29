package com.jellybyn.settings;

import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;

class ApplicationSettings$1 implements OnPreferenceChangeListener {
    final /* synthetic */ ApplicationSettings this$0;

    public boolean onPreferenceChange(Preference preference, Object obj) {
        this.this$0.handleUpdateAppInstallLocation((String) obj);
        return false;
    }

    ApplicationSettings$1(ApplicationSettings applicationSettings) {
        this.this$0 = applicationSettings;
    }
}