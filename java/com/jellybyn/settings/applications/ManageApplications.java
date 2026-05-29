package com.jellybyn.settings.applications;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.AppOpsManager;
import android.app.Fragment;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.IPackageManager;
import android.content.pm.IPackageManager.Stub;
import android.content.pm.PackageManager;
import android.net.NetworkPolicyManager;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.ServiceManager;
import android.preference.PreferenceActivity;
import android.preference.PreferenceFrameLayout;
import android.preference.PreferenceFrameLayout.LayoutParams;
import android.support.v4.view.PagerTabStrip;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import com.android.internal.app.IMediaContainerService;
import com.jellybyn.settings.Settings.RunningServicesActivity;
import com.jellybyn.settings.Settings.StorageUseActivity;
import com.jellybyn.settings.deviceinfo.StorageMeasurement;
import java.util.ArrayList;

public class ManageApplications extends Fragment implements OnClickListener, OnDismissListener, AppClickListener {
    private boolean mActivityResumed;
    private ApplicationsState mApplicationsState;
    private CharSequence mComputingSizeStr;
    private final ServiceConnection mContainerConnection = new 2(this);
    private volatile IMediaContainerService mContainerService;
    private ViewGroup mContentContainer;
    TabInfo mCurTab = null;
    private String mCurrentPkgName;
    private int mDefaultListType = -1;
    private LayoutInflater mInflater;
    CharSequence mInvalidSizeStr;
    private int mNumTabs;
    private Menu mOptionsMenu;
    AlertDialog mResetDialog;
    private View mRootView;
    private boolean mShowBackground = false;
    private int mSortOrder = 4;
    private final ArrayList<TabInfo> mTabs = new ArrayList();
    private ViewPager mViewPager;

    public void onCreate(Bundle bundle) {
        boolean z;
        int i;
        super.onCreate(bundle);
        setHasOptionsMenu(true);
        this.mApplicationsState = ApplicationsState.getInstance(getActivity().getApplication());
        Intent intent = getActivity().getIntent();
        String action = intent.getAction();
        String string = getArguments() != null ? getArguments().getString("classname") : null;
        if (string == null) {
            string = intent.getComponent().getClassName();
        }
        if (string.equals(RunningServicesActivity.class.getName()) || string.endsWith(".RunningServices")) {
            z = true;
        } else if (string.equals(StorageUseActivity.class.getName()) || "android.intent.action.MANAGE_PACKAGE_STORAGE".equals(action) || string.endsWith(".StorageUse")) {
            this.mSortOrder = 5;
            z = true;
        } else {
            z = "jellybyn.settings.MANAGE_ALL_APPLICATIONS_SETTINGS".equals(action) ? true : false;
        }
        boolean i2;
        if (bundle != null) {
            this.mSortOrder = bundle.getInt("sortOrder", this.mSortOrder);
            i2 = bundle.getInt("defaultListType", -1);
            if (i2 == -1) {
                i2 = z;
            }
            this.mShowBackground = bundle.getBoolean("showBackground", false);
        } else {
            i2 = z;
        }
        this.mDefaultListType = i2;
        getActivity().bindService(new Intent().setComponent(StorageMeasurement.DEFAULT_CONTAINER_COMPONENT), this.mContainerConnection, 1);
        this.mInvalidSizeStr = getActivity().getText(2131428407);
        this.mComputingSizeStr = getActivity().getText(2131428406);
        this.mTabs.add(new TabInfo(this, this.mApplicationsState, getActivity().getString(2131428378), 0, this, bundle));
        if (!Environment.isExternalStorageEmulated()) {
            this.mTabs.add(new TabInfo(this, this.mApplicationsState, getActivity().getString(2131428380), 2, this, bundle));
        }
        this.mTabs.add(new TabInfo(this, this.mApplicationsState, getActivity().getString(2131428379), 1, this, bundle));
        this.mTabs.add(new TabInfo(this, this.mApplicationsState, getActivity().getString(2131428376), 3, this, bundle));
        this.mTabs.add(new TabInfo(this, this.mApplicationsState, getActivity().getString(2131428377), 4, this, bundle));
        this.mNumTabs = this.mTabs.size();
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mInflater = layoutInflater;
        View rootView = this.mInflater.inflate(2130968639, viewGroup, false);
        this.mContentContainer = viewGroup;
        this.mRootView = rootView;
        this.mViewPager = (ViewPager) rootView.findViewById(2131230737);
        MyPagerAdapter adapter = new 2(this);
        this.mViewPager.setAdapter(adapter);
        this.mViewPager.setOnPageChangeListener(adapter);
        ((PagerTabStrip) rootView.findViewById(2131230738)).setTabIndicatorColorResource(17170450);
        if (viewGroup instanceof PreferenceFrameLayout) {
            ((LayoutParams) rootView.getLayoutParams()).removeBorders = true;
        }
        if (bundle != null && bundle.getBoolean("resetDialog")) {
            buildResetDialog();
        }
        if (bundle == null) {
            for (int i = 0; i < this.mTabs.size(); i++) {
                if (((TabInfo) this.mTabs.get(i)).mListType == this.mDefaultListType) {
                    this.mViewPager.setCurrentItem(i);
                    break;
                }
            }
        }
        return rootView;
    }

    void updateOptionsMenu() {
        boolean z = true;
        if (this.mOptionsMenu != null) {
            if (this.mCurTab == null || this.mCurTab.mListType != 1) {
                this.mOptionsMenu.findItem(4).setVisible(this.mSortOrder != 4);
                this.mOptionsMenu.findItem(5).setVisible(this.mSortOrder != 5);
                this.mOptionsMenu.findItem(6).setVisible(false);
                this.mOptionsMenu.findItem(7).setVisible(false);
                this.mOptionsMenu.findItem(8).setVisible(true);
                return;
            }
            TabInfo tabForType = tabForType(1);
            boolean showBackground = (tabForType == null || TabInfo.access$1100(tabForType) == null) ? false : TabInfo.access$1100(tabForType).mAdapter.getShowBackground();
            this.mOptionsMenu.findItem(4).setVisible(false);
            this.mOptionsMenu.findItem(5).setVisible(false);
            this.mOptionsMenu.findItem(6).setVisible(showBackground);
            MenuItem findItem = this.mOptionsMenu.findItem(7);
            if (showBackground) {
                z = false;
            }
            findItem.setVisible(z);
            this.mOptionsMenu.findItem(8).setVisible(false);
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        int menuId = menuItem.getItemId();
        if (menuId == 4 || menuId == 5) {
            this.mSortOrder = menuId;
            if (!(this.mCurTab == null || this.mCurTab.mApplications == null)) {
                this.mCurTab.mApplications.rebuild(this.mSortOrder);
            }
        } else if (menuId == 6) {
            this.mShowBackground = false;
            if (!(this.mCurTab == null || TabInfo.access$1100(this.mCurTab) == null)) {
                TabInfo.access$1100(this.mCurTab).mAdapter.setShowBackground(false);
            }
        } else if (menuId == 7) {
            this.mShowBackground = true;
            if (!(this.mCurTab == null || TabInfo.access$1100(this.mCurTab) == null)) {
                TabInfo.access$1100(this.mCurTab).mAdapter.setShowBackground(true);
            }
        } else if (menuId != 8) {
            return false;
        } else {
            buildResetDialog();
        }
        updateOptionsMenu();
        return true;
    }

    public void updateCurrentTab(int i) {
        this.mCurTab = (TabInfo) this.mTabs.get(i);
        if (this.mActivityResumed) {
            this.mCurTab.build(this.mInflater, this.mContentContainer, this.mRootView);
            this.mCurTab.resume(this.mSortOrder);
        } else {
            this.mCurTab.pause();
        }
        for (int i2 = 0; i2 < this.mTabs.size(); i2++) {
            TabInfo tabInfo = (TabInfo) this.mTabs.get(i2);
            if (tabInfo != this.mCurTab) {
                tabInfo.pause();
            }
        }
        this.mCurTab.updateStorageUsage();
        updateOptionsMenu();
        Activity host = getActivity();
        if (host != null) {
            host.invalidateOptionsMenu();
        }
    }

    void buildResetDialog() {
        if (this.mResetDialog == null) {
            Builder builder = new Builder(getActivity());
            builder.setTitle(2131428370);
            builder.setMessage(2131428371);
            builder.setPositiveButton(2131428372, this);
            builder.setNegativeButton(2131427562, null);
            this.mResetDialog = builder.show();
            this.mResetDialog.setOnDismissListener(this);
        }
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (this.mResetDialog == dialogInterface) {
            PackageManager packageManager = getActivity().getPackageManager();
            IPackageManager asInterface = Stub.asInterface(ServiceManager.getService("package"));
            new 1(this, packageManager, Stub.asInterface(ServiceManager.getService("notification")), asInterface, (AppOpsManager) getActivity().getSystemService("appops"), NetworkPolicyManager.from(getActivity()), new Handler(getActivity().getMainLooper())).execute(new Void[0]);
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        this.mOptionsMenu = menu;
        menu.add(0, 4, 1, 2131428365).setShowAsAction(0);
        menu.add(0, 5, 2, 2131428366).setShowAsAction(0);
        menu.add(0, 6, 3, 2131428367).setShowAsAction(1);
        menu.add(0, 7, 3, 2131428368).setShowAsAction(1);
        menu.add(0, 8, 4, 2131428369).setShowAsAction(0);
        updateOptionsMenu();
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt("sortOrder", this.mSortOrder);
        if (this.mDefaultListType != -1) {
            bundle.putInt("defaultListType", this.mDefaultListType);
        }
        bundle.putBoolean("showBackground", this.mShowBackground);
        if (this.mResetDialog != null) {
            bundle.putBoolean("resetDialog", true);
        }
    }

    private void updateNumTabs() {
        int size = this.mApplicationsState.haveDisabledApps() ? this.mTabs.size() : this.mTabs.size() - 1;
        if (size != this.mNumTabs) {
            this.mNumTabs = size;
            if (this.mViewPager != null) {
                this.mViewPager.getAdapter().notifyDataSetChanged();
            }
        }
    }

    public void onPause() {
        super.onPause();
        this.mActivityResumed = false;
        for (int i = 0; i < this.mTabs.size(); i++) {
            ((TabInfo) this.mTabs.get(i)).pause();
        }
    }

    public void onResume() {
        super.onResume();
        this.mActivityResumed = true;
        updateCurrentTab(this.mViewPager.getCurrentItem());
        updateNumTabs();
        updateOptionsMenu();
    }

    TabInfo tabForType(int i) {
        for (int i2 = 0; i2 < this.mTabs.size(); i2++) {
            TabInfo tabInfo = (TabInfo) this.mTabs.get(i2);
            if (tabInfo.mListType == i) {
                return tabInfo;
            }
        }
        return null;
    }

    private void startApplicationDetailsActivity() {
        Bundle bundle = new Bundle();
        bundle.putString("package", this.mCurrentPkgName);
        ((PreferenceActivity) getActivity()).startPreferencePanel(InstalledAppDetails.class.getName(), bundle, 2131428334, null, this, 1);
    }

    public void onDestroyView() {
        super.onDestroyView();
        for (int i = 0; i < this.mTabs.size(); i++) {
            ((TabInfo) this.mTabs.get(i)).detachView();
        }
    }

    public void onItemClick(TabInfo tabInfo, AdapterView<?> adapterView, View view, int i, long j) {
        if (tabInfo.mApplications != null && tabInfo.mApplications.getCount() > i) {
            this.mCurrentPkgName = tabInfo.mApplications.getAppEntry(i).info.packageName;
            startApplicationDetailsActivity();
        }
    }

    public void onStop() {
        super.onStop();
        if (this.mResetDialog != null) {
            this.mResetDialog.dismiss();
            this.mResetDialog = null;
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 1 && this.mCurrentPkgName != null) {
            this.mApplicationsState.requestSize(this.mCurrentPkgName);
        }
    }

    public void onDestroy() {
        getActivity().unbindService(this.mContainerConnection);
        super.onDestroy();
    }

    public void onDismiss(DialogInterface dialogInterface) {
        if (this.mResetDialog == dialogInterface) {
            this.mResetDialog = null;
        }
    }

    public void onDestroyOptionsMenu() {
        this.mOptionsMenu = null;
    }

    public void onPrepareOptionsMenu(Menu menu) {
        updateOptionsMenu();
    }

    public void onStart() {
        super.onStart();
    }
}