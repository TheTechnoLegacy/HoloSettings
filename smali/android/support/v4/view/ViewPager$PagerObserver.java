package android.support.v4.view;

import android.database.DataSetObserver;

class ViewPager$PagerObserver extends DataSetObserver {
    final /* synthetic */ ViewPager this$0;

    public void onChanged() {
        this.this$0.dataSetChanged();
    }

    public void onInvalidated() {
        this.this$0.dataSetChanged();
    }

    private ViewPager$PagerObserver(ViewPager viewPager) {
        this.this$0 = viewPager;
    }
}