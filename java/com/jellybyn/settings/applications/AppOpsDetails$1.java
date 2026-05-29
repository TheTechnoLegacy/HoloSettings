package com.jellybyn.settings.applications;

import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import com.jellybyn.settings.applications.AppOpsState.AppOpEntry;

class AppOpsDetails$1 implements OnCheckedChangeListener {
    final /* synthetic */ AppOpsDetails this$0;
    final /* synthetic */ AppOpEntry val$entry;
    final /* synthetic */ int val$switchOp;

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        AppOpsDetails.access$000(this.this$0).setMode(this.val$switchOp, this.val$entry.getPackageOps().getUid(), this.val$entry.getPackageOps().getPackageName(), z ? 0 : 1);
    }

    AppOpsDetails$1(AppOpsDetails appOpsDetails, int i, AppOpEntry appOpEntry) {
        this.this$0 = appOpsDetails;
        this.val$switchOp = i;
        this.val$entry = appOpEntry;
    }
}