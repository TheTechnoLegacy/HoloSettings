package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.DataUsageSummary.ConfirmDataDisableFragment;

class DataUsageSummary$ConfirmDataDisableFragment$1 implements OnClickListener {
    final /* synthetic */ ConfirmDataDisableFragment this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        DataUsageSummary target = (DataUsageSummary) this.this$0.getTargetFragment();
        if (target != null) {
            DataUsageSummary.access$500(target, false);
        }
    }

    DataUsageSummary$ConfirmDataDisableFragment$1(ConfirmDataDisableFragment confirmDataDisableFragment) {
        this.this$0 = confirmDataDisableFragment;
    }
}