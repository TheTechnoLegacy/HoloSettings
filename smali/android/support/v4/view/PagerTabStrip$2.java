package android.support.v4.view;

import android.view.View;
import android.view.View.OnClickListener;

class PagerTabStrip$2 implements OnClickListener {
    final /* synthetic */ PagerTabStrip this$0;

    public void onClick(View view) {
        this.this$0.mPager.setCurrentItem(this.this$0.mPager.getCurrentItem() + 1);
    }

    PagerTabStrip$2(PagerTabStrip pagerTabStrip) {
        this.this$0 = pagerTabStrip;
    }
}