package com.jellybyn.settings.applications;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class AppOpsState$OpsTemplate implements Parcelable {
    public static final Creator<AppOpsState$OpsTemplate> CREATOR = new 1();
    public final int[] ops;
    public final boolean[] showPerms;

    AppOpsState$OpsTemplate(Parcel parcel) {
        this.ops = parcel.createIntArray();
        this.showPerms = parcel.createBooleanArray();
    }

    public AppOpsState$OpsTemplate(int[] iArr, boolean[] zArr) {
        this.ops = iArr;
        this.showPerms = zArr;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeIntArray(this.ops);
        parcel.writeBooleanArray(this.showPerms);
    }

    public int describeContents() {
        return 0;
    }
}