package com.jellybyn.settings;

import android.animation.LayoutTransition;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.Fragment;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.net.INetworkStatsService;
import android.net.INetworkStatsSession;
import android.net.NetworkPolicy;
import android.net.NetworkPolicyManager;
import android.net.NetworkStats;
import android.net.NetworkStatsHistory.Entry;
import android.net.NetworkTemplate;
import android.net.TrafficStats;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.INetworkManagementService;
import android.os.INetworkManagementService.Stub;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.preference.PreferenceActivity;
import android.provider.Settings.Global;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TabHost;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.TabHost.TabContentFactory;
import android.widget.TabHost.TabSpec;
import android.widget.TabWidget;
import android.widget.TextView;
import com.jellybyn.settings.drawable.InsetBoundsDrawable;
import com.jellybyn.settings.net.ChartData;
import com.jellybyn.settings.net.ChartDataLoader;
import com.jellybyn.settings.net.DataUsageMeteredSettings;
import com.jellybyn.settings.net.NetworkPolicyEditor;
import com.jellybyn.settings.net.SummaryForAllUidLoader;
import com.jellybyn.settings.net.UidDetail;
import com.jellybyn.settings.net.UidDetailProvider;
import com.jellybyn.settings.widget.ChartDataUsageView;
import com.jellybyn.settings.widget.ChartDataUsageView.DataUsageChartListener;
import com.jellybyn.settings.widget.PieChartView;
import java.util.Formatter;
import java.util.Locale;
import libcore.util.Objects;

public class DataUsageSummary extends Fragment {
    private static final StringBuilder sBuilder = new StringBuilder(50);
    private static final Formatter sFormatter = new Formatter(sBuilder, Locale.getDefault());
    private DataUsageAdapter mAdapter;
    private TextView mAppBackground;
    private View mAppDetail;
    private TextView mAppForeground;
    private ImageView mAppIcon;
    private PieChartView mAppPieChart;
    private CheckBox mAppRestrict;
    private OnClickListener mAppRestrictListener = new 2(this);
    private View mAppRestrictView;
    private Button mAppSettings;
    private Intent mAppSettingsIntent;
    private OnClickListener mAppSettingsListener = new 2(this);
    private LinearLayout mAppSwitches;
    private ViewGroup mAppTitles;
    private boolean mBinding;
    private ChartDataUsageView mChart;
    private ChartData mChartData;
    private final LoaderCallbacks<ChartData> mChartDataCallbacks = new 2(this);
    private DataUsageChartListener mChartListener = new 2(this);
    private ConnectivityManager mConnService;
    private AppItem mCurrentApp = null;
    private String mCurrentTab = null;
    private CycleAdapter mCycleAdapter;
    private OnItemSelectedListener mCycleListener = new 2(this);
    private Spinner mCycleSpinner;
    private View mCycleView;
    private Switch mDataEnabled;
    private OnCheckedChangeListener mDataEnabledListener = new 2(this);
    private View mDataEnabledView;
    private CheckBox mDisableAtLimit;
    private OnClickListener mDisableAtLimitListener = new 2(this);
    private View mDisableAtLimitView;
    private TextView mEmpty;
    private TabContentFactory mEmptyTabContent = new 2(this);
    private ViewGroup mHeader;
    private int mInsetSide = 0;
    private String mIntentTab = null;
    private OnItemClickListener mListListener = new 2(this);
    private ListView mListView;
    private MenuItem mMenuAutoSync;
    private MenuItem mMenuDataRoaming;
    private MenuItem mMenuRestrictBackground;
    private Boolean mMobileDataEnabled;
    private INetworkManagementService mNetworkService;
    private LinearLayout mNetworkSwitches;
    private ViewGroup mNetworkSwitchesContainer;
    private NetworkPolicyEditor mPolicyEditor;
    private NetworkPolicyManager mPolicyManager;
    private SharedPreferences mPrefs;
    private boolean mShowEthernet = false;
    private boolean mShowWifi = false;
    private INetworkStatsService mStatsService;
    private INetworkStatsSession mStatsSession;
    private final LoaderCallbacks<NetworkStats> mSummaryCallbacks = new 2(this);
    private TabHost mTabHost;
    private OnTabChangeListener mTabListener = new 2(this);
    private TabWidget mTabWidget;
    private ViewGroup mTabsContainer;
    private NetworkTemplate mTemplate;
    private UidDetailProvider mUidDetailProvider;
    private TextView mUsageSummary;

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Context context = layoutInflater.getContext();
        View view = layoutInflater.inflate(2130968618, viewGroup, false);
        this.mUidDetailProvider = new UidDetailProvider(context);
        this.mTabHost = (TabHost) view.findViewById(16908306);
        this.mTabsContainer = (ViewGroup) view.findViewById(2131230809);
        this.mTabWidget = (TabWidget) view.findViewById(16908307);
        this.mListView = (ListView) view.findViewById(16908298);
        if (this.mListView.getScrollBarStyle() == 33554432) {
            this.mInsetSide = view.getResources().getDimensionPixelOffset(17104937);
        } else {
            this.mInsetSide = 0;
        }
        Utils.prepareCustomPreferencesList(viewGroup, view, this.mListView, true);
        this.mTabHost.setup();
        this.mTabHost.setOnTabChangedListener(this.mTabListener);
        this.mHeader = (ViewGroup) layoutInflater.inflate(2130968616, this.mListView, false);
        this.mHeader.setClickable(true);
        this.mListView.addHeaderView(new View(context), null, true);
        this.mListView.addHeaderView(this.mHeader, null, true);
        this.mListView.setItemsCanFocus(true);
        if (this.mInsetSide > 0) {
            insetListViewDrawables(this.mListView, this.mInsetSide);
            this.mHeader.setPaddingRelative(this.mInsetSide, 0, this.mInsetSide, 0);
        }
        this.mNetworkSwitchesContainer = (ViewGroup) this.mHeader.findViewById(2131230806);
        this.mNetworkSwitches = (LinearLayout) this.mHeader.findViewById(2131230807);
        this.mDataEnabled = new Switch(layoutInflater.getContext());
        this.mDataEnabledView = inflatePreference(layoutInflater, this.mNetworkSwitches, this.mDataEnabled);
        this.mDataEnabled.setOnCheckedChangeListener(this.mDataEnabledListener);
        this.mNetworkSwitches.addView(this.mDataEnabledView);
        this.mDisableAtLimit = new CheckBox(layoutInflater.getContext());
        this.mDisableAtLimit.setClickable(false);
        this.mDisableAtLimit.setFocusable(false);
        this.mDisableAtLimitView = inflatePreference(layoutInflater, this.mNetworkSwitches, this.mDisableAtLimit);
        this.mDisableAtLimitView.setClickable(true);
        this.mDisableAtLimitView.setFocusable(true);
        this.mDisableAtLimitView.setOnClickListener(this.mDisableAtLimitListener);
        this.mNetworkSwitches.addView(this.mDisableAtLimitView);
        this.mCycleView = this.mHeader.findViewById(2131230797);
        this.mCycleSpinner = (Spinner) this.mCycleView.findViewById(2131230798);
        this.mCycleAdapter = new CycleAdapter(context);
        this.mCycleSpinner.setAdapter(this.mCycleAdapter);
        this.mCycleSpinner.setOnItemSelectedListener(this.mCycleListener);
        this.mChart = (ChartDataUsageView) this.mHeader.findViewById(2131230788);
        this.mChart.setListener(this.mChartListener);
        this.mChart.bindNetworkPolicy(null);
        this.mAppDetail = this.mHeader.findViewById(2131230799);
        this.mAppIcon = (ImageView) this.mAppDetail.findViewById(2131230735);
        this.mAppTitles = (ViewGroup) this.mAppDetail.findViewById(2131230800);
        this.mAppPieChart = (PieChartView) this.mAppDetail.findViewById(2131230803);
        this.mAppForeground = (TextView) this.mAppDetail.findViewById(2131230801);
        this.mAppBackground = (TextView) this.mAppDetail.findViewById(2131230802);
        this.mAppSwitches = (LinearLayout) this.mAppDetail.findViewById(2131230805);
        this.mAppSettings = (Button) this.mAppDetail.findViewById(2131230804);
        this.mAppSettings.setOnClickListener(this.mAppSettingsListener);
        this.mAppRestrict = new CheckBox(layoutInflater.getContext());
        this.mAppRestrict.setClickable(false);
        this.mAppRestrict.setFocusable(false);
        this.mAppRestrictView = inflatePreference(layoutInflater, this.mAppSwitches, this.mAppRestrict);
        this.mAppRestrictView.setClickable(true);
        this.mAppRestrictView.setFocusable(true);
        this.mAppRestrictView.setOnClickListener(this.mAppRestrictListener);
        this.mAppSwitches.addView(this.mAppRestrictView);
        this.mUsageSummary = (TextView) this.mHeader.findViewById(2131230808);
        this.mEmpty = (TextView) this.mHeader.findViewById(16908292);
        this.mAdapter = new DataUsageAdapter(this.mUidDetailProvider, this.mInsetSide);
        this.mListView.setOnItemClickListener(this.mListListener);
        this.mListView.setAdapter(this.mAdapter);
        return view;
    }

    public void onPrepareOptionsMenu(Menu menu) {
        boolean z = true;
        Context context = getActivity();
        boolean appDetailMode = isAppDetailMode();
        boolean isOwner = ActivityManager.getCurrentUser() == 0;
        this.mMenuDataRoaming = menu.findItem(2131231233);
        MenuItem menuItem = this.mMenuDataRoaming;
        boolean z2 = hasReadyMobileRadio(context) && !appDetailMode;
        menuItem.setVisible(z2);
        this.mMenuDataRoaming.setChecked(getDataRoaming());
        this.mMenuRestrictBackground = menu.findItem(2131231234);
        menuItem = this.mMenuRestrictBackground;
        z2 = hasReadyMobileRadio(context) && isOwner && !appDetailMode;
        menuItem.setVisible(z2);
        this.mMenuRestrictBackground.setChecked(this.mPolicyManager.getRestrictBackground());
        this.mMenuAutoSync = menu.findItem(2131231236);
        this.mMenuAutoSync.setChecked(ContentResolver.getMasterSyncAutomatically());
        this.mMenuAutoSync.setVisible(!appDetailMode);
        MenuItem split4g = menu.findItem(2131231235);
        z2 = hasReadyMobile4gRadio(context) && isOwner && !appDetailMode;
        split4g.setVisible(z2);
        split4g.setChecked(isMobilePolicySplit());
        MenuItem showWifi = menu.findItem(2131231237);
        if (hasWifiRadio(context) && hasReadyMobileRadio(context)) {
            showWifi.setVisible(!appDetailMode);
            showWifi.setChecked(this.mShowWifi);
        } else {
            showWifi.setVisible(false);
        }
        MenuItem showEthernet = menu.findItem(2131231238);
        if (hasEthernet(context) && hasReadyMobileRadio(context)) {
            showEthernet.setVisible(!appDetailMode);
            showEthernet.setChecked(this.mShowEthernet);
        } else {
            showEthernet.setVisible(false);
        }
        MenuItem metered = menu.findItem(2131231239);
        if (hasReadyMobileRadio(context) || hasWifiRadio(context)) {
            if (appDetailMode) {
                z = false;
            }
            metered.setVisible(z);
        } else {
            metered.setVisible(false);
        }
        MenuItem help = menu.findItem(2131231240);
        String helpUrl = getResources().getString(2131429116);
        if (TextUtils.isEmpty(helpUrl)) {
            help.setVisible(false);
        } else {
            HelpUtils.prepareHelpMenuItem(context, help, helpUrl);
        }
    }

    private void updateBody() {
        boolean z = true;
        this.mBinding = true;
        if (isAdded()) {
            Activity activity = getActivity();
            String currentTabTag = this.mTabHost.getCurrentTabTag();
            if (ActivityManager.getCurrentUser() != 0) {
                z = false;
            }
            if (currentTabTag == null) {
                Log.w("DataUsage", "no tab selected; hiding body");
                this.mListView.setVisibility(8);
                return;
            }
            this.mListView.setVisibility(0);
            if (!currentTabTag.equals(this.mCurrentTab)) {
            }
            this.mCurrentTab = currentTabTag;
            this.mDataEnabledView.setVisibility(z ? 0 : 8);
            TelephonyManager.from(activity);
            if ("mobile".equals(currentTabTag)) {
                setPreferenceTitle(this.mDataEnabledView, 2131428976);
                setPreferenceTitle(this.mDisableAtLimitView, 2131428965);
                this.mTemplate = NetworkTemplate.buildTemplateMobileAll(getActiveSubscriberId(activity));
            } else if ("3g".equals(currentTabTag)) {
                setPreferenceTitle(this.mDataEnabledView, 2131428977);
                setPreferenceTitle(this.mDisableAtLimitView, 2131428967);
                this.mTemplate = NetworkTemplate.buildTemplateMobile3gLower(getActiveSubscriberId(activity));
            } else if ("4g".equals(currentTabTag)) {
                setPreferenceTitle(this.mDataEnabledView, 2131428978);
                setPreferenceTitle(this.mDisableAtLimitView, 2131428966);
                this.mTemplate = NetworkTemplate.buildTemplateMobile4g(getActiveSubscriberId(activity));
            } else if ("wifi".equals(currentTabTag)) {
                this.mDataEnabledView.setVisibility(8);
                this.mDisableAtLimitView.setVisibility(8);
                this.mTemplate = NetworkTemplate.buildTemplateWifiWildcard();
            } else if ("ethernet".equals(currentTabTag)) {
                this.mDataEnabledView.setVisibility(8);
                this.mDisableAtLimitView.setVisibility(8);
                this.mTemplate = NetworkTemplate.buildTemplateEthernet();
            } else {
                throw new Intent("unknown tab: " + currentTabTag);
            }
            getLoaderManager().restartLoader(2, ChartDataLoader.buildArgs(this.mTemplate, this.mCurrentApp), this.mChartDataCallbacks);
            getActivity().invalidateOptionsMenu();
            this.mBinding = false;
        }
    }

    private void updateAppDetail() {
        boolean z = true;
        Activity activity = getActivity();
        PackageManager packageManager = activity.getPackageManager();
        LayoutInflater layoutInflater = getActivity().getLayoutInflater();
        if (isAppDetailMode()) {
            this.mAppDetail.setVisibility(0);
            this.mCycleAdapter.setChangeVisible(false);
            this.mChart.bindNetworkPolicy(null);
            int i = this.mCurrentApp.key;
            UidDetail uidDetail = this.mUidDetailProvider.getUidDetail(i, true);
            this.mAppIcon.setImageDrawable(uidDetail.icon);
            this.mAppTitles.removeAllViews();
            if (uidDetail.detailLabels != null) {
                for (CharSequence inflateAppTitle : uidDetail.detailLabels) {
                    this.mAppTitles.addView(inflateAppTitle(layoutInflater, this.mAppTitles, inflateAppTitle));
                }
            } else {
                this.mAppTitles.addView(inflateAppTitle(layoutInflater, this.mAppTitles, uidDetail.label));
            }
            String[] packagesForUid = packageManager.getPackagesForUid(i);
            if (packagesForUid == null || packagesForUid.length <= 0) {
                this.mAppSettingsIntent = null;
                this.mAppSettings.setVisibility(8);
            } else {
                this.mAppSettingsIntent = new Intent("android.intent.action.MANAGE_NETWORK_USAGE");
                this.mAppSettingsIntent.addCategory("android.intent.category.DEFAULT");
                for (String str : packagesForUid) {
                    this.mAppSettingsIntent.setPackage(str);
                    if (packageManager.resolveActivity(this.mAppSettingsIntent, 0) != null) {
                        break;
                    }
                }
                z = false;
                this.mAppSettings.setEnabled(z);
                this.mAppSettings.setVisibility(0);
            }
            updateDetailData();
            if (UserHandle.isApp(i) && !this.mPolicyManager.getRestrictBackground() && isBandwidthControlEnabled() && hasReadyMobileRadio(activity)) {
                setPreferenceTitle(this.mAppRestrictView, 2131428980);
                setPreferenceSummary(this.mAppRestrictView, getString(2131428981));
                this.mAppRestrictView.setVisibility(0);
                this.mAppRestrict.setChecked(getAppRestrictBackground());
                return;
            }
            this.mAppRestrictView.setVisibility(8);
            return;
        }
        this.mAppDetail.setVisibility(8);
        this.mCycleAdapter.setChangeVisible(true);
        this.mChart.bindDetailNetworkStats(null);
    }

    private void updateCycleList(NetworkPolicy networkPolicy) {
        long start;
        long end;
        long computeNextCycleBoundary;
        boolean z;
        CycleItem cycleItem = (CycleItem) this.mCycleSpinner.getSelectedItem();
        this.mCycleAdapter.clear();
        Context context = this.mCycleSpinner.getContext();
        if (this.mChartData != null) {
            start = this.mChartData.network.getStart();
            end = this.mChartData.network.getEnd();
        } else {
            end = Long.MIN_VALUE;
            start = Long.MAX_VALUE;
        }
        long currentTimeMillis = System.currentTimeMillis();
        long j = start == Long.MAX_VALUE ? currentTimeMillis : start;
        start = end == Long.MIN_VALUE ? currentTimeMillis + 1 : end;
        if (networkPolicy != null) {
            computeNextCycleBoundary = NetworkPolicyManager.computeNextCycleBoundary(start, networkPolicy);
            z = false;
            while (computeNextCycleBoundary > j) {
                end = NetworkPolicyManager.computeLastCycleBoundary(computeNextCycleBoundary, networkPolicy);
                Log.d("DataUsage", "generating cs=" + end + " to ce=" + computeNextCycleBoundary + " waiting for hs=" + j);
                this.mCycleAdapter.add(new CycleItem(context, end, computeNextCycleBoundary));
                z = true;
                computeNextCycleBoundary = end;
            }
            this.mCycleAdapter.setChangePossible(isNetworkPolicyModifiable(networkPolicy));
        } else {
            z = false;
        }
        if (!z) {
            computeNextCycleBoundary = start;
            while (computeNextCycleBoundary > j) {
                end = computeNextCycleBoundary - 2419200000L;
                this.mCycleAdapter.add(new CycleItem(context, end, computeNextCycleBoundary));
                computeNextCycleBoundary = end;
            }
            this.mCycleAdapter.setChangePossible(false);
        }
        if (this.mCycleAdapter.getCount() > 0) {
            int findNearestPosition = this.mCycleAdapter.findNearestPosition(cycleItem);
            this.mCycleSpinner.setSelection(findNearestPosition);
            if (Objects.equal((CycleItem) this.mCycleAdapter.getItem(findNearestPosition), cycleItem)) {
                updateDetailData();
                return;
            } else {
                this.mCycleListener.onItemSelected(this.mCycleSpinner, null, findNearestPosition, 0);
                return;
            }
        }
        updateDetailData();
    }

    private void updateDetailData() {
        long inspectStart = this.mChart.getInspectStart();
        long inspectEnd = this.mChart.getInspectEnd();
        long currentTimeMillis = System.currentTimeMillis();
        Activity activity = getActivity();
        Entry entry = null;
        if (!isAppDetailMode() || this.mChartData == null || this.mChartData.detail == null) {
            if (this.mChartData != null) {
                entry = this.mChartData.network.getValues(inspectStart, inspectEnd, currentTimeMillis, null);
            }
            getLoaderManager().restartLoader(3, SummaryForAllUidLoader.buildArgs(this.mTemplate, inspectStart, inspectEnd), this.mSummaryCallbacks);
        } else {
            entry = this.mChartData.detailDefault.getValues(inspectStart, inspectEnd, currentTimeMillis, null);
            long j = entry.rxBytes + entry.txBytes;
            Entry values = this.mChartData.detailForeground.getValues(inspectStart, inspectEnd, currentTimeMillis, entry);
            long j2 = values.rxBytes + values.txBytes;
            this.mAppPieChart.setOriginAngle(175);
            this.mAppPieChart.removeAllSlices();
            this.mAppPieChart.addSlice(j2, Color.parseColor("#d88d3a"));
            this.mAppPieChart.addSlice(j, Color.parseColor("#666666"));
            this.mAppPieChart.generatePath();
            this.mAppBackground.setText(android.text.format.Formatter.formatFileSize(activity, j));
            this.mAppForeground.setText(android.text.format.Formatter.formatFileSize(activity, j2));
            entry = this.mChartData.detail.getValues(inspectStart, inspectEnd, currentTimeMillis, null);
            getLoaderManager().destroyLoader(3);
        }
        String formatFileSize = android.text.format.Formatter.formatFileSize(activity, entry != null ? entry.rxBytes + entry.txBytes : 0);
        String formatDateRange = formatDateRange(activity, inspectStart, inspectEnd);
        int i = ("mobile".equals(this.mCurrentTab) || "3g".equals(this.mCurrentApp) || "4g".equals(this.mCurrentApp)) ? 2131429006 : 2131429005;
        this.mUsageSummary.setText(getString(i, new Object[]{formatFileSize, formatDateRange}));
        ensureLayoutTransitions();
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        boolean z = false;
        switch (menuItem.getItemId()) {
            case 2131231233:
                if (!menuItem.isChecked()) {
                    ConfirmDataRoamingFragment.show(this);
                    return true;
                }
                setDataRoaming(false);
                return true;
            case 2131231234:
                if (!menuItem.isChecked()) {
                    ConfirmRestrictFragment.show(this);
                    return true;
                }
                setRestrictBackground(false);
                return true;
            case 2131231235:
                if (!menuItem.isChecked()) {
                    z = true;
                }
                setMobilePolicySplit(z);
                menuItem.setChecked(isMobilePolicySplit());
                updateTabs();
                return true;
            case 2131231236:
                if (ActivityManager.isUserAMonkey()) {
                    Log.d("SyncState", "ignoring monkey's attempt to flip global sync state");
                    return true;
                }
                if (!menuItem.isChecked()) {
                    z = true;
                }
                ConfirmAutoSyncChangeFragment.show(this, z);
                return true;
            case 2131231237:
                if (!menuItem.isChecked()) {
                    z = true;
                }
                this.mShowWifi = z;
                this.mPrefs.edit().putBoolean("show_wifi", this.mShowWifi).apply();
                menuItem.setChecked(this.mShowWifi);
                updateTabs();
                return true;
            case 2131231238:
                if (!menuItem.isChecked()) {
                    z = true;
                }
                this.mShowEthernet = z;
                this.mPrefs.edit().putBoolean("show_ethernet", this.mShowEthernet).apply();
                menuItem.setChecked(this.mShowEthernet);
                updateTabs();
                return true;
            case 2131231239:
                ((PreferenceActivity) getActivity()).startPreferencePanel(DataUsageMeteredSettings.class.getCanonicalName(), null, 2131429007, null, this, 0);
                return true;
            default:
                return false;
        }
    }

    private void updateTabs() {
        int i = 1;
        int i2 = 0;
        Activity activity = getActivity();
        this.mTabHost.clearAllTabs();
        if (isMobilePolicySplit() && hasReadyMobile4gRadio(activity)) {
            this.mTabHost.addTab(buildTabSpec("3g", 2131428973));
            this.mTabHost.addTab(buildTabSpec("4g", 2131428972));
        } else if (hasReadyMobileRadio(activity)) {
            this.mTabHost.addTab(buildTabSpec("mobile", 2131428971));
        }
        if (this.mShowWifi && hasWifiRadio(activity)) {
            this.mTabHost.addTab(buildTabSpec("wifi", 2131428969));
        }
        if (this.mShowEthernet && hasEthernet(activity)) {
            this.mTabHost.addTab(buildTabSpec("ethernet", 2131428970));
        }
        int i3 = this.mTabWidget.getTabCount() == 0 ? 1 : 0;
        if (this.mTabWidget.getTabCount() <= 1) {
            i = 0;
        }
        TabWidget tabWidget = this.mTabWidget;
        if (i == 0) {
            i2 = 8;
        }
        tabWidget.setVisibility(i2);
        if (this.mIntentTab != null) {
            if (Objects.equal(this.mIntentTab, this.mTabHost.getCurrentTabTag())) {
                updateBody();
            } else {
                this.mTabHost.setCurrentTabByTag(this.mIntentTab);
            }
            this.mIntentTab = null;
        } else if (i3 != 0) {
            updateBody();
        }
    }

    private void updatePolicy(boolean z) {
        boolean z2 = true;
        if (isAppDetailMode()) {
            this.mNetworkSwitches.setVisibility(8);
        } else {
            this.mNetworkSwitches.setVisibility(0);
        }
        if ("mobile".equals(this.mCurrentTab)) {
            this.mBinding = true;
            this.mDataEnabled.setChecked(isMobileDataEnabled());
            this.mBinding = false;
        }
        NetworkPolicy policy = this.mPolicyEditor.getPolicy(this.mTemplate);
        if (isNetworkPolicyModifiable(policy)) {
            this.mDisableAtLimitView.setVisibility(0);
            CheckBox checkBox = this.mDisableAtLimit;
            if (policy == null || policy.limitBytes == -1) {
                z2 = false;
            }
            checkBox.setChecked(z2);
            if (!isAppDetailMode()) {
                this.mChart.bindNetworkPolicy(policy);
            }
        } else {
            this.mDisableAtLimitView.setVisibility(8);
            this.mChart.bindNetworkPolicy(null);
        }
        if (z) {
            updateCycleList(policy);
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Context context = getActivity();
        this.mNetworkService = Stub.asInterface(ServiceManager.getService("network_management"));
        this.mStatsService = Stub.asInterface(ServiceManager.getService("netstats"));
        this.mPolicyManager = TelephonyManager.from(context);
        this.mConnService = TelephonyManager.from(context);
        this.mPrefs = getActivity().getSharedPreferences("data_usage", 0);
        this.mPolicyEditor = new NetworkPolicyEditor(this.mPolicyManager);
        this.mPolicyEditor.read();
        try {
            this.mStatsSession = this.mStatsService.openSession();
            this.mShowWifi = this.mPrefs.getBoolean("show_wifi", false);
            this.mShowEthernet = this.mPrefs.getBoolean("show_ethernet", false);
            if (!hasReadyMobileRadio(context)) {
                this.mShowWifi = true;
                this.mShowEthernet = true;
            }
            setHasOptionsMenu(true);
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    private static String computeTabFromIntent(Intent intent) {
        NetworkTemplate networkTemplate = (NetworkTemplate) intent.getParcelableExtra("android.net.NETWORK_TEMPLATE");
        if (networkTemplate == null) {
            return null;
        }
        switch (networkTemplate.getMatchRule()) {
            case 1:
                return "mobile";
            case 2:
                return "3g";
            case 3:
                return "4g";
            case 4:
                return "wifi";
            default:
                return null;
        }
    }

    private void ensureLayoutTransitions() {
        if (this.mChart.getLayoutTransition() == null) {
            this.mTabsContainer.setLayoutTransition(buildLayoutTransition());
            this.mHeader.setLayoutTransition(buildLayoutTransition());
            this.mNetworkSwitchesContainer.setLayoutTransition(buildLayoutTransition());
            LayoutTransition chartTransition = buildLayoutTransition();
            chartTransition.disableTransitionType(2);
            chartTransition.disableTransitionType(3);
            this.mChart.setLayoutTransition(chartTransition);
        }
    }

    public boolean hasEthernet(Context context) {
        long ethernetBytes;
        boolean hasEthernet = TelephonyManager.from(context).isNetworkSupported(9);
        if (this.mStatsSession != null) {
            try {
                ethernetBytes = this.mStatsSession.getSummaryForNetwork(NetworkTemplate.buildTemplateEthernet(), Long.MIN_VALUE, Long.MAX_VALUE).getTotalBytes();
            } catch (RemoteException e) {
                throw new RuntimeException(e);
            }
        }
        ethernetBytes = 0;
        return hasEthernet && ethernetBytes > 0;
    }

    public void onDestroy() {
        this.mDataEnabledView = null;
        this.mDisableAtLimitView = null;
        this.mUidDetailProvider.clearCache();
        this.mUidDetailProvider = null;
        TrafficStats.closeQuietly(this.mStatsSession);
        if (isRemoving()) {
            getFragmentManager().popBackStack("appDetails", 1);
        }
        super.onDestroy();
    }

    private static void insetListViewDrawables(ListView listView, int i) {
        Drawable selector = listView.getSelector();
        Drawable divider = listView.getDivider();
        Drawable stub = new StringBuilder(0);
        listView.setSelector(stub);
        listView.setDivider(stub);
        listView.setSelector(new InsetBoundsDrawable(selector, i));
        listView.setDivider(new InsetBoundsDrawable(divider, i));
    }

    public void onResume() {
        super.onResume();
        this.mIntentTab = computeTabFromIntent(getActivity().getIntent());
        updateTabs();
        new 2(this).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    public static String formatDateRange(Context context, long j, long j2) {
        String formatter;
        synchronized (sBuilder) {
            sBuilder.setLength(0);
            formatter = DateUtils.formatDateRange(context, sFormatter, j, j2, 65552, null).toString();
        }
        return formatter;
    }

    private boolean isBandwidthControlEnabled() {
        try {
            return this.mNetworkService.isBandwidthControlEnabled();
        } catch (RemoteException e) {
            Log.w("DataUsage", "problem talking with INetworkManagementService: " + e);
            return false;
        }
    }

    @Deprecated
    private boolean isMobilePolicySplit() {
        Context context = getActivity();
        if (!hasReadyMobileRadio(context)) {
            return false;
        }
        TelephonyManager from = TelephonyManager.from(context);
        return this.mPolicyEditor.isMobilePolicySplit(getActiveSubscriberId(context));
    }

    private void setAppRestrictBackground(boolean z) {
        this.mPolicyManager.setUidPolicy(this.mCurrentApp.key, z ? 1 : 0);
        this.mAppRestrict.setChecked(z);
    }

    private void setDataRoaming(boolean z) {
        Global.putInt(getActivity().getContentResolver(), "data_roaming", z ? 1 : 0);
        this.mMenuDataRoaming.setChecked(z);
    }

    @Deprecated
    private void setMobilePolicySplit(boolean z) {
        Context context = getActivity();
        if (hasReadyMobileRadio(context)) {
            TelephonyManager from = TelephonyManager.from(context);
            this.mPolicyEditor.setMobilePolicySplit(getActiveSubscriberId(context), z);
        }
    }

    private static View inflatePreference(LayoutInflater layoutInflater, ViewGroup viewGroup, View view) {
        View inflate = layoutInflater.inflate(2130968657, viewGroup, false);
        ((LinearLayout) inflate.findViewById(16908312)).addView(view, new LayoutParams(-2, -2));
        return inflate;
    }

    private void setMobileDataEnabled(boolean z) {
        this.mConnService.setMobileDataEnabled(z);
        this.mMobileDataEnabled = Boolean.valueOf(z);
        updatePolicy(false);
    }

    private static void setPreferenceSummary(View view, CharSequence charSequence) {
        TextView textView = (TextView) view.findViewById(16908304);
        textView.setVisibility(0);
        textView.setText(charSequence);
    }

    private static LayoutTransition buildLayoutTransition() {
        LayoutTransition transition = new LayoutTransition();
        transition.setAnimateParentHierarchy(false);
        return transition;
    }

    private static String getActiveSubscriberId(Context context) {
        return SystemProperties.get("test.subscriberid", TelephonyManager.from(context).getSubscriberId());
    }

    private boolean getAppRestrictBackground() {
        return (this.mPolicyManager.getUidPolicy(this.mCurrentApp.key) & 1) != 0;
    }

    public static boolean hasReadyMobileRadio(Context context) {
        return TelephonyManager.from(context).isNetworkSupported(0) && TelephonyManager.from(context).getSimState() == 5;
    }

    private static View inflateAppTitle(LayoutInflater layoutInflater, ViewGroup viewGroup, CharSequence charSequence) {
        TextView textView = (TextView) layoutInflater.inflate(2130968610, viewGroup, false);
        textView.setText(charSequence);
        return textView;
    }

    private boolean isMobileDataEnabled() {
        return this.mMobileDataEnabled != null ? this.mMobileDataEnabled.booleanValue() : this.mConnService.getMobileDataEnabled();
    }

    private void setPolicyLimitBytes(long j) {
        this.mPolicyEditor.setPolicyLimitBytes(this.mTemplate, j);
        updatePolicy(false);
    }

    private void setPolicyWarningBytes(long j) {
        this.mPolicyEditor.setPolicyWarningBytes(this.mTemplate, j);
        updatePolicy(false);
    }

    private static void setPreferenceTitle(View view, int i) {
        ((TextView) view.findViewById(16908310)).setText(i);
    }

    public void setRestrictBackground(boolean z) {
        this.mPolicyManager.setRestrictBackground(z);
        this.mMenuRestrictBackground.setChecked(z);
    }

    private boolean getDataRoaming() {
        return Global.getInt(getActivity().getContentResolver(), "data_roaming", 0) != 0;
    }

    public static boolean hasWifiRadio(Context context) {
        return TelephonyManager.from(context).isNetworkSupported(1);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menuInflater.inflate(2131755008, menu);
    }

    private TabSpec buildTabSpec(String str, int i) {
        return this.mTabHost.newTabSpec(str).setIndicator(getText(i)).setContent(this.mEmptyTabContent);
    }

    public static boolean hasReadyMobile4gRadio(Context context) {
        return false;
    }

    private boolean isAppDetailMode() {
        return this.mCurrentApp != null;
    }

    private boolean isNetworkPolicyModifiable(NetworkPolicy networkPolicy) {
        return networkPolicy != null && isBandwidthControlEnabled() && this.mDataEnabled.isChecked() && ActivityManager.getCurrentUser() == 0;
    }
}