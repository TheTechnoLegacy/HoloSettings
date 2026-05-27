package com.jellybyn.settings.applications;

import android.app.Fragment;
import android.os.Bundle;
import android.preference.PreferenceFrameLayout;
import android.preference.PreferenceFrameLayout.LayoutParams;
import android.support.v4.view.PagerTabStrip;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.jellybyn.settings.applications.AppOpsState.OpsTemplate;

public class AppOpsSummary extends Fragment {
    static OpsTemplate[] sPageTemplates = new OpsTemplate[]{AppOpsState.LOCATION_TEMPLATE, AppOpsState.PERSONAL_TEMPLATE, AppOpsState.MESSAGING_TEMPLATE, AppOpsState.DEVICE_TEMPLATE};
    private ViewGroup mContentContainer;
    int mCurPos;
    private LayoutInflater mInflater;
    CharSequence[] mPageNames;
    private View mRootView;
    private ViewPager mViewPager;

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mInflater = layoutInflater;
        View rootView = this.mInflater.inflate(2130968585, viewGroup, false);
        this.mContentContainer = viewGroup;
        this.mRootView = rootView;
        this.mPageNames = getResources().getTextArray(2131165235);
        this.mViewPager = (ViewPager) rootView.findViewById(2131230737);
        MyPagerAdapter adapter = new MyPagerAdapter(this, getChildFragmentManager());
        this.mViewPager.setAdapter(adapter);
        this.mViewPager.setOnPageChangeListener(adapter);
        ((PagerTabStrip) rootView.findViewById(2131230738)).setTabIndicatorColorResource(17170450);
        if (viewGroup instanceof PreferenceFrameLayout) {
            ((LayoutParams) rootView.getLayoutParams()).removeBorders = true;
        }
        return rootView;
    }
}