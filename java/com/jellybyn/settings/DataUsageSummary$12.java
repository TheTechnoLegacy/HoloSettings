package com.jellybyn.settings;

import com.jellybyn.settings.DataUsageSummary.LimitEditorFragment;
import com.jellybyn.settings.DataUsageSummary.WarningEditorFragment;
import com.jellybyn.settings.widget.ChartDataUsageView.DataUsageChartListener;

class DataUsageSummary$12 implements DataUsageChartListener {
    final /* synthetic */ DataUsageSummary this$0;

    public void onInspectRangeChanged() {
        DataUsageSummary.access$1500(this.this$0);
    }

    public void onLimitChanged() {
        DataUsageSummary.access$800(this.this$0, DataUsageSummary.access$1400(this.this$0).getLimitBytes());
    }

    public void onWarningChanged() {
        DataUsageSummary.access$2400(this.this$0, DataUsageSummary.access$1400(this.this$0).getWarningBytes());
    }

    public void requestLimitEdit() {
        LimitEditorFragment.show(this.this$0);
    }

    public void requestWarningEdit() {
        WarningEditorFragment.show(this.this$0);
    }

    DataUsageSummary$12(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }
}