package com.jellybyn.settings.applications;

import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.view.View;
import android.view.ViewGroup;
import com.jellybyn.settings.applications.ManageApplications.TabInfo;

class ManageApplications$MyPagerAdapter extends PagerAdapter implements OnPageChangeListener {
    int mCurPos = 0;
    final /* synthetic */ ManageApplications this$0;

    public Object instantiateItem(ViewGroup viewGroup, int i) {
        TabInfo tab = (TabInfo) ManageApplications.access$100(this.this$0).get(i);
        View root = tab.build(ManageApplications.access$200(this.this$0), ManageApplications.access$300(this.this$0), ManageApplications.access$400(this.this$0));
        viewGroup.addView(root);
        root.setTag(2131230834, tab);
        return root;
    }

    public void onPageScrollStateChanged(int i) {
        if (i == 0) {
            this.this$0.updateCurrentTab(this.mCurPos);
        }
    }

    ManageApplications$MyPagerAdapter(ManageApplications manageApplications) {
        this.this$0 = manageApplications;
    }

    public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
        viewGroup.removeView((View) obj);
    }

    public void onPageSelected(int i) {
        this.mCurPos = i;
    }

    public int getCount() {
        return ManageApplications.access$000(this.this$0);
    }

    public int getItemPosition(Object obj) {
        return super.getItemPosition(obj);
    }

    public CharSequence getPageTitle(int i) {
        return ((TabInfo) ManageApplications.access$100(this.this$0).get(i)).mLabel;
    }

    public boolean isViewFromObject(View view, Object obj) {
        return view == obj;
    }

    public void onPageScrolled(int i, float f, int i2) {
    }
}