package com.jellybyn.settings;

import com.jellybyn.settings.NotificationStation.HistoricalNotificationInfo;
import java.util.Comparator;

class NotificationStation$3 implements Comparator<HistoricalNotificationInfo> {
    final /* synthetic */ NotificationStation this$0;

    NotificationStation$3(NotificationStation notificationStation) {
        this.this$0 = notificationStation;
    }

    public int compare(HistoricalNotificationInfo historicalNotificationInfo, HistoricalNotificationInfo historicalNotificationInfo2) {
        return (int) (historicalNotificationInfo2.timestamp - historicalNotificationInfo.timestamp);
    }
}