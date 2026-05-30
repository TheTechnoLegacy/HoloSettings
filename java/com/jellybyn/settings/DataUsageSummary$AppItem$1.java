package com.jellybyn.settings;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.jellybyn.settings.DataUsageSummary.AppItem;

class DataUsageSummary$AppItem$1 implements Creator<AppItem> {
    DataUsageSummary$AppItem$1() {
    }

    public AppItem createFromParcel(Parcel parcel) {
        return new AppItem(parcel);
    }

    public AppItem[] newArray(int i) {
        return new AppItem[i];
    }
}