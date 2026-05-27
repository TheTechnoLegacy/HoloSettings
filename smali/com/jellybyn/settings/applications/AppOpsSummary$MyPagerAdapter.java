package com.jellybyn.settings.applications;

import android.app.Fragment;
import android.app.FragmentManager;
import android.support.v13.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager.OnPageChangeListener;

class AppOpsSummary$MyPagerAdapter extends FragmentPagerAdapter implements OnPageChangeListener {
    final /* synthetic */ AppOpsSummary this$0;

    public AppOpsSummary$MyPagerAdapter(AppOpsSummary appOpsSummary, FragmentManager fragmentManager) {
        this.this$0 = appOpsSummary;
        super(fragmentManager);
    }

    public void onPageScrollStateChanged(int i) {
        if (i == 0) {
        }
    }

    public void onPageSelected(int i) {
        this.this$0.mCurPos = i;
    }

    public int getCount() {
        return AppOpsSummary.sPageTemplates.length;
    }

    public Fragment getItem(int i) {
        return new AppOpsCategory(AppOpsSummary.sPageTemplates[i]);
    }

    public CharSequence getPageTitle(int i) {
        return this.this$0.mPageNames[i];
    }

    public void onPageScrolled(int i, float f, int i2) {
    }
}