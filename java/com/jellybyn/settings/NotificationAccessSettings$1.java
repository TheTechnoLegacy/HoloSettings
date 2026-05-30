package com.jellybyn.settings;

import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;

class NotificationAccessSettings$1 extends ContentObserver {
    final /* synthetic */ NotificationAccessSettings this$0;

    public void onChange(boolean z, Uri uri) {
        this.this$0.updateList();
    }

    NotificationAccessSettings$1(NotificationAccessSettings notificationAccessSettings, Handler handler) {
        this.this$0 = notificationAccessSettings;
        super(handler);
    }
}