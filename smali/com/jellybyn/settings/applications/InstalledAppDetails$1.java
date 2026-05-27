package com.jellybyn.settings.applications;

import android.os.Handler;
import android.os.Message;

class InstalledAppDetails$1 extends Handler {
    final /* synthetic */ InstalledAppDetails this$0;

    public void handleMessage(Message message) {
        if (this.this$0.getView() != null) {
            switch (message.what) {
                case 1:
                    InstalledAppDetails.access$000(this.this$0, message);
                    return;
                case 3:
                    InstalledAppDetails.access$200(this.this$0).requestSize(InstalledAppDetails.access$100(this.this$0).info.packageName);
                    return;
                case 4:
                    InstalledAppDetails.access$300(this.this$0, message);
                    return;
                default:
                    return;
            }
        }
    }

    InstalledAppDetails$1(InstalledAppDetails installedAppDetails) {
        this.this$0 = installedAppDetails;
    }
}