package com.jellybyn.settings;

import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import com.jellybyn.settings.DataUsageSummary.ConfirmDataDisableFragment;

class DataUsageSummary$4 implements OnCheckedChangeListener {
    final /* synthetic */ DataUsageSummary this$0;

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        if (!DataUsageSummary.access$300(this.this$0)) {
            boolean dataEnabled = z;
            if ("mobile".equals(DataUsageSummary.access$400(this.this$0))) {
                if (dataEnabled) {
                    DataUsageSummary.access$500(this.this$0, true);
                } else {
                    ConfirmDataDisableFragment.show(this.this$0);
                }
            }
            DataUsageSummary.access$600(this.this$0, false);
        }
    }

    DataUsageSummary$4(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }
}