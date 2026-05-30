package com.jellybyn.settings;

import android.os.Handler;
import android.os.RemoteException;
import android.service.notification.INotificationListener.Stub;
import android.service.notification.StatusBarNotification;
import android.util.Log;

class NotificationStation$2 extends Stub {
    final /* synthetic */ NotificationStation this$0;

    public void onNotificationPosted(StatusBarNotification statusBarNotification) throws RemoteException {
        Log.v(NotificationStation.access$200(), "onNotificationPosted: " + statusBarNotification);
        Handler h = this.this$0.getListView().getHandler();
        h.removeCallbacks(NotificationStation.access$300(this.this$0));
        h.postDelayed(NotificationStation.access$300(this.this$0), 100);
    }

    public void onNotificationRemoved(StatusBarNotification statusBarNotification) throws RemoteException {
        Handler h = this.this$0.getListView().getHandler();
        h.removeCallbacks(NotificationStation.access$300(this.this$0));
        h.postDelayed(NotificationStation.access$300(this.this$0), 100);
    }

    NotificationStation$2(NotificationStation notificationStation) {
        this.this$0 = notificationStation;
    }
}