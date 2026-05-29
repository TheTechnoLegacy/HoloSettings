package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;

class DataUsageSummary$7 implements OnClickListener {
    final /* synthetic */ DataUsageSummary this$0;

    public void onClick(View view) {
        if (this.this$0.isAdded()) {
            this.this$0.startActivity(DataUsageSummary.access$1100(this.this$0));
        }
    }

    DataUsageSummary$7(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }
}