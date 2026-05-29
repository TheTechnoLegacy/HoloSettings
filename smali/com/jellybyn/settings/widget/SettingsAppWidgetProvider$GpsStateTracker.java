package com.jellybyn.settings.widget;

import android.content.Context;
import android.content.Intent;
import android.provider.Settings.Secure;
import com.jellybyn.settings.widget.SettingsAppWidgetProvider.StateTracker;

final class SettingsAppWidgetProvider$GpsStateTracker extends StateTracker {
    public int getActualState(Context context) {
        return Secure.isLocationProviderEnabled(context.getContentResolver(), "gps") ? 1 : 0;
    }

    public void requestStateChange(Context context, boolean z) {
        new 1(this, context, context.getContentResolver(), z).execute(new Void[0]);
    }

    public void onActualStateChange(Context context, Intent intent) {
        setCurrentState(context, getActualState(context));
    }

    private SettingsAppWidgetProvider$GpsStateTracker() {
        super(null);
    }

    public int getButtonDescription() {
        return 2131428749;
    }

    public int getButtonId() {
        return 2131231113;
    }

    public int getButtonImageId(boolean z) {
        return z ? 2130837564 : 2130837563;
    }

    public int getContainerId() {
        return 2131231112;
    }

    public int getIndicatorId() {
        return 2131231114;
    }
}