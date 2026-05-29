package com.jellybyn.settings;

import android.view.View;
import android.widget.TabHost.TabContentFactory;

class DataUsageSummary$2 implements TabContentFactory {
    final /* synthetic */ DataUsageSummary this$0;

    DataUsageSummary$2(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }

    public View createTabContent(String str) {
        return new View(DataUsageSummary.access$200(this.this$0).getContext());
    }
}