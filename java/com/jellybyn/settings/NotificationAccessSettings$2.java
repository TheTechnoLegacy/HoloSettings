package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class NotificationAccessSettings$2 extends BroadcastReceiver {
    final /* synthetic */ NotificationAccessSettings this$0;

    public void onReceive(Context context, Intent intent) {
        this.this$0.updateList();
    }

    NotificationAccessSettings$2(NotificationAccessSettings notificationAccessSettings) {
        this.this$0 = notificationAccessSettings;
    }
}