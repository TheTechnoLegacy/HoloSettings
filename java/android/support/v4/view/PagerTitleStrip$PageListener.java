package android.support.v4.view;

import android.database.DataSetObserver;
import android.support.v4.view.ViewPager.OnAdapterChangeListener;
import android.support.v4.view.ViewPager.OnPageChangeListener;

class PagerTitleStrip$PageListener extends DataSetObserver implements OnAdapterChangeListener, OnPageChangeListener {
    private int mScrollState;
    final /* synthetic */ PagerTitleStrip this$0;

    public void onPageSelected(int i) {
        float f = 0.0f;
        if (this.mScrollState == 0) {
            this.this$0.updateText(this.this$0.mPager.getCurrentItem(), this.this$0.mPager.getAdapter());
            if (PagerTitleStrip.access$100(this.this$0) >= 0.0f) {
                f = PagerTitleStrip.access$100(this.this$0);
            }
            this.this$0.updateTextPositions(this.this$0.mPager.getCurrentItem(), f, true);
        }
    }

    public void onChanged() {
        float offset = 0.0f;
        this.this$0.updateText(this.this$0.mPager.getCurrentItem(), this.this$0.mPager.getAdapter());
        if (PagerTitleStrip.access$100(this.this$0) >= 0.0f) {
            offset = PagerTitleStrip.access$100(this.this$0);
        }
        this.this$0.updateTextPositions(this.this$0.mPager.getCurrentItem(), offset, true);
    }

    public void onPageScrolled(int i, float f, int i2) {
        if (f > 0.5f) {
            i++;
        }
        this.this$0.updateTextPositions(i, f, false);
    }

    public void onAdapterChanged(PagerAdapter pagerAdapter, PagerAdapter pagerAdapter2) {
        this.this$0.updateAdapter(pagerAdapter, pagerAdapter2);
    }

    public void onPageScrollStateChanged(int i) {
        this.mScrollState = i;
    }

    private PagerTitleStrip$PageListener(PagerTitleStrip pagerTitleStrip) {
        this.this$0 = pagerTitleStrip;
    }
}