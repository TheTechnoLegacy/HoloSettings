package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;
import com.jellybyn.settings.NotificationStation.HistoricalNotificationInfo;
import com.jellybyn.settings.NotificationStation.NotificationHistoryAdapter;

class NotificationStation$NotificationHistoryAdapter$1 implements OnClickListener {
    final /* synthetic */ NotificationHistoryAdapter this$1;
    final /* synthetic */ HistoricalNotificationInfo val$info;

    public void onClick(View view) {
        view.setPressed(true);
        NotificationStation.access$600(this.this$1.this$0, this.val$info.pkg);
    }

    NotificationStation$NotificationHistoryAdapter$1(NotificationHistoryAdapter notificationHistoryAdapter, HistoricalNotificationInfo historicalNotificationInfo) {
        this.this$1 = notificationHistoryAdapter;
        this.val$info = historicalNotificationInfo;
    }
}