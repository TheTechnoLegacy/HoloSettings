package com.jellybyn.settings.widget;

import android.graphics.Paint;
import android.graphics.Path;

public class PieChartView$Slice {
    public Paint paint;
    public Path path = new Path();
    public Path pathOutline = new Path();
    public Path pathSide = new Path();
    final /* synthetic */ PieChartView this$0;
    public long value;

    public PieChartView$Slice(PieChartView pieChartView, long j, int i) {
        this.this$0 = pieChartView;
        this.value = j;
        this.paint = PieChartView.access$000(i, pieChartView.getResources());
    }
}