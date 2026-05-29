package com.jellybyn.settings.widget;

import android.content.res.Resources;
import android.text.SpannableStringBuilder;
import com.android.internal.util.Objects;

public class ChartDataUsageView$DataAxis implements ChartAxis {
    private static final Object sSpanSize = new Object();
    private static final Object sSpanUnit = new Object();
    private long mMax;
    private long mMin;
    private float mSize;

    public long buildLabel(Resources resources, SpannableStringBuilder spannableStringBuilder, long j) {
        CharSequence unit;
        long unitFactor;
        CharSequence size;
        double resultRounded;
        if (j < 1048576000) {
            unit = resources.getText(17039480);
            unitFactor = 1048576;
        } else {
            unit = resources.getText(17039481);
            unitFactor = 1073741824;
        }
        double result = ((double) j) / ((double) unitFactor);
        if (result < 10.0d) {
            size = String.format("%.1f", new Object[]{Double.valueOf(result)});
            resultRounded = (double) ((Math.round(10.0d * result) * unitFactor) / 10);
        } else {
            size = String.format("%.0f", new Object[]{Double.valueOf(result)});
            resultRounded = (double) (Math.round(result) * unitFactor);
        }
        ChartDataUsageView.access$800(spannableStringBuilder, sSpanSize, size, "^1");
        ChartDataUsageView.access$800(spannableStringBuilder, sSpanUnit, unit, "^2");
        return (long) resultRounded;
    }

    public float[] getTickPoints() {
        long range = this.mMax - this.mMin;
        long tickJump = ChartDataUsageView.access$900(range / 16);
        float[] tickPoints = new float[((int) (range / tickJump))];
        long value = this.mMin;
        for (int i = 0; i < tickPoints.length; i++) {
            tickPoints[i] = convertToPoint(value);
            value += tickJump;
        }
        return tickPoints;
    }

    public int shouldAdjustAxis(long j) {
        float point = convertToPoint(j);
        if (((double) point) < ((double) this.mSize) * 0.1d) {
            return -1;
        }
        return ((double) point) > ((double) this.mSize) * 0.85d ? 1 : 0;
    }

    public boolean setBounds(long j, long j2) {
        if (this.mMin == j && this.mMax == j2) {
            return false;
        }
        this.mMin = j;
        this.mMax = j2;
        return true;
    }

    public boolean setSize(float f) {
        if (this.mSize == f) {
            return false;
        }
        this.mSize = f;
        return true;
    }

    public float convertToPoint(long j) {
        return (this.mSize * ((float) (j - this.mMin))) / ((float) (this.mMax - this.mMin));
    }

    public long convertToValue(float f) {
        return (long) (((float) this.mMin) + ((((float) (this.mMax - this.mMin)) * f) / this.mSize));
    }

    public int hashCode() {
        return Objects.hashCode(new Object[]{Long.valueOf(this.mMin), Long.valueOf(this.mMax), Float.valueOf(this.mSize)});
    }
}