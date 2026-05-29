package com.jellybyn.settings.deviceinfo;

import android.graphics.Paint;

public class PercentageBarChart$Entry implements Comparable<PercentageBarChart$Entry> {
    public final int order;
    public final Paint paint;
    public final float percentage;

    protected PercentageBarChart$Entry(int i, float f, Paint paint) {
        this.order = i;
        this.percentage = f;
        this.paint = paint;
    }

    public int compareTo(PercentageBarChart$Entry percentageBarChart$Entry) {
        return this.order - percentageBarChart$Entry.order;
    }
}