package com.jellybyn.settings.applications;

import android.view.View;
import android.view.View.OnClickListener;

class RunningProcessesView$2 implements OnClickListener {
    final /* synthetic */ RunningProcessesView this$0;

    public void onClick(View view) {
        this.this$0.mAdapter.setShowBackground(false);
    }

    RunningProcessesView$2(RunningProcessesView runningProcessesView) {
        this.this$0 = runningProcessesView;
    }
}