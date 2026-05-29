package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;
import com.jellybyn.settings.DataUsageSummary.ConfirmAppRestrictFragment;

class DataUsageSummary$6 implements OnClickListener {
    final /* synthetic */ DataUsageSummary this$0;

    public void onClick(View view) {
        if (!DataUsageSummary.access$900(this.this$0).isChecked()) {
            ConfirmAppRestrictFragment.show(this.this$0);
        } else {
            DataUsageSummary.access$1000(this.this$0, false);
        }
    }

    DataUsageSummary$6(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }
}