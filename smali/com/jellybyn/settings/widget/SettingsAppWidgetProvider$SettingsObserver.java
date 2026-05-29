package com.jellybyn.settings.widget;

import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.os.Handler;
import android.provider.Settings.System;

class SettingsAppWidgetProvider$SettingsObserver extends ContentObserver {
    private Context mContext;

    void startObserving() {
        ContentResolver resolver = this.mContext.getContentResolver();
        resolver.registerContentObserver(System.getUriFor("screen_brightness"), false, this);
        resolver.registerContentObserver(System.getUriFor("screen_brightness_mode"), false, this);
    }

    SettingsAppWidgetProvider$SettingsObserver(Handler handler, Context context) {
        super(handler);
        this.mContext = context;
    }

    public void onChange(boolean z) {
        SettingsAppWidgetProvider.updateWidget(this.mContext);
    }

    void stopObserving() {
        this.mContext.getContentResolver().unregisterContentObserver(this);
    }
}