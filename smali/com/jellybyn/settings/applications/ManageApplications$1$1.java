package com.jellybyn.settings.applications;

import com.jellybyn.settings.applications.ManageApplications.1;
import com.jellybyn.settings.applications.ManageApplications.TabInfo;

class ManageApplications$1$1 implements Runnable {
    final /* synthetic */ 1 this$1;

    public void run() {
        if (this.this$1.this$0.getActivity() != null && ManageApplications.access$1200(this.this$1.this$0)) {
            for (int i = 0; i < ManageApplications.access$100(this.this$1.this$0).size(); i++) {
                TabInfo tabInfo = (TabInfo) ManageApplications.access$100(this.this$1.this$0).get(i);
                if (tabInfo.mApplications != null) {
                    tabInfo.mApplications.pause();
                }
            }
            if (this.this$1.this$0.mCurTab != null) {
                this.this$1.this$0.mCurTab.resume(ManageApplications.access$1300(this.this$1.this$0));
            }
        }
    }

    ManageApplications$1$1(1 1) {
        this.this$1 = 1;
    }
}