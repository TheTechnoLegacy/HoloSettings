package com.jellybyn.settings.applications;

import android.app.Activity;

class RunningServiceDetails$1 implements Runnable {
    final /* synthetic */ RunningServiceDetails this$0;

    public void run() {
        Activity a = this.this$0.getActivity();
        if (a != null) {
            a.onBackPressed();
        }
    }

    RunningServiceDetails$1(RunningServiceDetails runningServiceDetails) {
        this.this$0 = runningServiceDetails;
    }
}