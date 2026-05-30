package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.DataUsageSummary.ConfirmRestrictFragment;

class DataUsageSummary$ConfirmRestrictFragment$1 implements OnClickListener {
    final /* synthetic */ ConfirmRestrictFragment this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        DataUsageSummary target = (DataUsageSummary) this.this$0.getTargetFragment();
        if (target != null) {
            target.setRestrictBackground(true);
        }
    }

    DataUsageSummary$ConfirmRestrictFragment$1(ConfirmRestrictFragment confirmRestrictFragment) {
        this.this$0 = confirmRestrictFragment;
    }
}