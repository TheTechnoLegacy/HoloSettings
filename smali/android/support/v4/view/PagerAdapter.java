package android.support.v4.view;

import android.database.DataSetObservable;
import android.database.DataSetObserver;
import android.os.Parcelable;
import android.view.View;
import android.view.ViewGroup;

public abstract class PagerAdapter {
    private DataSetObservable mObservable = new DataSetObservable();

    public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
        destroyItem((View) viewGroup, i, obj);
    }

    public void finishUpdate(ViewGroup viewGroup) {
        finishUpdate((View) viewGroup);
    }

    public void notifyDataSetChanged() {
        this.mObservable.notifyChanged();
    }

    public void registerDataSetObserver(DataSetObserver dataSetObserver) {
        this.mObservable.registerObserver(dataSetObserver);
    }

    public void setPrimaryItem(ViewGroup viewGroup, int i, Object obj) {
        setPrimaryItem((View) viewGroup, i, obj);
    }

    public void startUpdate(ViewGroup viewGroup) {
        startUpdate((View) viewGroup);
    }

    public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
        this.mObservable.unregisterObserver(dataSetObserver);
    }

    public void destroyItem(View view, int i, Object obj) {
        throw new UnsupportedOperationException("Required method destroyItem was not overridden");
    }

    public void finishUpdate(View view) {
    }

    public int getItemPosition(Object obj) {
        return -1;
    }

    public CharSequence getPageTitle(int i) {
        return null;
    }

    public float getPageWidth(int i) {
        return 1.0f;
    }

    public Object instantiateItem(View view, int i) {
        throw new UnsupportedOperationException("Required method instantiateItem was not overridden");
    }

    public Object instantiateItem(ViewGroup viewGroup, int i) {
        return instantiateItem((View) viewGroup, i);
    }

    public void restoreState(Parcelable parcelable, ClassLoader classLoader) {
    }

    public Parcelable saveState() {
        return null;
    }

    public void setPrimaryItem(View view, int i, Object obj) {
    }

    public void startUpdate(View view) {
    }

    public abstract int getCount();

    public abstract boolean isViewFromObject(View view, Object obj);
}