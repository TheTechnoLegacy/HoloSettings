package com.jellybyn.settings.applications;

import android.app.ActivityManager;
import android.app.Fragment;
import android.app.INotificationManager;
import android.app.INotificationManager.Stub;
import android.app.admin.DevicePolicyManager;
import android.appwidget.AppWidgetManager;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.hardware.usb.IUsbManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.UserHandle;
import android.os.UserManager;
import android.preference.PreferenceActivity;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.format.Formatter;
import android.text.style.BulletSpan;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AppSecurityPermissions;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import com.android.internal.telephony.ISms;
import com.jellybyn.settings.Utils;
import com.jellybyn.settings.applications.ApplicationsState.AppEntry;
import com.jellybyn.settings.applications.ApplicationsState.Callbacks;
import com.jellybyn.settings.applications.ApplicationsState.Session;
import java.util.ArrayList;
import java.util.List;

public class InstalledAppDetails extends Fragment implements OnClickListener, OnCheckedChangeListener, Callbacks {
    private Button mActivitiesButton;
    private AppEntry mAppEntry;
    private TextView mAppSize;
    private TextView mAppVersion;
    private AppWidgetManager mAppWidgetManager;
    private CheckBox mAskCompatibilityCB;
    private TextView mCacheSize;
    private CanBeOnSdCardChecker mCanBeOnSdCardChecker;
    private boolean mCanClearData = true;
    private final BroadcastReceiver mCheckKillProcessesReceiver = new 1(this);
    private Button mClearCacheButton;
    private ClearCacheObserver mClearCacheObserver;
    private Button mClearDataButton;
    private ClearUserDataObserver mClearDataObserver;
    private CharSequence mComputingStr;
    private TextView mDataSize;
    private boolean mDisableAfterUninstall;
    private DevicePolicyManager mDpm;
    private CheckBox mEnableCompatibilityCB;
    private TextView mExternalCodeSize;
    private TextView mExternalDataSize;
    private Button mForceStopButton;
    private Handler mHandler = new 1(this);
    private boolean mHaveSizes = false;
    private boolean mInitialized;
    private CharSequence mInvalidSizeStr;
    private long mLastCacheSize = -1;
    private long mLastCodeSize = -1;
    private long mLastDataSize = -1;
    private long mLastExternalCodeSize = -1;
    private long mLastExternalDataSize = -1;
    private long mLastTotalSize = -1;
    private View mMoreControlButtons;
    private Button mMoveAppButton;
    private boolean mMoveInProgress = false;
    private CompoundButton mNotificationSwitch;
    private PackageInfo mPackageInfo;
    private PackageMoveObserver mPackageMoveObserver;
    private PackageManager mPm;
    private View mRootView;
    private View mScreenCompatSection;
    private Session mSession;
    private boolean mShowUninstalled;
    private ISms mSmsManager;
    private Button mSpecialDisableButton;
    private ApplicationsState mState;
    private TextView mTotalSize;
    private Button mUninstallButton;
    private boolean mUpdatedSysApp = false;
    private IUsbManager mUsbManager;
    private UserManager mUserManager;

    private boolean refreshUi() {
        boolean z = false;
        if (this.mMoveInProgress) {
            return true;
        }
        String retrieveAppEntry = retrieveAppEntry();
        if (this.mAppEntry == null) {
            return false;
        }
        if (this.mPackageInfo == null) {
            return false;
        }
        boolean hasDefaults;
        ArrayList arrayList = new ArrayList();
        this.mPm.getPreferredActivities(new ArrayList(), arrayList, retrieveAppEntry);
        try {
            IUsbManager iUsbManager = this.mUsbManager;
            hasDefaults = iUsbManager == null ? false : iUsbManager.hasDefaults(retrieveAppEntry, UserHandle.myUserId());
        } catch (RemoteException e) {
            Log.e("InstalledAppDetails", "mUsbManager.hasDefaults", e);
            hasDefaults = false;
        }
        boolean hasBindAppWidgetPermission = this.mAppWidgetManager.hasBindAppWidgetPermission(this.mAppEntry.info.packageName);
        TextView textView = (TextView) this.mRootView.findViewById(2131230868);
        TextView textView2 = (TextView) this.mRootView.findViewById(2131230869);
        boolean z2 = arrayList.size() > 0 || hasDefaults;
        if (z2 || hasBindAppWidgetPermission) {
            CharSequence text;
            hasDefaults = hasBindAppWidgetPermission && z2;
            if (hasBindAppWidgetPermission) {
                textView.setText(2131428337);
            } else {
                textView.setText(2131428336);
            }
            CharSequence charSequence = null;
            int dimensionPixelSize = getResources().getDimensionPixelSize(2131558411);
            if (z2) {
                text = getText(2131428357);
                SpannableString spannableString = new SpannableString(text);
                if (hasDefaults) {
                    spannableString.setSpan(new BulletSpan(dimensionPixelSize), 0, text.length(), 0);
                }
                charSequence = null == null ? TextUtils.concat(new CharSequence[]{spannableString, "\n"}) : TextUtils.concat(new CharSequence[]{null, "\n", spannableString, "\n"});
            }
            if (hasBindAppWidgetPermission) {
                text = getText(2131428358);
                SpannableString spannableString2 = new SpannableString(text);
                if (hasDefaults) {
                    spannableString2.setSpan(new BulletSpan(dimensionPixelSize), 0, text.length(), 0);
                }
                charSequence = charSequence == null ? TextUtils.concat(new CharSequence[]{spannableString2, "\n"}) : TextUtils.concat(new CharSequence[]{charSequence, "\n", spannableString2, "\n"});
            }
            textView2.setText(charSequence);
            this.mActivitiesButton.setEnabled(true);
            this.mActivitiesButton.setOnClickListener(this);
        } else {
            resetLaunchDefaultsUi(textView, textView2);
        }
        ((ActivityManager) getActivity().getSystemService("activity")).getPackageScreenCompatMode(retrieveAppEntry);
        this.mScreenCompatSection.setVisibility(8);
        LinearLayout linearLayout = (LinearLayout) this.mRootView.findViewById(2131230874);
        AppSecurityPermissions appSecurityPermissions = new AppSecurityPermissions(getActivity(), retrieveAppEntry);
        int premiumSmsPermission = getPremiumSmsPermission(retrieveAppEntry);
        if (appSecurityPermissions.getPermissionCount() > 0 || premiumSmsPermission != 0) {
            linearLayout.setVisibility(0);
        } else {
            linearLayout.setVisibility(8);
        }
        textView2 = (TextView) linearLayout.findViewById(2131230875);
        LinearLayout linearLayout2 = (LinearLayout) linearLayout.findViewById(2131230876);
        if (premiumSmsPermission != 0) {
            textView2.setVisibility(0);
            linearLayout2.setVisibility(0);
            Spinner spinner = (Spinner) linearLayout.findViewById(2131230877);
            ArrayAdapter createFromResource = ArrayAdapter.createFromResource(getActivity(), 2131165264, 17367048);
            createFromResource.setDropDownViewResource(17367049);
            spinner.setAdapter(createFromResource);
            spinner.setSelection(premiumSmsPermission - 1);
            spinner.setOnItemSelectedListener(new PremiumSmsSelectionListener(retrieveAppEntry, this.mSmsManager));
        } else {
            textView2.setVisibility(8);
            linearLayout2.setVisibility(8);
        }
        if (appSecurityPermissions.getPermissionCount() > 0) {
            linearLayout = (LinearLayout) linearLayout.findViewById(2131230879);
            linearLayout.removeAllViews();
            linearLayout.addView(appSecurityPermissions.getPermissionsViewWithRevokeButtons());
            String[] packagesForUid = this.mPm.getPackagesForUid(this.mPackageInfo.applicationInfo.uid);
            if (packagesForUid != null && packagesForUid.length > 1) {
                arrayList = new ArrayList();
                for (Object obj : packagesForUid) {
                    if (!this.mPackageInfo.packageName.equals(obj)) {
                        try {
                            arrayList.add(this.mPm.getApplicationInfo(obj, 0).loadLabel(this.mPm));
                        } catch (NameNotFoundException e2) {
                        }
                    }
                }
                int size = arrayList.size();
                if (size > 0) {
                    Object obj2;
                    Resources resources = getActivity().getResources();
                    String obj22;
                    if (size == 1) {
                        obj22 = ((CharSequence) arrayList.get(0)).toString();
                    } else if (size == 2) {
                        obj22 = resources.getString(2131428400, new Object[]{arrayList.get(0), arrayList.get(1)});
                    } else {
                        String obj3 = ((CharSequence) arrayList.get(size - 2)).toString();
                        int i = size - 3;
                        while (i >= 0) {
                            obj3 = resources.getString(i == 0 ? 2131428402 : 2131428403, new Object[]{arrayList.get(i), obj3});
                            i--;
                        }
                        obj22 = resources.getString(2131428401, new Object[]{obj3, arrayList.get(size - 1)});
                    }
                    ((TextView) this.mRootView.findViewById(2131230878)).setText(resources.getString(2131428399, new Object[]{this.mPackageInfo.applicationInfo.loadLabel(this.mPm), obj22}));
                }
            }
        }
        checkForceStop();
        setAppLabelAndIcon(this.mPackageInfo);
        refreshButtons();
        refreshSizeInfo();
        if (this.mInitialized) {
            try {
                return this.mShowUninstalled || (getActivity().getPackageManager().getApplicationInfo(this.mAppEntry.info.packageName, 8704).flags & 8388608) != 0;
            } catch (NameNotFoundException e3) {
                return false;
            }
        }
        this.mInitialized = true;
        if ((this.mAppEntry.info.flags & 8388608) == 0) {
            z = true;
        }
        this.mShowUninstalled = z;
        return true;
    }

    private void refreshSizeInfo() {
        if (this.mAppEntry.size == -2 || this.mAppEntry.size == -1) {
            this.mLastTotalSize = -1;
            this.mLastCacheSize = -1;
            this.mLastDataSize = -1;
            this.mLastCodeSize = -1;
            if (!this.mHaveSizes) {
                this.mAppSize.setText(this.mComputingStr);
                this.mDataSize.setText(this.mComputingStr);
                this.mCacheSize.setText(this.mComputingStr);
                this.mTotalSize.setText(this.mComputingStr);
            }
            this.mClearDataButton.setEnabled(false);
            this.mClearCacheButton.setEnabled(false);
            return;
        }
        this.mHaveSizes = true;
        long codeSize = this.mAppEntry.codeSize;
        long dataSize = this.mAppEntry.dataSize;
        if (Environment.isExternalStorageEmulated()) {
            codeSize += this.mAppEntry.externalCodeSize;
            dataSize += this.mAppEntry.externalDataSize;
        } else {
            if (this.mLastExternalCodeSize != this.mAppEntry.externalCodeSize) {
                this.mLastExternalCodeSize = this.mAppEntry.externalCodeSize;
                this.mExternalCodeSize.setText(getSizeStr(this.mAppEntry.externalCodeSize));
            }
            if (this.mLastExternalDataSize != this.mAppEntry.externalDataSize) {
                this.mLastExternalDataSize = this.mAppEntry.externalDataSize;
                this.mExternalDataSize.setText(getSizeStr(this.mAppEntry.externalDataSize));
            }
        }
        if (this.mLastCodeSize != codeSize) {
            this.mLastCodeSize = codeSize;
            this.mAppSize.setText(getSizeStr(codeSize));
        }
        if (this.mLastDataSize != dataSize) {
            this.mLastDataSize = dataSize;
            this.mDataSize.setText(getSizeStr(dataSize));
        }
        long cacheSize = this.mAppEntry.cacheSize + this.mAppEntry.externalCacheSize;
        if (this.mLastCacheSize != cacheSize) {
            this.mLastCacheSize = cacheSize;
            this.mCacheSize.setText(getSizeStr(cacheSize));
        }
        if (this.mLastTotalSize != this.mAppEntry.size) {
            this.mLastTotalSize = this.mAppEntry.size;
            this.mTotalSize.setText(getSizeStr(this.mAppEntry.size));
        }
        if (this.mAppEntry.dataSize + this.mAppEntry.externalDataSize <= 0 || !this.mCanClearData) {
            this.mClearDataButton.setEnabled(false);
        } else {
            this.mClearDataButton.setEnabled(true);
            this.mClearDataButton.setOnClickListener(this);
        }
        if (cacheSize <= 0) {
            this.mClearCacheButton.setEnabled(false);
            return;
        }
        this.mClearCacheButton.setEnabled(true);
        this.mClearCacheButton.setOnClickListener(this);
    }

    public void onClick(View view) {
        int i = 2;
        String str = this.mAppEntry.info.packageName;
        if (view == this.mUninstallButton) {
            if (this.mUpdatedSysApp) {
                showDialogInner(2, 0);
            } else if ((this.mAppEntry.info.flags & 1) != 0) {
                if (this.mAppEntry.info.enabled) {
                    showDialogInner(7, 0);
                    return;
                }
                new DisableChanger(this, this.mAppEntry.info, 0).execute(new Object[]{null});
            } else if ((this.mAppEntry.info.flags & 8388608) == 0) {
                uninstallPkg(str, true, false);
            } else {
                uninstallPkg(str, false, false);
            }
        } else if (view == this.mSpecialDisableButton) {
            showDialogInner(9, 0);
        } else if (view == this.mActivitiesButton) {
            this.mPm.clearPackagePreferredActivities(str);
            try {
                this.mUsbManager.clearDefaults(str, UserHandle.myUserId());
            } catch (RemoteException e) {
                Log.e("InstalledAppDetails", "mUsbManager.clearDefaults", e);
            }
            this.mAppWidgetManager.setBindAppWidgetPermission(str, false);
            resetLaunchDefaultsUi((TextView) this.mRootView.findViewById(2131230868), (TextView) this.mRootView.findViewById(2131230869));
        } else if (view == this.mClearDataButton) {
            if (this.mAppEntry.info.manageSpaceActivityName == null) {
                showDialogInner(1, 0);
            } else if (!Utils.isMonkeyRunning()) {
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setClassName(this.mAppEntry.info.packageName, this.mAppEntry.info.manageSpaceActivityName);
                startActivityForResult(intent, 2);
            }
        } else if (view == this.mClearCacheButton) {
            if (this.mClearCacheObserver == null) {
                this.mClearCacheObserver = new 1(this);
            }
            this.mPm.deleteApplicationCacheFiles(str, this.mClearCacheObserver);
        } else if (view == this.mForceStopButton) {
            showDialogInner(5, 0);
        } else if (view == this.mMoveAppButton) {
            if (this.mPackageMoveObserver == null) {
                this.mPackageMoveObserver = new 1(this);
            }
            if ((this.mAppEntry.info.flags & 262144) != 0) {
                i = 1;
            }
            this.mMoveInProgress = true;
            refreshButtons();
            this.mPm.movePackage(this.mAppEntry.info.packageName, this.mPackageMoveObserver, i);
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = layoutInflater.inflate(2130968631, viewGroup, false);
        Utils.prepareCustomPreferencesList(viewGroup, view, view, false);
        this.mRootView = view;
        this.mComputingStr = getActivity().getText(2131428406);
        this.mTotalSize = (TextView) view.findViewById(2131230852);
        this.mAppSize = (TextView) view.findViewById(2131230854);
        this.mDataSize = (TextView) view.findViewById(2131230859);
        this.mExternalCodeSize = (TextView) view.findViewById(2131230856);
        this.mExternalDataSize = (TextView) view.findViewById(2131230861);
        if (Environment.isExternalStorageEmulated()) {
            ((View) this.mExternalCodeSize.getParent()).setVisibility(8);
            ((View) this.mExternalDataSize.getParent()).setVisibility(8);
        }
        View btnPanel = view.findViewById(2131230847);
        this.mForceStopButton = (Button) btnPanel.findViewById(2131231067);
        this.mForceStopButton.setText(2131428344);
        this.mUninstallButton = (Button) btnPanel.findViewById(2131231068);
        this.mForceStopButton.setEnabled(false);
        this.mMoreControlButtons = view.findViewById(2131230848);
        this.mMoreControlButtons.findViewById(2131231067).setVisibility(4);
        this.mSpecialDisableButton = (Button) this.mMoreControlButtons.findViewById(2131231068);
        this.mMoreControlButtons.setVisibility(8);
        View data_buttons_panel = view.findViewById(2131230862);
        this.mClearDataButton = (Button) data_buttons_panel.findViewById(2131231068);
        this.mMoveAppButton = (Button) data_buttons_panel.findViewById(2131231067);
        this.mCacheSize = (TextView) view.findViewById(2131230866);
        this.mClearCacheButton = (Button) view.findViewById(2131230867);
        this.mActivitiesButton = (Button) view.findViewById(2131230870);
        this.mScreenCompatSection = view.findViewById(2131230871);
        this.mAskCompatibilityCB = (CheckBox) view.findViewById(2131230872);
        this.mEnableCompatibilityCB = (CheckBox) view.findViewById(2131230873);
        this.mNotificationSwitch = (CompoundButton) view.findViewById(2131230849);
        return view;
    }

    private void initUninstallButtons() {
        int i = 0;
        this.mUpdatedSysApp = (this.mAppEntry.info.flags & 128) != 0;
        boolean enabled = true;
        if (this.mUpdatedSysApp) {
            this.mUninstallButton.setText(2131428356);
            boolean z = false;
            if ((this.mAppEntry.info.flags & 1) != 0) {
                z = handleDisableable(this.mSpecialDisableButton);
                this.mSpecialDisableButton.setOnClickListener(this);
            }
            View view = this.mMoreControlButtons;
            if (!z) {
                i = 8;
            }
            view.setVisibility(i);
        } else {
            this.mMoreControlButtons.setVisibility(8);
            if ((this.mAppEntry.info.flags & 1) != 0) {
                enabled = handleDisableable(this.mUninstallButton);
            } else if ((this.mPackageInfo.applicationInfo.flags & 8388608) != 0 || this.mUserManager.getUsers().size() < 2) {
                this.mUninstallButton.setText(2131428350);
            } else {
                this.mUninstallButton.setText(2131428350);
                enabled = false;
            }
        }
        if (this.mDpm.packageHasActiveAdmins(this.mPackageInfo.packageName)) {
            enabled = false;
        }
        this.mUninstallButton.setEnabled(enabled);
        if (enabled) {
            this.mUninstallButton.setOnClickListener(this);
        }
    }

    private void initMoveButton() {
        if (Environment.isExternalStorageEmulated()) {
            this.mMoveAppButton.setVisibility(4);
            return;
        }
        boolean dataOnly = this.mPackageInfo == null && this.mAppEntry != null;
        boolean moveDisable = true;
        if (dataOnly) {
            this.mMoveAppButton.setText(2131428410);
        } else if ((this.mAppEntry.info.flags & 262144) != 0) {
            this.mMoveAppButton.setText(2131428411);
            moveDisable = false;
        } else {
            this.mMoveAppButton.setText(2131428412);
            this.mCanBeOnSdCardChecker.init();
            moveDisable = !this.mCanBeOnSdCardChecker.check(this.mAppEntry.info);
        }
        if (moveDisable) {
            this.mMoveAppButton.setEnabled(false);
            return;
        }
        this.mMoveAppButton.setOnClickListener(this);
        this.mMoveAppButton.setEnabled(true);
    }

    private boolean handleDisableable(Button button) {
        try {
            PackageInfo packageInfo = this.mPm.getPackageInfo("android", 64);
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.addCategory("android.intent.category.HOME");
            intent.setPackage(this.mAppEntry.info.packageName);
            List queryIntentActivities = this.mPm.queryIntentActivities(intent, 0);
            if ((queryIntentActivities != null && queryIntentActivities.size() > 0) || isThisASystemPackage()) {
                button.setText(2131428353);
                return false;
            } else if (this.mAppEntry.info.enabled) {
                button.setText(2131428353);
                return true;
            } else {
                button.setText(2131428354);
                return true;
            }
        } catch (NameNotFoundException e) {
            Log.w("InstalledAppDetails", "Unable to get package info", e);
            return false;
        }
    }

    private String retrieveAppEntry() {
        Bundle args = getArguments();
        String packageName = args != null ? args.getString("package") : null;
        if (packageName == null) {
            Intent intent = args == null ? getActivity().getIntent() : (Intent) args.getParcelable("intent");
            if (intent != null) {
                packageName = intent.getData().getSchemeSpecificPart();
            }
        }
        this.mAppEntry = this.mState.getEntry(packageName);
        if (this.mAppEntry != null) {
            try {
                this.mPackageInfo = this.mPm.getPackageInfo(this.mAppEntry.info.packageName, 8768);
            } catch (NameNotFoundException e) {
                Log.e("InstalledAppDetails", "Exception when retrieving package:" + this.mAppEntry.info.packageName, e);
            }
        } else {
            Log.w("InstalledAppDetails", "Missing AppEntry; maybe reinstalling?");
            this.mPackageInfo = null;
        }
        return packageName;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mState = ApplicationsState.getInstance(getActivity().getApplication());
        this.mSession = this.mState.newSession(this);
        this.mPm = getActivity().getPackageManager();
        this.mUserManager = (UserManager) getActivity().getSystemService("user");
        this.mUsbManager = Stub.asInterface(ServiceManager.getService("usb"));
        this.mAppWidgetManager = AppWidgetManager.getInstance(getActivity());
        this.mDpm = (DevicePolicyManager) getActivity().getSystemService("device_policy");
        this.mSmsManager = Stub.asInterface(ServiceManager.getService("isms"));
        this.mCanBeOnSdCardChecker = new CanBeOnSdCardChecker();
        this.mSession.resume();
        retrieveAppEntry();
        setHasOptionsMenu(true);
    }

    public void onPrepareOptionsMenu(Menu menu) {
        boolean showIt = true;
        if (this.mUpdatedSysApp) {
            showIt = false;
        } else if (this.mAppEntry == null) {
            showIt = false;
        } else if ((this.mAppEntry.info.flags & 1) != 0) {
            showIt = false;
        } else if (this.mPackageInfo == null || this.mDpm.packageHasActiveAdmins(this.mPackageInfo.packageName)) {
            showIt = false;
        } else if (UserHandle.myUserId() != 0) {
            showIt = false;
        } else if (this.mUserManager.getUsers().size() < 2) {
            showIt = false;
        }
        menu.findItem(1).setVisible(showIt);
    }

    private void setAppLabelAndIcon(PackageInfo packageInfo) {
        View appSnippet = this.mRootView.findViewById(2131230729);
        appSnippet.setPaddingRelative(0, appSnippet.getPaddingTop(), 0, appSnippet.getPaddingBottom());
        ImageView icon = (ImageView) appSnippet.findViewById(2131230735);
        this.mState.ensureIcon(this.mAppEntry);
        icon.setImageDrawable(this.mAppEntry.icon);
        ((TextView) appSnippet.findViewById(2131230736)).setText(this.mAppEntry.label);
        this.mAppVersion = (TextView) appSnippet.findViewById(2131230897);
        if (packageInfo == null || packageInfo.versionName == null) {
            this.mAppVersion.setVisibility(4);
            return;
        }
        this.mAppVersion.setVisibility(0);
        this.mAppVersion.setText(getActivity().getString(2131428409, new Object[]{String.valueOf(packageInfo.versionName)}));
    }

    private void initiateClearUserData() {
        this.mClearDataButton.setEnabled(false);
        String str = this.mAppEntry.info.packageName;
        Log.i("InstalledAppDetails", "Clearing user data for package : " + str);
        if (this.mClearDataObserver == null) {
            this.mClearDataObserver = new 1(this);
        }
        if (((ActivityManager) getActivity().getSystemService("activity")).clearApplicationUserData(str, this.mClearDataObserver)) {
            this.mClearDataButton.setText(2131428386);
            return;
        }
        Log.i("InstalledAppDetails", "Couldnt clear application user data for package:" + str);
        showDialogInner(4, 0);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 1) {
            if (this.mDisableAfterUninstall) {
                this.mDisableAfterUninstall = false;
                try {
                    if ((getActivity().getPackageManager().getApplicationInfo(this.mAppEntry.info.packageName, 8704).flags & 128) == 0) {
                        new DisableChanger(this, this.mAppEntry.info, 3).execute(new Object[]{null});
                    }
                } catch (NameNotFoundException e) {
                }
            }
            if (!refreshUi()) {
                setIntentAndFinish(true, true);
            }
        }
    }

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        int i = 1;
        String str = this.mAppEntry.info.packageName;
        ActivityManager activityManager = (ActivityManager) getActivity().getSystemService("activity");
        if (compoundButton == this.mAskCompatibilityCB) {
            activityManager.setPackageAskScreenCompat(str, z);
        } else if (compoundButton == this.mEnableCompatibilityCB) {
            if (!z) {
                i = 0;
            }
            activityManager.setPackageScreenCompatMode(str, i);
        } else if (compoundButton != this.mNotificationSwitch) {
        } else {
            if (z) {
                setNotificationsEnabled(true);
            } else {
                showDialogInner(8, 0);
            }
        }
    }

    private void checkForceStop() {
        if (this.mDpm.packageHasActiveAdmins(this.mPackageInfo.packageName)) {
            updateForceStopButton(false);
        } else if ((this.mAppEntry.info.flags & 2097152) == 0) {
            updateForceStopButton(true);
        } else {
            Intent intent = new Intent("android.intent.action.QUERY_PACKAGE_RESTART", Uri.fromParts("package", this.mAppEntry.info.packageName, null));
            intent.putExtra("android.intent.extra.PACKAGES", new String[]{this.mAppEntry.info.packageName});
            intent.putExtra("android.intent.extra.UID", this.mAppEntry.info.uid);
            intent.putExtra("android.intent.extra.user_handle", UserHandle.getUserId(this.mAppEntry.info.uid));
            getActivity().sendOrderedBroadcast(intent, null, this.mCheckKillProcessesReceiver, null, 0, null, null);
        }
    }

    private void initNotificationButton() {
        boolean enabled = true;
        try {
            enabled = Stub.asInterface(ServiceManager.getService("notification")).areNotificationsEnabledForPackage(this.mAppEntry.info.packageName, this.mAppEntry.info.uid);
        } catch (RemoteException e) {
        }
        this.mNotificationSwitch.setChecked(enabled);
        if (isThisASystemPackage()) {
            this.mNotificationSwitch.setEnabled(false);
            return;
        }
        this.mNotificationSwitch.setEnabled(true);
        this.mNotificationSwitch.setOnCheckedChangeListener(this);
    }

    private void refreshButtons() {
        if (this.mMoveInProgress) {
            this.mMoveAppButton.setText(2131428413);
            this.mMoveAppButton.setEnabled(false);
            this.mUninstallButton.setEnabled(false);
            this.mSpecialDisableButton.setEnabled(false);
            return;
        }
        initUninstallButtons();
        initDataButtons();
        initMoveButton();
        initNotificationButton();
    }

    private CharSequence getMoveErrMsg(int i) {
        switch (i) {
            case -6:
                return "";
            case -5:
                return getActivity().getString(2131428417);
            case -4:
                return getActivity().getString(2131428416);
            case -3:
                return getActivity().getString(2131428418);
            case -2:
                return getActivity().getString(2131428415);
            case -1:
                return getActivity().getString(2131428414);
            default:
                return "";
        }
    }

    private void initDataButtons() {
        if ((this.mAppEntry.info.flags & 65) == 1 || this.mDpm.packageHasActiveAdmins(this.mPackageInfo.packageName)) {
            this.mClearDataButton.setText(2131428355);
            this.mClearDataButton.setEnabled(false);
            this.mCanClearData = false;
            return;
        }
        if (this.mAppEntry.info.manageSpaceActivityName != null) {
            this.mClearDataButton.setText(2131428373);
        } else {
            this.mClearDataButton.setText(2131428355);
        }
        this.mClearDataButton.setOnClickListener(this);
    }

    private void processClearMsg(Message message) {
        int i = message.arg1;
        String str = this.mAppEntry.info.packageName;
        this.mClearDataButton.setText(2131428355);
        if (i == 1) {
            Log.i("InstalledAppDetails", "Cleared user data for package : " + str);
            this.mState.requestSize(this.mAppEntry.info.packageName);
        } else {
            this.mClearDataButton.setEnabled(true);
        }
        checkForceStop();
    }

    private void processMoveMsg(Message message) {
        int i = message.arg1;
        String str = this.mAppEntry.info.packageName;
        this.mMoveInProgress = false;
        if (i == 1) {
            Log.i("InstalledAppDetails", "Moved resources for " + str);
            this.mState.requestSize(this.mAppEntry.info.packageName);
        } else {
            showDialogInner(6, i);
        }
        refreshUi();
    }

    private void forceStopPackage(String str) {
        ((ActivityManager) getActivity().getSystemService("activity")).forceStopPackage(str);
        this.mState.invalidatePackage(str);
        AppEntry entry = this.mState.getEntry(str);
        if (entry != null) {
            this.mAppEntry = entry;
        }
        checkForceStop();
    }

    private void setNotificationsEnabled(boolean z) {
        String packageName = this.mAppEntry.info.packageName;
        INotificationManager nm = Stub.asInterface(ServiceManager.getService("notification"));
        try {
            boolean isChecked = this.mNotificationSwitch.isChecked();
            nm.setNotificationsEnabledForPackage(packageName, this.mAppEntry.info.uid, z);
        } catch (RemoteException e) {
            this.mNotificationSwitch.setChecked(!z);
        }
    }

    private void uninstallPkg(String str, boolean z, boolean z2) {
        Intent intent = new Intent("android.intent.action.UNINSTALL_PACKAGE", Uri.parse("package:" + str));
        intent.putExtra("android.intent.extra.UNINSTALL_ALL_USERS", z);
        startActivityForResult(intent, 1);
        this.mDisableAfterUninstall = z2;
    }

    private int getPremiumSmsPermission(String str) {
        try {
            if (this.mSmsManager != null) {
                return this.mSmsManager.getPremiumSmsPermission(str);
            }
        } catch (RemoteException e) {
        }
        return 0;
    }

    private boolean isThisASystemPackage() {
        try {
            return (this.mPackageInfo == null || this.mPackageInfo.signatures == null || !this.mPm.getPackageInfo("android", 64).signatures[0].equals(this.mPackageInfo.signatures[0])) ? false : true;
        } catch (NameNotFoundException e) {
            return false;
        }
    }

    private void setIntentAndFinish(boolean z, boolean z2) {
        Intent intent = new Intent();
        intent.putExtra("chg", z2);
        ((PreferenceActivity) getActivity()).finishPreferencePanel(this, -1, intent);
    }

    public void onResume() {
        super.onResume();
        this.mSession.resume();
        if (!refreshUi()) {
            setIntentAndFinish(true, true);
        }
    }

    private void resetLaunchDefaultsUi(TextView textView, TextView textView2) {
        textView.setText(2131428336);
        textView2.setText(2131428359);
        this.mActivitiesButton.setEnabled(false);
    }

    private void showDialogInner(int i, int i2) {
        MyAlertDialogFragment newInstance = MyAlertDialogFragment.newInstance(i, i2);
        newInstance.setTargetFragment(this, 0);
        newInstance.show(getFragmentManager(), "dialog " + i);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 1) {
            return false;
        }
        uninstallPkg(this.mAppEntry.info.packageName, true, false);
        return true;
    }

    private String getSizeStr(long j) {
        return j == -1 ? this.mInvalidSizeStr.toString() : Formatter.formatFileSize(getActivity(), j);
    }

    private void updateForceStopButton(boolean z) {
        this.mForceStopButton.setEnabled(z);
        this.mForceStopButton.setOnClickListener(this);
    }

    public void onPackageSizeChanged(String str) {
        if (str.equals(this.mAppEntry.info.packageName)) {
            refreshSizeInfo();
        }
    }

    public void onPause() {
        super.onPause();
        this.mSession.pause();
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menu.add(0, 1, 1, 2131428351).setShowAsAction(0);
    }

    public void onPackageListChanged() {
        refreshUi();
    }

    public void onAllSizesComputed() {
    }

    public void onPackageIconChanged() {
    }

    public void onRebuildComplete(ArrayList<AppEntry> arrayList) {
    }

    public void onRunningStateChanged(boolean z) {
    }
}