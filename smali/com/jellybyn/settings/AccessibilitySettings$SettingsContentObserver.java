package com.jellybyn.settings;

import android.content.ContentResolver;
import android.database.ContentObserver;
import android.os.Handler;
import android.provider.Settings.Secure;

abstract class AccessibilitySettings$SettingsContentObserver extends ContentObserver {
    public void register(ContentResolver contentResolver) {
        contentResolver.registerContentObserver(Secure.getUriFor("accessibility_enabled"), false, this);
        contentResolver.registerContentObserver(Secure.getUriFor("enabled_accessibility_services"), false, this);
    }

    public AccessibilitySettings$SettingsContentObserver(Handler handler) {
    }

    public void unregister(ContentResolver contentResolver) {
        contentResolver.unregisterContentObserver(this);
    }
}