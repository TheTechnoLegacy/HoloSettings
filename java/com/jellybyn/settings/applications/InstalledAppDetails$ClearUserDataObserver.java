package com.jellybyn.settings.applications;

import android.content.pm.IPackageDataObserver.Stub;
import android.os.Message;

class InstalledAppDetails$ClearUserDataObserver extends Stub {
    final /* synthetic */ InstalledAppDetails this$0;

    public void onRemoveCompleted(String str, boolean z) {
        int i = 1;
        Message msg = InstalledAppDetails.access$400(this.this$0).obtainMessage(1);
        if (!z) {
            i = 2;
        }
        msg.arg1 = i;
        InstalledAppDetails.access$400(this.this$0).sendMessage(msg);
    }

    InstalledAppDetails$ClearUserDataObserver(InstalledAppDetails installedAppDetails) {
        this.this$0 = installedAppDetails;
    }
}