package com.jellybyn.settings.widget;

import android.os.Handler;
import android.os.Message;

class ChartDataUsageView$1 extends Handler {
    final /* synthetic */ ChartDataUsageView this$0;

    public void handleMessage(Message message) {
        ChartSweepView sweep = message.obj;
        ChartDataUsageView.access$000(this.this$0, sweep);
        ChartDataUsageView.access$100(this.this$0);
        ChartDataUsageView.access$200(this.this$0, sweep, true);
    }

    ChartDataUsageView$1(ChartDataUsageView chartDataUsageView) {
        this.this$0 = chartDataUsageView;
    }
}