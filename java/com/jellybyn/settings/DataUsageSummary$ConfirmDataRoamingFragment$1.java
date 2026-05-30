package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.DataUsageSummary.ConfirmDataRoamingFragment;

class DataUsageSummary$ConfirmDataRoamingFragment$1 implements OnClickListener {
    final /* synthetic */ ConfirmDataRoamingFragment this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        DataUsageSummary target = (DataUsageSummary) this.this$0.getTargetFragment();
        if (target != null) {
            DataUsageSummary.access$2800(target, true);
        }
    }

    DataUsageSummary$ConfirmDataRoamingFragment$1(ConfirmDataRoamingFragment confirmDataRoamingFragment) {
        this.this$0 = confirmDataRoamingFragment;
    }
}