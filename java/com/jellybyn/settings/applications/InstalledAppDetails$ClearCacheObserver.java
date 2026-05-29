package com.jellybyn.settings.applications;

import android.content.pm.IPackageDataObserver.Stub;
import android.os.Message;

class InstalledAppDetails$ClearCacheObserver extends Stub {
    final /* synthetic */ InstalledAppDetails this$0;

    public void onRemoveCompleted(String str, boolean z) {
        Message msg = InstalledAppDetails.access$400(this.this$0).obtainMessage(3);
        msg.arg1 = z ? 1 : 2;
        InstalledAppDetails.access$400(this.this$0).sendMessage(msg);
    }

    InstalledAppDetails$ClearCacheObserver(InstalledAppDetails installedAppDetails) {
        this.this$0 = installedAppDetails;
    }
}