package com.jellybyn.settings.applications;

import android.content.pm.IPackageMoveObserver.Stub;
import android.os.Message;
import android.os.RemoteException;

class InstalledAppDetails$PackageMoveObserver extends Stub {
    final /* synthetic */ InstalledAppDetails this$0;

    public void packageMoved(String str, int i) throws RemoteException {
        Message msg = InstalledAppDetails.access$400(this.this$0).obtainMessage(4);
        msg.arg1 = i;
        InstalledAppDetails.access$400(this.this$0).sendMessage(msg);
    }

    InstalledAppDetails$PackageMoveObserver(InstalledAppDetails installedAppDetails) {
        this.this$0 = installedAppDetails;
    }
}