package com.jellybyn.settings;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.SparseBooleanArray;

public class DataUsageSummary$AppItem implements Comparable<DataUsageSummary$AppItem>, Parcelable {
    public static final Creator<DataUsageSummary$AppItem> CREATOR = new 1();
    public final int key;
    public boolean restricted;
    public long total;
    public SparseBooleanArray uids = new SparseBooleanArray();

    public DataUsageSummary$AppItem(Parcel parcel) {
        this.key = parcel.readInt();
        this.uids = parcel.readSparseBooleanArray();
        this.total = parcel.readLong();
    }

    public DataUsageSummary$AppItem(int i) {
        this.key = i;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.key);
        parcel.writeSparseBooleanArray(this.uids);
        parcel.writeLong(this.total);
    }

    public void addUid(int i) {
        this.uids.put(i, true);
    }

    public int compareTo(DataUsageSummary$AppItem dataUsageSummary$AppItem) {
        return Long.compare(dataUsageSummary$AppItem.total, this.total);
    }

    public int describeContents() {
        return 0;
    }
}