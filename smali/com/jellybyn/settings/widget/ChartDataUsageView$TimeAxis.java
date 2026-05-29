package com.jellybyn.settings.widget;

import android.content.res.Resources;
import android.text.SpannableStringBuilder;
import android.text.format.Time;
import com.android.internal.util.Objects;
import java.util.Arrays;
import java.util.Calendar;

public class ChartDataUsageView$TimeAxis implements ChartAxis {
    private static final int FIRST_DAY_OF_WEEK = (Calendar.getInstance().getFirstDayOfWeek() - 1);
    private long mMax;
    private long mMin;
    private float mSize;

    public float[] getTickPoints() {
        float[] ticks = new float[32];
        int i = 0;
        Time time = new Time();
        time.set(this.mMax);
        time.monthDay -= time.weekDay - FIRST_DAY_OF_WEEK;
        time.second = 0;
        time.minute = 0;
        time.hour = 0;
        time.normalize(true);
        for (long timeMillis = time.toMillis(true); timeMillis > this.mMin; timeMillis = time.toMillis(true)) {
            if (timeMillis <= this.mMax) {
                int i2 = i + 1;
                ticks[i] = convertToPoint(timeMillis);
                i = i2;
            }
            time.monthDay -= 7;
            time.normalize(true);
        }
        return Arrays.copyOf(ticks, i);
    }

    public boolean setBounds(long j, long j2) {
        if (this.mMin == j && this.mMax == j2) {
            return false;
        }
        this.mMin = j;
        this.mMax = j2;
        return true;
    }

    public ChartDataUsageView$TimeAxis() {
        long currentTime = System.currentTimeMillis();
        setBounds(currentTime - 2592000000L, currentTime);
    }

    public boolean setSize(float f) {
        if (this.mSize == f) {
            return false;
        }
        this.mSize = f;
        return true;
    }

    public long buildLabel(Resources resources, SpannableStringBuilder spannableStringBuilder, long j) {
        spannableStringBuilder.replace(0, spannableStringBuilder.length(), Long.toString(j));
        return j;
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

    public int shouldAdjustAxis(long j) {
        return 0;
    }
}