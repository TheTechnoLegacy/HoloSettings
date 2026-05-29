package com.jellybyn.settings.applications;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.jellybyn.settings.applications.AppOpsState.OpsTemplate;

class AppOpsState$OpsTemplate$1 implements Creator<OpsTemplate> {
    AppOpsState$OpsTemplate$1() {
    }

    public OpsTemplate createFromParcel(Parcel parcel) {
        return new OpsTemplate(parcel);
    }

    public OpsTemplate[] newArray(int i) {
        return new OpsTemplate[i];
    }
}