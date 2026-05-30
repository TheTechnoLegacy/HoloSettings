package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.DataUsageSummary.ConfirmLimitFragment;

class DataUsageSummary$ConfirmLimitFragment$1 implements OnClickListener {
    final /* synthetic */ ConfirmLimitFragment this$0;
    final /* synthetic */ long val$limitBytes;

    public void onClick(DialogInterface dialogInterface, int i) {
        DataUsageSummary target = (DataUsageSummary) this.this$0.getTargetFragment();
        if (target != null) {
            DataUsageSummary.access$800(target, this.val$limitBytes);
        }
    }

    DataUsageSummary$ConfirmLimitFragment$1(ConfirmLimitFragment confirmLimitFragment, long j) {
        this.this$0 = confirmLimitFragment;
        this.val$limitBytes = j;
    }
}