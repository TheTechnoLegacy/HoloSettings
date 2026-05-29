package com.jellybyn.settings.widget;

import com.jellybyn.settings.widget.ChartSweepView.OnSweepListener;

class ChartDataUsageView$2 implements OnSweepListener {
    final /* synthetic */ ChartDataUsageView this$0;

    public void onSweep(ChartSweepView chartSweepView, boolean z) {
        ChartDataUsageView.access$300(this.this$0);
        if (z && ChartDataUsageView.access$400(this.this$0) != null) {
            ChartDataUsageView.access$400(this.this$0).onInspectRangeChanged();
        }
    }

    ChartDataUsageView$2(ChartDataUsageView chartDataUsageView) {
        this.this$0 = chartDataUsageView;
    }

    public void requestEdit(ChartSweepView chartSweepView) {
    }
}