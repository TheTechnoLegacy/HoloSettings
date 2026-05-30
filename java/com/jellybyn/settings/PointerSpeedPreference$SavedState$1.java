package com.jellybyn.settings;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.jellybyn.settings.PointerSpeedPreference.SavedState;

class PointerSpeedPreference$SavedState$1 implements Creator<SavedState> {
    PointerSpeedPreference$SavedState$1() {
    }

    public SavedState createFromParcel(Parcel parcel) {
        return new SavedState(parcel);
    }

    public SavedState[] newArray(int i) {
        return new SavedState[i];
    }
}