package com.jellybyn.settings.widget;

import com.jellybyn.settings.widget.ChartSweepView.OnSweepListener;

class ChartDataUsageView$3 implements OnSweepListener {
    final /* synthetic */ ChartDataUsageView this$0;

    public void onSweep(ChartSweepView chartSweepView, boolean z) {
        if (z) {
            ChartDataUsageView.access$500(this.this$0, chartSweepView);
            ChartDataUsageView.access$100(this.this$0);
            if (chartSweepView == ChartDataUsageView.access$600(this.this$0) && ChartDataUsageView.access$400(this.this$0) != null) {
                ChartDataUsageView.access$400(this.this$0).onWarningChanged();
                return;
            } else if (chartSweepView == ChartDataUsageView.access$700(this.this$0) && ChartDataUsageView.access$400(this.this$0) != null) {
                ChartDataUsageView.access$400(this.this$0).onLimitChanged();
                return;
            } else {
                return;
            }
        }
        ChartDataUsageView.access$200(this.this$0, chartSweepView, false);
    }

    public void requestEdit(ChartSweepView chartSweepView) {
        if (chartSweepView == ChartDataUsageView.access$600(this.this$0) && ChartDataUsageView.access$400(this.this$0) != null) {
            ChartDataUsageView.access$400(this.this$0).requestWarningEdit();
        } else if (chartSweepView == ChartDataUsageView.access$700(this.this$0) && ChartDataUsageView.access$400(this.this$0) != null) {
            ChartDataUsageView.access$400(this.this$0).requestLimitEdit();
        }
    }

    ChartDataUsageView$3(ChartDataUsageView chartDataUsageView) {
        this.this$0 = chartDataUsageView;
    }
}