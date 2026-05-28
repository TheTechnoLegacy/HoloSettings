package com.jellybyn.settings.fuelgauge;

import android.app.ActivityManager;
import android.app.ApplicationErrorReport;
import android.app.ApplicationErrorReport.BatteryInfo;
import android.app.Fragment;
import android.app.admin.DevicePolicyManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Process;
import android.preference.PreferenceActivity;
import android.provider.Settings.Global;
import android.text.TextUtils;
import android.text.format.Formatter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.jellybyn.settings.DisplaySettings;
import com.jellybyn.settings.LocationSettings;
import com.jellybyn.settings.Utils;
import com.jellybyn.settings.WirelessSettings;
import com.jellybyn.settings.applications.InstalledAppDetails;
import com.jellybyn.settings.bluetooth.BluetoothSettings;
import com.jellybyn.settings.wifi.WifiSettings;

public class PowerUsageDetail extends Fragment implements OnClickListener {
    private static int[] sDrainTypeDesciptions = new int[]{2131428670, 2131428671, 2131428669, 2131428675, 2131428677, 2131428673, 2131428680, 2131428684};
    ApplicationInfo mApp;
    private Drawable mAppIcon;
    private final BroadcastReceiver mCheckKillProcessesReceiver = new 1(this);
    private ViewGroup mControlsParent;
    private ViewGroup mDetailsParent;
    private DevicePolicyManager mDpm;
    private DrainType mDrainType;
    private Button mForceStopButton;
    ComponentName mInstaller;
    private double mNoCoverage;
    private String[] mPackages;
    private PackageManager mPm;
    private Button mReportButton;
    private View mRootView;
    private long mStartTime;
    private String mTitle;
    private TextView mTitleView;
    private ViewGroup mTwoButtonsPanel;
    private int[] mTypes;
    private int mUid;
    private int mUsageSince;
    private boolean mUsesGps;
    private double[] mValues;

    private void createDetails() {
        Bundle args = getArguments();
        this.mTitle = args.getString("title");
        int percentage = args.getInt("percent", 1);
        int gaugeValue = args.getInt("gauge", 1);
        this.mUsageSince = args.getInt("since", 1);
        this.mUid = args.getInt("uid", 0);
        this.mDrainType = (DrainType) args.getSerializable("drainType");
        this.mNoCoverage = args.getDouble("noCoverage", 0.0d);
        String iconPackage = args.getString("iconPackage");
        int iconId = args.getInt("iconId", 0);
        if (!TextUtils.isEmpty(iconPackage)) {
            try {
                PackageManager packageManager = getActivity().getPackageManager();
                ApplicationInfo applicationInfo = packageManager.getPackageInfo(iconPackage, 0).applicationInfo;
                if (applicationInfo != null) {
                    this.mAppIcon = applicationInfo.loadIcon(packageManager);
                }
            } catch (NameNotFoundException e) {
            }
        } else if (iconId != 0) {
            this.mAppIcon = getActivity().getResources().getDrawable(iconId);
        }
        if (this.mAppIcon == null) {
            this.mAppIcon = getActivity().getPackageManager().getDefaultActivityIcon();
        }
        TextView textView = (TextView) this.mRootView.findViewById(16908304);
        textView.setText(getDescriptionForDrainType());
        textView.setVisibility(0);
        this.mTypes = args.getIntArray("types");
        this.mValues = args.getDoubleArray("values");
        this.mTitleView = (TextView) this.mRootView.findViewById(16908310);
        this.mTitleView.setText(this.mTitle);
        ((TextView) this.mRootView.findViewById(16908308)).setText(getString(2131429063, new Object[]{Integer.valueOf(percentage)}));
        this.mTwoButtonsPanel = (ViewGroup) this.mRootView.findViewById(2131230920);
        this.mForceStopButton = (Button) this.mRootView.findViewById(2131231067);
        this.mReportButton = (Button) this.mRootView.findViewById(2131231068);
        this.mForceStopButton.setEnabled(false);
        ((ProgressBar) this.mRootView.findViewById(16908301)).setProgress(gaugeValue);
        ((ImageView) this.mRootView.findViewById(16908294)).setImageDrawable(this.mAppIcon);
        this.mDetailsParent = (ViewGroup) this.mRootView.findViewById(2131230921);
        this.mControlsParent = (ViewGroup) this.mRootView.findViewById(2131230922);
        fillDetailsSection();
        fillPackagesSection(this.mUid);
        fillControlsSection(this.mUid);
        if (this.mUid >= 10000) {
            this.mForceStopButton.setText(2131428344);
            this.mForceStopButton.setTag(Integer.valueOf(7));
            this.mForceStopButton.setOnClickListener(this);
            this.mReportButton.setText(17040388);
            this.mReportButton.setTag(Integer.valueOf(8));
            this.mReportButton.setOnClickListener(this);
            if (Global.getInt(getActivity().getContentResolver(), "send_action_app_error", 0) != 0) {
                if (this.mPackages != null && this.mPackages.length > 0) {
                    try {
                        this.mApp = getActivity().getPackageManager().getApplicationInfo(this.mPackages[0], 0);
                        this.mInstaller = ApplicationErrorReport.getErrorReportReceiver(getActivity(), this.mPackages[0], this.mApp.flags);
                    } catch (NameNotFoundException e2) {
                    }
                }
                this.mReportButton.setEnabled(this.mInstaller != null);
                return;
            }
            this.mTwoButtonsPanel.setVisibility(8);
            return;
        }
        this.mTwoButtonsPanel.setVisibility(8);
    }

    private void fillControlsSection(int i) {
        int i2 = 0;
        PackageManager pm = getActivity().getPackageManager();
        String[] packages = pm.getPackagesForUid(i);
        PackageInfo pi = null;
        if (packages != null) {
            try {
                pi = pm.getPackageInfo(packages[0], 0);
            } catch (NameNotFoundException e) {
            }
        } else {
            pi = null;
        }
        ApplicationInfo applicationInfo = pi != null ? pi.applicationInfo : null;
        if (!(applicationInfo == null || (applicationInfo.flags & 1) == 0)) {
            i2 = 1;
        }
        Object obj = 1;
        switch (2.$SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[this.mDrainType.ordinal()]) {
            case 1:
                if (packages != null && i2 == 0) {
                    addControl(2131428664, 2131428681, 5);
                    obj = null;
                }
                if (this.mUsesGps) {
                    addControl(2131427611, 2131428682, 6);
                    obj = null;
                    break;
                }
                break;
            case 2:
                addControl(2131428031, 2131428674, 1);
                obj = null;
                break;
            case 3:
                addControl(2131427800, 2131428676, 2);
                obj = null;
                break;
            case 4:
                addControl(2131427696, 2131428678, 3);
                obj = null;
                break;
            case 5:
                if (this.mNoCoverage > 10.0d) {
                    addControl(2131427567, 2131428672, 4);
                    obj = null;
                    break;
                }
                break;
        }
        if (obj != null) {
            this.mControlsParent.setVisibility(8);
        }
    }

    private void fillDetailsSection() {
        LayoutInflater inflater = getActivity().getLayoutInflater();
        if (this.mTypes != null && this.mValues != null) {
            for (int i = 0; i < this.mTypes.length; i++) {
                if (this.mValues[i] > 0.0d) {
                    CharSequence formatFileSize;
                    String string = getString(this.mTypes[i]);
                    switch (this.mTypes[i]) {
                        case 2131428654:
                            this.mUsesGps = true;
                            break;
                        case 2131428657:
                        case 2131428658:
                            formatFileSize = Formatter.formatFileSize(getActivity(), (long) this.mValues[i]);
                            break;
                        case 2131428662:
                            int floor = (int) Math.floor(this.mValues[i]);
                            formatFileSize = getActivity().getString(2131429063, new Object[]{Integer.valueOf(floor)});
                            break;
                    }
                    formatFileSize = Utils.formatElapsedTime(getActivity(), this.mValues[i]);
                    ViewGroup viewGroup = (ViewGroup) inflater.inflate(2130968654, null);
                    this.mDetailsParent.addView(viewGroup);
                    TextView textView = (TextView) viewGroup.findViewById(2131230919);
                    ((TextView) viewGroup.findViewById(2131230887)).setText(string);
                    textView.setText(formatFileSize);
                }
            }
        }
    }

    private void fillPackagesSection(int i) {
        if (i < 1) {
            removePackagesSection();
            return;
        }
        ViewGroup packagesParent = (ViewGroup) this.mRootView.findViewById(2131230925);
        if (packagesParent != null) {
            LayoutInflater inflater = getActivity().getLayoutInflater();
            PackageManager pm = getActivity().getPackageManager();
            this.mPackages = pm.getPackagesForUid(i);
            if (this.mPackages == null || this.mPackages.length < 2) {
                removePackagesSection();
                return;
            }
            for (int i2 = 0; i2 < this.mPackages.length; i2++) {
                try {
                    CharSequence loadLabel = pm.getApplicationInfo(this.mPackages[i2], 0).loadLabel(pm);
                    if (loadLabel != null) {
                        this.mPackages[i2] = loadLabel.toString();
                    }
                    ViewGroup viewGroup = (ViewGroup) inflater.inflate(2130968656, null);
                    packagesParent.addView(viewGroup);
                    ((TextView) viewGroup.findViewById(2131230887)).setText(this.mPackages[i2]);
                } catch (NameNotFoundException e) {
                }
            }
        }
    }

    private void reportBatteryUse() {
        boolean z = false;
        if (this.mPackages != null) {
            ApplicationErrorReport report = new ApplicationErrorReport();
            report.type = 3;
            report.packageName = this.mPackages[0];
            report.installerPackageName = this.mInstaller.getPackageName();
            report.processName = this.mPackages[0];
            report.time = System.currentTimeMillis();
            if ((this.mApp.flags & 1) != 0) {
                z = true;
            }
            report.systemApp = z;
            Bundle args = getArguments();
            BatteryInfo batteryInfo = new BatteryInfo();
            batteryInfo.usagePercent = args.getInt("percent", 1);
            batteryInfo.durationMicros = args.getLong("duration", 0);
            batteryInfo.usageDetails = args.getString("report_details");
            batteryInfo.checkinDetails = args.getString("report_checkin_details");
            report.batteryInfo = batteryInfo;
            Intent result = new Intent("android.intent.action.APP_ERROR");
            result.setComponent(this.mInstaller);
            result.putExtra("android.intent.extra.BUG_REPORT", report);
            result.addFlags(268435456);
            startActivity(result);
        }
    }

    private void checkForceStop() {
        if (this.mPackages == null || this.mUid < 10000) {
            this.mForceStopButton.setEnabled(false);
            return;
        }
        for (String packageHasActiveAdmins : this.mPackages) {
            if (this.mDpm.packageHasActiveAdmins(packageHasActiveAdmins)) {
                this.mForceStopButton.setEnabled(false);
                return;
            }
        }
        int i = 0;
        while (i < this.mPackages.length) {
            try {
                if ((this.mPm.getApplicationInfo(this.mPackages[i], 0).flags & 2097152) == 0) {
                    this.mForceStopButton.setEnabled(true);
                    break;
                }
                i++;
            } catch (NameNotFoundException e) {
            }
        }
        Intent intent = new Intent("android.intent.action.QUERY_PACKAGE_RESTART", Uri.fromParts("package", this.mPackages[0], null));
        intent.putExtra("android.intent.extra.PACKAGES", this.mPackages);
        intent.putExtra("android.intent.extra.UID", this.mUid);
        intent.putExtra("android.intent.extra.user_handle", this.mUid);
        getActivity().sendOrderedBroadcast(intent, null, this.mCheckKillProcessesReceiver, null, 0, null, null);
    }

    private void doAction(int i) {
        PreferenceActivity preferenceActivity = (PreferenceActivity) getActivity();
        switch (i) {
            case 1:
                preferenceActivity.startPreferencePanel(DisplaySettings.class.getName(), null, 2131427984, null, null, 0);
                return;
            case 2:
                preferenceActivity.startPreferencePanel(WifiSettings.class.getName(), null, 2131427800, null, null, 0);
                return;
            case 3:
                preferenceActivity.startPreferencePanel(BluetoothSettings.class.getName(), null, 2131427696, null, null, 0);
                return;
            case 4:
                preferenceActivity.startPreferencePanel(WirelessSettings.class.getName(), null, 2131427567, null, null, 0);
                return;
            case 5:
                startApplicationDetailsActivity();
                return;
            case 6:
                preferenceActivity.startPreferencePanel(LocationSettings.class.getName(), null, 2131427611, null, null, 0);
                return;
            case 7:
                killProcesses();
                return;
            case 8:
                reportBatteryUse();
                return;
            default:
                return;
        }
    }

    private void addControl(int i, int i2, int i3) {
        Resources res = getResources();
        ViewGroup item = (ViewGroup) getActivity().getLayoutInflater().inflate(2130968653, null);
        this.mControlsParent.addView(item);
        Button actionButton = (Button) item.findViewById(2131230832);
        TextView summaryView = (TextView) item.findViewById(2131230917);
        actionButton.setText(res.getString(i));
        summaryView.setText(res.getString(i2));
        actionButton.setOnClickListener(this);
        actionButton.setTag(new Integer(i3));
    }

    private void killProcesses() {
        if (this.mPackages != null) {
            ActivityManager am = (ActivityManager) getActivity().getSystemService("activity");
            for (String forceStopPackage : this.mPackages) {
                am.forceStopPackage(forceStopPackage);
            }
            checkForceStop();
        }
    }

    private void removePackagesSection() {
        View view = this.mRootView.findViewById(2131230924);
        if (view != null) {
            view.setVisibility(8);
        }
        view = this.mRootView.findViewById(2131230925);
        if (view != null) {
            view.setVisibility(8);
        }
    }

    private void startApplicationDetailsActivity() {
        Bundle bundle = new Bundle();
        bundle.putString("package", this.mPackages[0]);
        ((PreferenceActivity) getActivity()).startPreferencePanel(InstalledAppDetails.class.getName(), bundle, 2131428334, null, null, 0);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = layoutInflater.inflate(2130968655, viewGroup, false);
        Utils.prepareCustomPreferencesList(viewGroup, view, view, false);
        this.mRootView = view;
        createDetails();
        return view;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mPm = getActivity().getPackageManager();
        this.mDpm = (DevicePolicyManager) getActivity().getSystemService("device_policy");
    }

    public void onResume() {
        super.onResume();
        this.mStartTime = Process.getElapsedCpuTime();
        checkForceStop();
    }

    public void onClick(View view) {
        doAction(((Integer) view.getTag()).intValue());
    }

    public void onPause() {
        super.onPause();
    }

    private String getDescriptionForDrainType() {
        return getResources().getString(sDrainTypeDesciptions[this.mDrainType.ordinal()]);
    }
}