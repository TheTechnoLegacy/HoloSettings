package android.support.v4.view;

import android.os.Parcel;
import android.support.v4.os.ParcelableCompatCreatorCallbacks;
import android.support.v4.view.ViewPager.SavedState;

class ViewPager$SavedState$1 implements ParcelableCompatCreatorCallbacks<SavedState> {
    ViewPager$SavedState$1() {
    }

    public SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
        return new SavedState(parcel, classLoader);
    }

    public SavedState[] newArray(int i) {
        return new SavedState[i];
    }
}