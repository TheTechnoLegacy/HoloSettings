package com.jellybyn.settings.applications;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.android.internal.app.IMediaContainerService.Stub;
import com.jellybyn.settings.applications.ManageApplications.TabInfo;

class ManageApplications$2 implements ServiceConnection {
    final /* synthetic */ ManageApplications this$0;

    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        ManageApplications.access$1402(this.this$0, Stub.asInterface(iBinder));
        for (int i = 0; i < ManageApplications.access$100(this.this$0).size(); i++) {
            ((TabInfo) ManageApplications.access$100(this.this$0).get(i)).setContainerService(ManageApplications.access$1400(this.this$0));
        }
    }

    public void onServiceDisconnected(ComponentName componentName) {
        ManageApplications.access$1402(this.this$0, null);
    }

    ManageApplications$2(ManageApplications manageApplications) {
        this.this$0 = manageApplications;
    }
}