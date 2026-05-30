package com.jellybyn.settings;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class DateTimeSettings$1 extends BroadcastReceiver {
    final /* synthetic */ DateTimeSettings this$0;

    public void onReceive(Context context, Intent intent) {
        Activity activity = this.this$0.getActivity();
        if (activity != null) {
            this.this$0.updateTimeAndDateDisplay(activity);
        }
    }

    DateTimeSettings$1(DateTimeSettings dateTimeSettings) {
        this.this$0 = dateTimeSettings;
    }
}