package com.jellybyn.settings.applications;

import android.view.View;
import android.view.View.OnClickListener;

class RunningProcessesView$1 implements OnClickListener {
    final /* synthetic */ RunningProcessesView this$0;

    public void onClick(View view) {
        this.this$0.mAdapter.setShowBackground(true);
    }

    RunningProcessesView$1(RunningProcessesView runningProcessesView) {
        this.this$0 = runningProcessesView;
    }
}