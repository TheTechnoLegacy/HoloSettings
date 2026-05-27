package com.jellybyn.settings.applications;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class InstalledAppDetails$2 extends BroadcastReceiver {
    final /* synthetic */ InstalledAppDetails this$0;

    public void onReceive(Context context, Intent intent) {
        InstalledAppDetails.access$1300(this.this$0, getResultCode() != 0);
    }

    InstalledAppDetails$2(InstalledAppDetails installedAppDetails) {
        this.this$0 = installedAppDetails;
    }
}