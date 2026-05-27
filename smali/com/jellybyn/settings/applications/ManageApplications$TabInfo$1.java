package com.jellybyn.settings.applications;

import com.jellybyn.settings.applications.ManageApplications.TabInfo;

class ManageApplications$TabInfo$1 implements Runnable {
    final /* synthetic */ TabInfo this$0;

    public void run() {
        this.this$0.handleRunningProcessesAvail();
    }

    ManageApplications$TabInfo$1(TabInfo tabInfo) {
        this.this$0 = tabInfo;
    }
}