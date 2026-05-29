package com.jellybyn.settings.widget;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import com.jellybyn.settings.widget.SettingsAppWidgetProvider.StateTracker;

final class SettingsAppWidgetProvider$SyncStateTracker extends StateTracker {
    public void requestStateChange(Context context, boolean z) {
        ConnectivityManager connManager = (ConnectivityManager) context.getSystemService("connectivity");
        new 1(this, z, ContentResolver.getMasterSyncAutomatically(), context).execute(new Void[0]);
    }

    public int getActualState(Context context) {
        return ContentResolver.getMasterSyncAutomatically() ? 1 : 0;
    }

    public void onActualStateChange(Context context, Intent intent) {
        setCurrentState(context, getActualState(context));
    }

    private SettingsAppWidgetProvider$SyncStateTracker() {
        super(null);
    }

    public int getButtonDescription() {
        return 2131428750;
    }

    public int getButtonId() {
        return 2131231116;
    }

    public int getButtonImageId(boolean z) {
        return z ? 2130837566 : 2130837565;
    }

    public int getContainerId() {
        return 2131231115;
    }

    public int getIndicatorId() {
        return 2131231117;
    }
}