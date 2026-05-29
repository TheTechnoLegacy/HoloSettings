package android.support.v4.os;

import android.os.Parcel;
import android.os.Parcelable.Creator;

class ParcelableCompat$CompatCreator<T> implements Creator<T> {
    final ParcelableCompatCreatorCallbacks<T> mCallbacks;

    public ParcelableCompat$CompatCreator(ParcelableCompatCreatorCallbacks<T> callbacks) {
        this.mCallbacks = callbacks;
    }

    public T createFromParcel(Parcel parcel) {
        return this.mCallbacks.createFromParcel(parcel, null);
    }

    public T[] newArray(int i) {
        return this.mCallbacks.newArray(i);
    }
}