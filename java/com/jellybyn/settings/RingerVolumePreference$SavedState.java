package com.jellybyn.settings;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.preference.Preference.BaseSavedState;
import android.preference.VolumePreference.VolumeStore;

class RingerVolumePreference$SavedState extends BaseSavedState {
    public static final Creator<RingerVolumePreference$SavedState> CREATOR = new 1();
    VolumeStore[] mVolumeStore;

    public RingerVolumePreference$SavedState(Parcel parcel) {
        this.mVolumeStore = new VolumeStore[RingerVolumePreference.access$200().length];
        for (int i = 0; i < RingerVolumePreference.access$200().length; i++) {
            this.mVolumeStore[i] = new VolumeStore();
            this.mVolumeStore[i].volume = parcel.readInt();
            this.mVolumeStore[i].originalVolume = parcel.readInt();
        }
    }

    VolumeStore[] getVolumeStore(int i) {
        if (this.mVolumeStore == null || this.mVolumeStore.length != i) {
            this.mVolumeStore = new VolumeStore[i];
            for (int i2 = 0; i2 < i; i2++) {
                this.mVolumeStore[i2] = new VolumeStore();
            }
        }
        return this.mVolumeStore;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        for (int i2 = 0; i2 < RingerVolumePreference.access$200().length; i2++) {
            parcel.writeInt(this.mVolumeStore[i2].volume);
            parcel.writeInt(this.mVolumeStore[i2].originalVolume);
        }
    }

    public RingerVolumePreference$SavedState(Parcelable parcelable) {
        super(parcelable);
    }
}