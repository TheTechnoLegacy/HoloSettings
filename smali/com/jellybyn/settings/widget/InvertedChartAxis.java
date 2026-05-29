package com.jellybyn.settings.widget;

import android.content.res.Resources;
import android.text.SpannableStringBuilder;

public class InvertedChartAxis implements ChartAxis {
    private float mSize;
    private final ChartAxis mWrapped;

    public float[] getTickPoints() {
        float[] points = this.mWrapped.getTickPoints();
        for (int i = 0; i < points.length; i++) {
            points[i] = this.mSize - points[i];
        }
        return points;
    }

    public InvertedChartAxis(ChartAxis chartAxis) {
        this.mWrapped = chartAxis;
    }

    public boolean setSize(float f) {
        this.mSize = f;
        return this.mWrapped.setSize(f);
    }

    public long buildLabel(Resources resources, SpannableStringBuilder spannableStringBuilder, long j) {
        return this.mWrapped.buildLabel(resources, spannableStringBuilder, j);
    }

    public float convertToPoint(long j) {
        return this.mSize - this.mWrapped.convertToPoint(j);
    }

    public long convertToValue(float f) {
        return this.mWrapped.convertToValue(this.mSize - f);
    }

    public boolean setBounds(long j, long j2) {
        return this.mWrapped.setBounds(j, j2);
    }

    public int shouldAdjustAxis(long j) {
        return this.mWrapped.shouldAdjustAxis(j);
    }
}