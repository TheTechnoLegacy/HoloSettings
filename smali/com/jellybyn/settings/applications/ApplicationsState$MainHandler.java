package com.jellybyn.settings.applications;

import android.os.Handler;
import android.os.Message;
import com.jellybyn.settings.applications.ApplicationsState.Session;

class ApplicationsState$MainHandler extends Handler {
    final /* synthetic */ ApplicationsState this$0;

    public void handleMessage(Message message) {
        this.this$0.rebuildActiveSessions();
        int i;
        switch (message.what) {
            case 1:
                Session session = (Session) message.obj;
                if (this.this$0.mActiveSessions.contains(session)) {
                    session.mCallbacks.onRebuildComplete(session.mLastAppList);
                    return;
                }
                return;
            case 2:
                for (i = 0; i < this.this$0.mActiveSessions.size(); i++) {
                    ((Session) this.this$0.mActiveSessions.get(i)).mCallbacks.onPackageListChanged();
                }
                return;
            case 3:
                for (i = 0; i < this.this$0.mActiveSessions.size(); i++) {
                    ((Session) this.this$0.mActiveSessions.get(i)).mCallbacks.onPackageIconChanged();
                }
                return;
            case 4:
                for (i = 0; i < this.this$0.mActiveSessions.size(); i++) {
                    ((Session) this.this$0.mActiveSessions.get(i)).mCallbacks.onPackageSizeChanged((String) message.obj);
                }
                return;
            case 5:
                for (i = 0; i < this.this$0.mActiveSessions.size(); i++) {
                    ((Session) this.this$0.mActiveSessions.get(i)).mCallbacks.onAllSizesComputed();
                }
                return;
            case 6:
                for (i = 0; i < this.this$0.mActiveSessions.size(); i++) {
                    ((Session) this.this$0.mActiveSessions.get(i)).mCallbacks.onRunningStateChanged(message.arg1 != 0);
                }
                return;
            default:
                return;
        }
    }

    ApplicationsState$MainHandler(ApplicationsState applicationsState) {
        this.this$0 = applicationsState;
    }
}