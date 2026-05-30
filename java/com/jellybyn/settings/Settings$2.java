package com.jellybyn.settings;

import android.content.SharedPreferences;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;

class Settings$2 implements OnSharedPreferenceChangeListener {
    final /* synthetic */ Settings this$0;

    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
        this.this$0.invalidateHeaders();
    }

    Settings$2(Settings settings) {
        this.this$0 = settings;
    }
}