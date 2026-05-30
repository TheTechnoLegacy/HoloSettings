package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.DataUsageSummary.ConfirmAppRestrictFragment;

class DataUsageSummary$ConfirmAppRestrictFragment$1 implements OnClickListener {
    final /* synthetic */ ConfirmAppRestrictFragment this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        DataUsageSummary target = (DataUsageSummary) this.this$0.getTargetFragment();
        if (target != null) {
            DataUsageSummary.access$1000(target, true);
        }
    }

    DataUsageSummary$ConfirmAppRestrictFragment$1(ConfirmAppRestrictFragment confirmAppRestrictFragment) {
        this.this$0 = confirmAppRestrictFragment;
    }
}