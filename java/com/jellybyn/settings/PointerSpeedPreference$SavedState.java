package com.jellybyn.settings;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.preference.Preference.BaseSavedState;

class PointerSpeedPreference$SavedState extends BaseSavedState {
    public static final Creator<PointerSpeedPreference$SavedState> CREATOR = new 1();
    int oldSpeed;
    int progress;

    public PointerSpeedPreference$SavedState(Parcel parcel) {
        this.progress = parcel.readInt();
        this.oldSpeed = parcel.readInt();
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.progress);
        parcel.writeInt(this.oldSpeed);
    }

    public PointerSpeedPreference$SavedState(Parcelable parcelable) {
        super(parcelable);
    }
}