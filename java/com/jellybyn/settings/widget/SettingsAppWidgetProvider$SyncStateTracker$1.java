package com.jellybyn.settings.widget;

import android.content.ContentResolver;
import android.content.Context;
import android.os.AsyncTask;
import com.jellybyn.settings.widget.SettingsAppWidgetProvider.SyncStateTracker;

class SettingsAppWidgetProvider$SyncStateTracker$1 extends AsyncTask<Void, Void, Boolean> {
    final /* synthetic */ SyncStateTracker this$0;
    final /* synthetic */ Context val$context;
    final /* synthetic */ boolean val$desiredState;
    final /* synthetic */ boolean val$sync;

    protected Boolean doInBackground(Void... voidArr) {
        if (this.val$desiredState) {
            if (!this.val$sync) {
                ContentResolver.setMasterSyncAutomatically(true);
            }
            return Boolean.valueOf(true);
        }
        if (this.val$sync) {
            ContentResolver.setMasterSyncAutomatically(false);
        }
        return Boolean.valueOf(false);
    }

    protected void onPostExecute(Boolean bool) {
        this.this$0.setCurrentState(this.val$context, bool.booleanValue() ? 1 : 0);
        SettingsAppWidgetProvider.updateWidget(this.val$context);
    }

    SettingsAppWidgetProvider$SyncStateTracker$1(SyncStateTracker syncStateTracker, boolean z, boolean z2, Context context) {
        this.this$0 = syncStateTracker;
        this.val$desiredState = z;
        this.val$sync = z2;
        this.val$context = context;
    }
}