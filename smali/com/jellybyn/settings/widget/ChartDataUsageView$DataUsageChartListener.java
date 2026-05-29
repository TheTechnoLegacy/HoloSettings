package com.jellybyn.settings.widget;

public interface ChartDataUsageView$DataUsageChartListener {
    void onInspectRangeChanged();

    void onLimitChanged();

    void onWarningChanged();

    void requestLimitEdit();

    void requestWarningEdit();
}