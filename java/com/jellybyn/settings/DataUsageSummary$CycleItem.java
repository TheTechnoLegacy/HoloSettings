package com.jellybyn.settings;

import android.content.Context;

public class DataUsageSummary$CycleItem implements Comparable<DataUsageSummary$CycleItem> {
    public long end;
    public CharSequence label;
    public long start;

    public DataUsageSummary$CycleItem(Context context, long j, long j2) {
        this.label = DataUsageSummary.formatDateRange(context, j, j2);
        this.start = j;
        this.end = j2;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof DataUsageSummary$CycleItem)) {
            return false;
        }
        DataUsageSummary$CycleItem dataUsageSummary$CycleItem = (DataUsageSummary$CycleItem) obj;
        return this.start == dataUsageSummary$CycleItem.start && this.end == dataUsageSummary$CycleItem.end;
    }

    DataUsageSummary$CycleItem(CharSequence charSequence) {
        this.label = charSequence;
    }

    public int compareTo(DataUsageSummary$CycleItem dataUsageSummary$CycleItem) {
        return Long.compare(this.start, dataUsageSummary$CycleItem.start);
    }

    public String toString() {
        return this.label.toString();
    }
}