package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;
import com.jellybyn.settings.DataUsageSummary.ConfirmLimitFragment;

class DataUsageSummary$5 implements OnClickListener {
    final /* synthetic */ DataUsageSummary this$0;

    public void onClick(View view) {
        if (!DataUsageSummary.access$700(this.this$0).isChecked()) {
            ConfirmLimitFragment.show(this.this$0);
        } else {
            DataUsageSummary.access$800(this.this$0, -1);
        }
    }

    DataUsageSummary$5(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }
}