package com.jellybyn.settings.widget;

import android.content.ContentResolver;
import android.content.Context;
import android.os.AsyncTask;
import android.os.UserManager;
import android.provider.Settings.Secure;
import com.jellybyn.settings.widget.SettingsAppWidgetProvider.GpsStateTracker;

class SettingsAppWidgetProvider$GpsStateTracker$1 extends AsyncTask<Void, Void, Boolean> {
    final /* synthetic */ GpsStateTracker this$0;
    final /* synthetic */ Context val$context;
    final /* synthetic */ boolean val$desiredState;
    final /* synthetic */ ContentResolver val$resolver;

    protected Boolean doInBackground(Void... voidArr) {
        if (((UserManager) this.val$context.getSystemService("user")).hasUserRestriction("no_share_location")) {
            return Boolean.valueOf(Secure.isLocationProviderEnabled(this.val$resolver, "gps"));
        }
        Secure.setLocationProviderEnabled(this.val$resolver, "gps", this.val$desiredState);
        return Boolean.valueOf(this.val$desiredState);
    }

    protected void onPostExecute(Boolean bool) {
        this.this$0.setCurrentState(this.val$context, bool.booleanValue() ? 1 : 0);
        SettingsAppWidgetProvider.updateWidget(this.val$context);
    }

    SettingsAppWidgetProvider$GpsStateTracker$1(GpsStateTracker gpsStateTracker, Context context, ContentResolver contentResolver, boolean z) {
        this.this$0 = gpsStateTracker;
        this.val$context = context;
        this.val$resolver = contentResolver;
        this.val$desiredState = z;
    }
}