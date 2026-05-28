package android.support.v4.view;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.os.ParcelableCompat;
import android.view.View.BaseSavedState;

public class ViewPager$SavedState extends BaseSavedState {
    public static final Creator<ViewPager$SavedState> CREATOR = ParcelableCompat.newCreator(new 1());
    Parcelable adapterState;
    ClassLoader loader;
    int position;

    ViewPager$SavedState(Parcel parcel, ClassLoader classLoader) {
        super(parcel);
        if (classLoader == null) {
            classLoader = getClass().getClassLoader();
        }
        this.position = parcel.readInt();
        this.adapterState = parcel.readParcelable(classLoader);
        this.loader = classLoader;
    }

    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.position);
        parcel.writeParcelable(this.adapterState, i);
    }

    public ViewPager$SavedState(Parcelable parcelable) {
        super(parcelable);
    }

    public String toString() {
        return "FragmentPager.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " position=" + this.position + "}";
    }
}