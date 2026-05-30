package com.jellybyn.settings;

import android.app.ActionBar.LayoutParams;
import android.app.Activity;
import android.app.ActivityManagerNative;
import android.app.ActivityThread;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.admin.DevicePolicyManager;
import android.app.backup.IBackupManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.hardware.usb.IUsbManager.Stub;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceFragment;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.provider.Settings.Global;
import android.provider.Settings.Secure;
import android.text.TextUtils;
import android.util.Log;
import android.view.IWindowManager;
import android.webkit.WebViewFactory;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.Switch;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.HashSet;

public class DevelopmentSettings extends PreferenceFragment implements OnClickListener, OnDismissListener, OnPreferenceChangeListener, OnCheckedChangeListener {
    private Dialog mAdbDialog;
    private Dialog mAdbKeysDialog;
    private final ArrayList<Preference> mAllPrefs = new ArrayList();
    private CheckBoxPreference mAllowMockLocation;
    private ListPreference mAnimatorDurationScale;
    private ListPreference mAppProcessLimit;
    private IBackupManager mBackupManager;
    private Preference mBugreport;
    private CheckBoxPreference mBugreportInPower;
    private Preference mClearAdbKeys;
    private String mDebugApp;
    private Preference mDebugAppPref;
    private CheckBoxPreference mDebugLayout;
    private boolean mDialogClicked;
    private CheckBoxPreference mDisableOverlays;
    private final HashSet<Preference> mDisabledPrefs = new HashSet();
    private boolean mDontPokeProperties;
    private DevicePolicyManager mDpm;
    private CheckBoxPreference mEnableAdb;
    private Dialog mEnableDialog;
    private Switch mEnabledSwitch;
    private CheckBoxPreference mEnforceReadExternal;
    private CheckBoxPreference mExperimentalWebView;
    private CheckBoxPreference mForceHardwareUi;
    private CheckBoxPreference mForceMsaa;
    private boolean mHaveDebugSettings;
    private CheckBoxPreference mImmediatelyDestroyActivities;
    private CheckBoxPreference mKeepScreenAlways;
    private CheckBoxPreference mKeepScreenOn;
    private boolean mLastEnabledState;
    private ListPreference mOpenGLTraces;
    private ListPreference mOverlayDisplayDevices;
    private PreferenceScreen mPassword;
    private CheckBoxPreference mPointerLocation;
    private final ArrayList<CheckBoxPreference> mResetCbPrefs = new ArrayList();
    private CheckBoxPreference mShowAllANRs;
    private CheckBoxPreference mShowCpuUsage;
    private CheckBoxPreference mShowHwLayersUpdates;
    private CheckBoxPreference mShowHwOverdraw;
    private CheckBoxPreference mShowHwScreenUpdates;
    private ListPreference mShowNonRectClip;
    private CheckBoxPreference mShowScreenUpdates;
    private CheckBoxPreference mShowTouches;
    private CheckBoxPreference mStrictMode;
    private ListPreference mTrackFrameTime;
    private ListPreference mTransitionAnimationScale;
    private boolean mUnavailable;
    private CheckBoxPreference mVerifyAppsOverUsb;
    private CheckBoxPreference mWaitForDebugger;
    private ListPreference mWindowAnimationScale;
    private IWindowManager mWindowManager;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mWindowManager = Stub.asInterface(ServiceManager.getService("window"));
        this.mBackupManager = Stub.asInterface(ServiceManager.getService("backup"));
        this.mDpm = (DevicePolicyManager) getActivity().getSystemService("device_policy");
        if (Process.myUserHandle().getIdentifier() != 0) {
            this.mUnavailable = true;
            setPreferenceScreen(new PreferenceScreen(getActivity(), null));
            return;
        }
        PreferenceGroup preferenceGroup;
        addPreferencesFromResource(2131034124);
        this.mEnableAdb = findAndInitCheckboxPref("enable_adb");
        this.mClearAdbKeys = findPreference("clear_adb_keys");
        if (!SystemProperties.getBoolean("ro.adb.secure", false)) {
            preferenceGroup = (PreferenceGroup) findPreference("debug_debugging_category");
            if (preferenceGroup != null) {
                preferenceGroup.removePreference(this.mClearAdbKeys);
            }
        }
        this.mBugreport = findPreference("bugreport");
        this.mBugreportInPower = findAndInitCheckboxPref("bugreport_in_power");
        this.mKeepScreenOn = findAndInitCheckboxPref("keep_screen_on");
        this.mKeepScreenAlways = findAndInitCheckboxPref("keep_screen_always");
        this.mEnforceReadExternal = findAndInitCheckboxPref("enforce_read_external");
        this.mAllowMockLocation = findAndInitCheckboxPref("allow_mock_location");
        this.mPassword = (PreferenceScreen) findPreference("local_backup_password");
        this.mAllPrefs.add(this.mPassword);
        if (!Process.myUserHandle().equals(UserHandle.OWNER)) {
            disableForUser(this.mEnableAdb);
            disableForUser(this.mClearAdbKeys);
            disableForUser(this.mPassword);
        }
        this.mDebugAppPref = findPreference("debug_app");
        this.mAllPrefs.add(this.mDebugAppPref);
        this.mWaitForDebugger = findAndInitCheckboxPref("wait_for_debugger");
        this.mVerifyAppsOverUsb = findAndInitCheckboxPref("verify_apps_over_usb");
        if (!showVerifierSetting()) {
            preferenceGroup = (PreferenceGroup) findPreference("debug_debugging_category");
            if (preferenceGroup != null) {
                preferenceGroup.removePreference(this.mVerifyAppsOverUsb);
            } else {
                this.mVerifyAppsOverUsb.setEnabled(false);
            }
        }
        this.mStrictMode = findAndInitCheckboxPref("strict_mode");
        this.mPointerLocation = findAndInitCheckboxPref("pointer_location");
        this.mShowTouches = findAndInitCheckboxPref("show_touches");
        this.mShowScreenUpdates = findAndInitCheckboxPref("show_screen_updates");
        this.mDisableOverlays = findAndInitCheckboxPref("disable_overlays");
        this.mShowCpuUsage = findAndInitCheckboxPref("show_cpu_usage");
        this.mForceHardwareUi = findAndInitCheckboxPref("force_hw_ui");
        this.mForceMsaa = findAndInitCheckboxPref("force_msaa");
        this.mTrackFrameTime = addListPreference("track_frame_time");
        this.mShowNonRectClip = addListPreference("show_non_rect_clip");
        this.mShowHwScreenUpdates = findAndInitCheckboxPref("show_hw_screen_udpates");
        this.mShowHwLayersUpdates = findAndInitCheckboxPref("show_hw_layers_udpates");
        this.mShowHwOverdraw = findAndInitCheckboxPref("show_hw_overdraw");
        this.mDebugLayout = findAndInitCheckboxPref("debug_layout");
        this.mWindowAnimationScale = addListPreference("window_animation_scale");
        this.mTransitionAnimationScale = addListPreference("transition_animation_scale");
        this.mAnimatorDurationScale = addListPreference("animator_duration_scale");
        this.mOverlayDisplayDevices = addListPreference("overlay_display_devices");
        this.mOpenGLTraces = addListPreference("enable_opengl_traces");
        this.mImmediatelyDestroyActivities = (CheckBoxPreference) findPreference("immediately_destroy_activities");
        this.mAllPrefs.add(this.mImmediatelyDestroyActivities);
        this.mResetCbPrefs.add(this.mImmediatelyDestroyActivities);
        this.mAppProcessLimit = addListPreference("app_process_limit");
        this.mShowAllANRs = (CheckBoxPreference) findPreference("show_all_anrs");
        this.mAllPrefs.add(this.mShowAllANRs);
        this.mResetCbPrefs.add(this.mShowAllANRs);
        if (WebViewFactory.isExperimentalWebViewAvailable()) {
            this.mExperimentalWebView = findAndInitCheckboxPref("experimental_webview");
        } else {
            Preference experimentalWebView = findPreference("experimental_webview");
            PreferenceGroup debugApplicationsCategory = (PreferenceGroup) findPreference("debug_applications_category");
            if (debugApplicationsCategory != null) {
                debugApplicationsCategory.removePreference(experimentalWebView);
            }
        }
        Preference findPreference = findPreference("hdcp_checking");
        if (findPreference != null) {
            this.mAllPrefs.add(findPreference);
        }
        removeHdcpOptionsForProduction();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        int i = 1;
        if (!Utils.isMonkeyRunning()) {
            ContentResolver contentResolver;
            String str;
            if (preference == this.mEnableAdb) {
                if (this.mEnableAdb.isChecked()) {
                    this.mDialogClicked = false;
                    if (this.mAdbDialog != null) {
                        dismissDialogs();
                    }
                    this.mAdbDialog = new Builder(getActivity()).setMessage(getActivity().getResources().getString(2131428565)).setTitle(2131428564).setIconAttribute(16843605).setPositiveButton(17039379, this).setNegativeButton(17039369, this).show();
                    this.mAdbDialog.setOnDismissListener(this);
                } else {
                    Secure.putInt(getActivity().getContentResolver(), "adb_enabled", 0);
                    this.mVerifyAppsOverUsb.setEnabled(false);
                    this.mVerifyAppsOverUsb.setChecked(false);
                    updateBugreportOptions();
                }
            } else if (preference == this.mClearAdbKeys) {
                if (this.mAdbKeysDialog != null) {
                    dismissDialogs();
                }
                this.mAdbKeysDialog = new Builder(getActivity()).setMessage(2131428566).setPositiveButton(17039370, this).setNegativeButton(17039360, null).show();
            } else if (preference == this.mBugreportInPower) {
                contentResolver = getActivity().getContentResolver();
                str = "bugreport_in_power_menu";
                if (!this.mBugreportInPower.isChecked()) {
                    i = 0;
                }
                Secure.putInt(contentResolver, str, i);
            } else if (preference == this.mKeepScreenOn) {
                Secure.putInt(getActivity().getContentResolver(), "stay_on_while_plugged_in", this.mKeepScreenOn.isChecked() ? 3 : 0);
            } else if (preference == this.mKeepScreenAlways) {
                contentResolver = getActivity().getContentResolver();
                str = "stay_on_always";
                if (!this.mKeepScreenAlways.isChecked()) {
                    i = 0;
                }
                Secure.putInt(contentResolver, str, i);
            } else if (preference == this.mEnforceReadExternal) {
                if (this.mEnforceReadExternal.isChecked()) {
                    ConfirmEnforceFragment.show(this);
                } else {
                    setPermissionEnforced(getActivity(), "android.permission.READ_EXTERNAL_STORAGE", false);
                }
            } else if (preference == this.mAllowMockLocation) {
                contentResolver = getActivity().getContentResolver();
                str = "mock_location";
                if (!this.mAllowMockLocation.isChecked()) {
                    i = 0;
                }
                Secure.putInt(contentResolver, str, i);
            } else if (preference == this.mDebugAppPref) {
                startActivityForResult(new Intent(getActivity(), AppPicker.class), 1000);
            } else if (preference == this.mWaitForDebugger) {
                writeDebuggerOptions();
            } else if (preference == this.mVerifyAppsOverUsb) {
                writeVerifyAppsOverUsbOptions();
            } else if (preference == this.mStrictMode) {
                writeStrictModeVisualOptions();
            } else if (preference == this.mPointerLocation) {
                writePointerLocationOptions();
            } else if (preference == this.mShowTouches) {
                writeShowTouchesOptions();
            } else if (preference == this.mShowScreenUpdates) {
                writeShowUpdatesOption();
            } else if (preference == this.mDisableOverlays) {
                writeDisableOverlaysOption();
            } else if (preference == this.mShowCpuUsage) {
                writeCpuUsageOptions();
            } else if (preference == this.mImmediatelyDestroyActivities) {
                writeImmediatelyDestroyActivitiesOptions();
            } else if (preference == this.mShowAllANRs) {
                writeShowAllANRsOptions();
            } else if (preference == this.mExperimentalWebView) {
                writeExperimentalWebViewOptions();
            } else if (preference == this.mForceHardwareUi) {
                writeHardwareUiOptions();
            } else if (preference == this.mForceMsaa) {
                writeMsaaOptions();
            } else if (preference == this.mShowHwScreenUpdates) {
                writeShowHwScreenUpdatesOptions();
            } else if (preference == this.mShowHwLayersUpdates) {
                writeShowHwLayersUpdatesOptions();
            } else if (preference == this.mShowHwOverdraw) {
                writeShowHwOverdrawOptions();
            } else if (preference == this.mDebugLayout) {
                writeDebugLayoutOptions();
            }
        }
        return false;
    }

    private void updateAllOptions() {
        boolean z = true;
        ContentResolver cr = getActivity().getContentResolver();
        this.mHaveDebugSettings = false;
        updateCheckBox(this.mEnableAdb, Global.getInt(cr, "adb_enabled", 0) != 0);
        updateCheckBox(this.mBugreportInPower, Global.getInt(cr, "bugreport_in_power_menu", 0) != 0);
        updateCheckBox(this.mKeepScreenOn, Global.getInt(cr, "stay_on_while_plugged_in", 0) != 0);
        updateCheckBox(this.mKeepScreenAlways, Global.getInt(cr, "stay_on_always", 1) != 0);
        updateCheckBox(this.mEnforceReadExternal, isPermissionEnforced("android.permission.READ_EXTERNAL_STORAGE"));
        CheckBoxPreference checkBoxPreference = this.mAllowMockLocation;
        if (Global.getInt(cr, "mock_location", 0) == 0) {
            z = false;
        }
        updateCheckBox(checkBoxPreference, z);
        updateHdcpValues();
        updatePasswordSummary();
        updateDebuggerOptions();
        updateStrictModeVisualOptions();
        updatePointerLocationOptions();
        updateShowTouchesOptions();
        updateFlingerOptions();
        updateCpuUsageOptions();
        updateHardwareUiOptions();
        updateMsaaOptions();
        updateTrackFrameTimeOptions();
        updateShowNonRectClipOptions();
        updateShowHwScreenUpdatesOptions();
        updateShowHwLayersUpdatesOptions();
        updateShowHwOverdrawOptions();
        updateDebugLayoutOptions();
        updateAnimationScaleOptions();
        updateOverlayDisplayDevicesOptions();
        updateOpenGLTracesOptions();
        updateImmediatelyDestroyActivitiesOptions();
        updateAppProcessLimitOptions();
        updateShowAllANRsOptions();
        updateExperimentalWebViewOptions();
        updateVerifyAppsOverUsbOptions();
        updateBugreportOptions();
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (dialogInterface == this.mAdbDialog) {
            if (i == -1) {
                this.mDialogClicked = true;
                Secure.putInt(getActivity().getContentResolver(), "adb_enabled", 1);
                this.mVerifyAppsOverUsb.setEnabled(true);
                updateVerifyAppsOverUsbOptions();
                updateBugreportOptions();
                return;
            }
            this.mEnableAdb.setChecked(false);
        } else if (dialogInterface == this.mAdbKeysDialog) {
            if (i == -1) {
                try {
                    Stub.asInterface(ServiceManager.getService("usb")).clearUsbDebuggingKeys();
                } catch (RemoteException e) {
                    Log.e("DevelopmentSettings", "Unable to clear adb keys", e);
                }
            }
        } else if (dialogInterface != this.mEnableDialog) {
        } else {
            if (i == -1) {
                this.mDialogClicked = true;
                Secure.putInt(getActivity().getContentResolver(), "development_settings_enabled", 1);
                this.mLastEnabledState = true;
                setPrefsEnabledState(this.mLastEnabledState);
                return;
            }
            this.mEnabledSwitch.setChecked(false);
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if ("hdcp_checking".equals(preference.getKey())) {
            SystemProperties.set("persist.sys.hdcp_checking", obj.toString());
            updateHdcpValues();
            pokeSystemProperties();
            return true;
        } else if (preference == this.mWindowAnimationScale) {
            writeAnimationScaleOption(0, this.mWindowAnimationScale, obj);
            return true;
        } else if (preference == this.mTransitionAnimationScale) {
            writeAnimationScaleOption(1, this.mTransitionAnimationScale, obj);
            return true;
        } else if (preference == this.mAnimatorDurationScale) {
            writeAnimationScaleOption(2, this.mAnimatorDurationScale, obj);
            return true;
        } else if (preference == this.mOverlayDisplayDevices) {
            writeOverlayDisplayDevicesOptions(obj);
            return true;
        } else if (preference == this.mOpenGLTraces) {
            writeOpenGLTracesOptions(obj);
            return true;
        } else if (preference == this.mTrackFrameTime) {
            writeTrackFrameTimeOptions(obj);
            return true;
        } else if (preference == this.mShowNonRectClip) {
            writeShowNonRectClipOptions(obj);
            return true;
        } else if (preference != this.mAppProcessLimit) {
            return false;
        } else {
            writeAppProcessLimitOptions(obj);
            return true;
        }
    }

    private void updateFlingerOptions() {
        boolean z = true;
        try {
            IBinder service = ServiceManager.getService("SurfaceFlinger");
            if (service != null) {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                obtain.writeInterfaceToken("android.ui.ISurfaceComposer");
                service.transact(1010, obtain, obtain2, 0);
                obtain2.readInt();
                obtain2.readInt();
                updateCheckBox(this.mShowScreenUpdates, obtain2.readInt() != 0);
                obtain2.readInt();
                int readInt = obtain2.readInt();
                CheckBoxPreference checkBoxPreference = this.mDisableOverlays;
                if (readInt == 0) {
                    z = false;
                }
                updateCheckBox(checkBoxPreference, z);
                obtain2.recycle();
                obtain.recycle();
            }
        } catch (RemoteException e) {
        }
    }

    public void onResume() {
        boolean z = false;
        super.onResume();
        if (this.mUnavailable) {
            TextView textView = (TextView) getView().findViewById(16908292);
            getListView().setEmptyView(textView);
            if (textView != null) {
                textView.setText(2131428552);
                return;
            }
            return;
        }
        if (this.mDpm.getMaximumTimeToLock(null) > 0) {
            this.mDisabledPrefs.add(this.mKeepScreenOn);
        } else {
            this.mDisabledPrefs.remove(this.mKeepScreenOn);
        }
        if (Global.getInt(getActivity().getContentResolver(), "development_settings_enabled", 0) != 0) {
            z = true;
        }
        this.mLastEnabledState = z;
        this.mEnabledSwitch.setChecked(this.mLastEnabledState);
        setPrefsEnabledState(this.mLastEnabledState);
        if (this.mHaveDebugSettings && !this.mLastEnabledState) {
            Secure.putInt(getActivity().getContentResolver(), "development_settings_enabled", 1);
            this.mLastEnabledState = true;
            this.mEnabledSwitch.setChecked(this.mLastEnabledState);
            setPrefsEnabledState(this.mLastEnabledState);
        }
    }

    private void resetDangerousOptions() {
        this.mDontPokeProperties = true;
        for (int i = 0; i < this.mResetCbPrefs.size(); i++) {
            CheckBoxPreference checkBoxPreference = (CheckBoxPreference) this.mResetCbPrefs.get(i);
            if (checkBoxPreference.isChecked()) {
                checkBoxPreference.setChecked(false);
                onPreferenceTreeClick(null, checkBoxPreference);
            }
        }
        resetDebuggerOptions();
        writeAnimationScaleOption(0, this.mWindowAnimationScale, null);
        writeAnimationScaleOption(1, this.mTransitionAnimationScale, null);
        writeAnimationScaleOption(2, this.mAnimatorDurationScale, null);
        writeOverlayDisplayDevicesOptions(null);
        writeAppProcessLimitOptions(null);
        this.mHaveDebugSettings = false;
        updateAllOptions();
        this.mDontPokeProperties = false;
        pokeSystemProperties();
    }

    private void updateDebuggerOptions() {
        this.mDebugApp = Global.getString(getActivity().getContentResolver(), "debug_app");
        updateCheckBox(this.mWaitForDebugger, Global.getInt(getActivity().getContentResolver(), "wait_for_debugger", 0) != 0);
        if (this.mDebugApp == null || this.mDebugApp.length() <= 0) {
            this.mDebugAppPref.setSummary(getResources().getString(2131428900));
            this.mWaitForDebugger.setEnabled(false);
            return;
        }
        String obj;
        try {
            CharSequence applicationLabel = getActivity().getPackageManager().getApplicationLabel(getActivity().getPackageManager().getApplicationInfo(this.mDebugApp, 512));
            obj = applicationLabel != null ? applicationLabel.toString() : this.mDebugApp;
        } catch (NameNotFoundException e) {
            obj = this.mDebugApp;
        }
        this.mDebugAppPref.setSummary(getResources().getString(2131428901, new Object[]{obj}));
        this.mWaitForDebugger.setEnabled(true);
        this.mHaveDebugSettings = true;
    }

    private void updateAnimationScaleValue(int i, ListPreference listPreference) {
        try {
            float animationScale = this.mWindowManager.getAnimationScale(i);
            if (animationScale != 1.0f) {
                this.mHaveDebugSettings = true;
            }
            CharSequence[] entryValues = listPreference.getEntryValues();
            for (int i2 = 0; i2 < entryValues.length; i2++) {
                if (animationScale <= Float.parseFloat(entryValues[i2].toString())) {
                    listPreference.setValueIndex(i2);
                    listPreference.setSummary(listPreference.getEntries()[i2]);
                    return;
                }
            }
            listPreference.setValueIndex(entryValues.length - 1);
            listPreference.setSummary(listPreference.getEntries()[0]);
        } catch (RemoteException e) {
        }
    }

    private void updateAppProcessLimitOptions() {
        try {
            int processLimit = ActivityManagerNative.getDefault().getProcessLimit();
            CharSequence[] entryValues = this.mAppProcessLimit.getEntryValues();
            for (int i = 0; i < entryValues.length; i++) {
                if (Integer.parseInt(entryValues[i].toString()) >= processLimit) {
                    if (i != 0) {
                        this.mHaveDebugSettings = true;
                    }
                    this.mAppProcessLimit.setValueIndex(i);
                    this.mAppProcessLimit.setSummary(this.mAppProcessLimit.getEntries()[i]);
                    return;
                }
            }
            this.mAppProcessLimit.setValueIndex(0);
            this.mAppProcessLimit.setSummary(this.mAppProcessLimit.getEntries()[0]);
        } catch (RemoteException e) {
        }
    }

    private void updateHdcpValues() {
        int index = 1;
        ListPreference hdcpChecking = (ListPreference) findPreference("hdcp_checking");
        if (hdcpChecking != null) {
            String currentValue = SystemProperties.get("persist.sys.hdcp_checking");
            String[] values = getResources().getStringArray(2131165241);
            String[] summaries = getResources().getStringArray(2131165242);
            for (int i = 0; i < values.length; i++) {
                if (currentValue.equals(values[i])) {
                    index = i;
                    break;
                }
            }
            hdcpChecking.setValue(values[index]);
            hdcpChecking.setSummary(summaries[index]);
            hdcpChecking.setOnPreferenceChangeListener(this);
        }
    }

    private void updateBugreportOptions() {
        if ("user".equals(Build.TYPE)) {
            ContentResolver contentResolver = getActivity().getContentResolver();
            if (Global.getInt(contentResolver, "adb_enabled", 0) != 0) {
                this.mBugreport.setEnabled(true);
                this.mBugreportInPower.setEnabled(true);
                return;
            }
            this.mBugreport.setEnabled(false);
            this.mBugreportInPower.setEnabled(false);
            this.mBugreportInPower.setChecked(false);
            Secure.putInt(contentResolver, "bugreport_in_power_menu", 0);
            return;
        }
        this.mBugreportInPower.setEnabled(true);
    }

    private void updateOpenGLTracesOptions() {
        String str = SystemProperties.get("debug.egl.trace");
        if (str == null) {
            str = "";
        }
        CharSequence[] entryValues = this.mOpenGLTraces.getEntryValues();
        for (int i = 0; i < entryValues.length; i++) {
            if (str.contentEquals(entryValues[i])) {
                this.mOpenGLTraces.setValueIndex(i);
                this.mOpenGLTraces.setSummary(this.mOpenGLTraces.getEntries()[i]);
                return;
            }
        }
        this.mOpenGLTraces.setValueIndex(0);
        this.mOpenGLTraces.setSummary(this.mOpenGLTraces.getEntries()[0]);
    }

    private void updateOverlayDisplayDevicesOptions() {
        String string = Global.getString(getActivity().getContentResolver(), "overlay_display_devices");
        if (string == null) {
            string = "";
        }
        CharSequence[] entryValues = this.mOverlayDisplayDevices.getEntryValues();
        for (int i = 0; i < entryValues.length; i++) {
            if (string.contentEquals(entryValues[i])) {
                this.mOverlayDisplayDevices.setValueIndex(i);
                this.mOverlayDisplayDevices.setSummary(this.mOverlayDisplayDevices.getEntries()[i]);
                return;
            }
        }
        this.mOverlayDisplayDevices.setValueIndex(0);
        this.mOverlayDisplayDevices.setSummary(this.mOverlayDisplayDevices.getEntries()[0]);
    }

    private void updateShowNonRectClipOptions() {
        String str = SystemProperties.get("debug.hwui.show_non_rect_clip");
        if (str == null) {
            str = "hide";
        }
        CharSequence[] entryValues = this.mShowNonRectClip.getEntryValues();
        for (int i = 0; i < entryValues.length; i++) {
            if (str.contentEquals(entryValues[i])) {
                this.mShowNonRectClip.setValueIndex(i);
                this.mShowNonRectClip.setSummary(this.mShowNonRectClip.getEntries()[i]);
                return;
            }
        }
        this.mShowNonRectClip.setValueIndex(0);
        this.mShowNonRectClip.setSummary(this.mShowNonRectClip.getEntries()[0]);
    }

    private void updateTrackFrameTimeOptions() {
        String str = SystemProperties.get("debug.hwui.profile");
        if (str == null) {
            str = "";
        }
        CharSequence[] entryValues = this.mTrackFrameTime.getEntryValues();
        for (int i = 0; i < entryValues.length; i++) {
            if (str.contentEquals(entryValues[i])) {
                this.mTrackFrameTime.setValueIndex(i);
                this.mTrackFrameTime.setSummary(this.mTrackFrameTime.getEntries()[i]);
                return;
            }
        }
        this.mTrackFrameTime.setValueIndex(0);
        this.mTrackFrameTime.setSummary(this.mTrackFrameTime.getEntries()[0]);
    }

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        if (compoundButton == this.mEnabledSwitch && z != this.mLastEnabledState) {
            if (z) {
                this.mDialogClicked = false;
                if (this.mEnableDialog != null) {
                    dismissDialogs();
                }
                this.mEnableDialog = new Builder(getActivity()).setMessage(getActivity().getResources().getString(2131428568)).setTitle(2131428567).setIconAttribute(16843605).setPositiveButton(17039379, this).setNegativeButton(17039369, this).show();
                this.mEnableDialog.setOnDismissListener(this);
                return;
            }
            resetDangerousOptions();
            Secure.putInt(getActivity().getContentResolver(), "development_settings_enabled", 0);
            this.mLastEnabledState = z;
            setPrefsEnabledState(this.mLastEnabledState);
        }
    }

    private boolean enableVerifierSetting() {
        ContentResolver contentResolver = getActivity().getContentResolver();
        if (Global.getInt(contentResolver, "adb_enabled", 0) == 0 || Global.getInt(contentResolver, "package_verifier_enable", 1) == 0) {
            return false;
        }
        PackageManager packageManager = getActivity().getPackageManager();
        Intent intent = new Intent("android.intent.action.PACKAGE_NEEDS_VERIFICATION");
        intent.setType("application/vnd.android.package-archive");
        intent.addFlags(1);
        return packageManager.queryBroadcastReceivers(intent, 0).size() != 0;
    }

    private void writeDisableOverlaysOption() {
        int i = 0;
        try {
            IBinder service = ServiceManager.getService("SurfaceFlinger");
            if (service != null) {
                Parcel obtain = Parcel.obtain();
                obtain.writeInterfaceToken("android.ui.ISurfaceComposer");
                if (this.mDisableOverlays.isChecked()) {
                    i = 1;
                }
                obtain.writeInt(i);
                service.transact(1008, obtain, null, 0);
                obtain.recycle();
                updateFlingerOptions();
            }
        } catch (RemoteException e) {
        }
    }

    private void writeShowUpdatesOption() {
        int i = 0;
        try {
            IBinder service = ServiceManager.getService("SurfaceFlinger");
            if (service != null) {
                Parcel obtain = Parcel.obtain();
                obtain.writeInterfaceToken("android.ui.ISurfaceComposer");
                if (this.mShowScreenUpdates.isChecked()) {
                    i = 1;
                }
                obtain.writeInt(i);
                service.transact(1002, obtain, null, 0);
                obtain.recycle();
                updateFlingerOptions();
            }
        } catch (RemoteException e) {
        }
    }

    private void dismissDialogs() {
        if (this.mAdbDialog != null) {
            this.mAdbDialog.dismiss();
            this.mAdbDialog = null;
        }
        if (this.mAdbKeysDialog != null) {
            this.mAdbKeysDialog.dismiss();
            this.mAdbKeysDialog = null;
        }
        if (this.mEnableDialog != null) {
            this.mEnableDialog.dismiss();
            this.mEnableDialog = null;
        }
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        this.mEnabledSwitch = new Switch(activity);
        this.mEnabledSwitch.setPaddingRelative(0, 0, activity.getResources().getDimensionPixelSize(2131558402), 0);
        if (this.mUnavailable) {
            this.mEnabledSwitch.setEnabled(false);
        } else {
            this.mEnabledSwitch.setOnCheckedChangeListener(this);
        }
    }

    public void onDismiss(DialogInterface dialogInterface) {
        if (dialogInterface == this.mAdbDialog) {
            if (!this.mDialogClicked) {
                this.mEnableAdb.setChecked(false);
            }
            this.mAdbDialog = null;
        } else if (dialogInterface == this.mEnableDialog) {
            if (!this.mDialogClicked) {
                this.mEnabledSwitch.setChecked(false);
            }
            this.mEnableDialog = null;
        }
    }

    private void writeCpuUsageOptions() {
        boolean isChecked = this.mShowCpuUsage.isChecked();
        Secure.putInt(getActivity().getContentResolver(), "show_processes", isChecked ? 1 : 0);
        Intent className = new Intent().setClassName("com.android.systemui", "com.android.systemui.LoadAverageService");
        if (isChecked) {
            getActivity().startService(className);
        } else {
            getActivity().stopService(className);
        }
    }

    private void setPrefsEnabledState(boolean z) {
        for (int i = 0; i < this.mAllPrefs.size(); i++) {
            Preference preference = (Preference) this.mAllPrefs.get(i);
            boolean z2 = z && !this.mDisabledPrefs.contains(preference);
            preference.setEnabled(z2);
        }
        updateAllOptions();
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i != 1000) {
            super.onActivityResult(i, i2, intent);
        } else if (i2 == -1) {
            this.mDebugApp = intent.getAction();
            writeDebuggerOptions();
            updateDebuggerOptions();
        }
    }

    private CheckBoxPreference findAndInitCheckboxPref(String str) {
        CheckBoxPreference pref = (CheckBoxPreference) findPreference(str);
        if (pref == null) {
            throw new Intent("Cannot find preference with key = " + str);
        }
        this.mAllPrefs.add(pref);
        this.mResetCbPrefs.add(pref);
        return pref;
    }

    private void removeHdcpOptionsForProduction() {
        if ("user".equals(Build.TYPE)) {
            Preference findPreference = findPreference("hdcp_checking");
            if (findPreference != null) {
                getPreferenceScreen().removePreference(findPreference);
                this.mAllPrefs.remove(findPreference);
            }
        }
    }

    private void writeAnimationScaleOption(int i, ListPreference listPreference, Object obj) {
        float parseFloat;
        if (obj != null) {
            try {
                parseFloat = Float.parseFloat(obj.toString());
            } catch (RemoteException e) {
                return;
            }
        }
        parseFloat = 1.0f;
        this.mWindowManager.setAnimationScale(i, parseFloat);
        updateAnimationScaleValue(i, listPreference);
    }

    private void writeAppProcessLimitOptions(Object obj) {
        int parseInt;
        if (obj != null) {
            try {
                parseInt = Integer.parseInt(obj.toString());
            } catch (RemoteException e) {
                return;
            }
        }
        parseInt = -1;
        ActivityManagerNative.getDefault().setProcessLimit(parseInt);
        updateAppProcessLimitOptions();
    }

    private void updatePasswordSummary() {
        try {
            if (this.mBackupManager.hasBackupPassword()) {
                this.mPassword.setSummary(2131428795);
            } else {
                this.mPassword.setSummary(2131428794);
            }
        } catch (RemoteException e) {
        }
    }

    private void writeExperimentalWebViewOptions() {
        if (this.mExperimentalWebView != null) {
            SystemProperties.set("persist.sys.webview.exp", this.mExperimentalWebView.isChecked() ? "true" : null);
            pokeSystemProperties();
        }
    }

    private void writeOpenGLTracesOptions(Object obj) {
        SystemProperties.set("debug.egl.trace", obj == null ? "" : obj.toString());
        pokeSystemProperties();
        updateOpenGLTracesOptions();
    }

    private void writeShowNonRectClipOptions(Object obj) {
        SystemProperties.set("debug.hwui.show_non_rect_clip", obj == null ? "" : obj.toString());
        pokeSystemProperties();
        updateShowNonRectClipOptions();
    }

    private void writeTrackFrameTimeOptions(Object obj) {
        SystemProperties.set("debug.hwui.profile", obj == null ? "" : obj.toString());
        pokeSystemProperties();
        updateTrackFrameTimeOptions();
    }

    public void onStart() {
        super.onStart();
        Activity activity = getActivity();
        activity.getActionBar().setDisplayOptions(16, 16);
        activity.getActionBar().setCustomView(this.mEnabledSwitch, new LayoutParams(-2, -2, 8388629));
    }

    public void onStop() {
        super.onStop();
        Activity activity = getActivity();
        activity.getActionBar().setDisplayOptions(0, 16);
        activity.getActionBar().setCustomView(null);
    }

    private ListPreference addListPreference(String str) {
        ListPreference pref = (ListPreference) findPreference(str);
        this.mAllPrefs.add(pref);
        pref.setOnPreferenceChangeListener(this);
        return pref;
    }

    private static int currentStrictModeActiveIndex() {
        if (TextUtils.isEmpty(SystemProperties.get("persist.sys.strictmode.visual"))) {
            return 0;
        }
        return SystemProperties.getBoolean("persist.sys.strictmode.visual", false) ? 1 : 2;
    }

    private void disableForUser(Preference preference) {
        if (preference != null) {
            preference.setEnabled(false);
            this.mDisabledPrefs.add(preference);
        }
    }

    private static void setPermissionEnforced(Context context, String str, boolean z) {
        try {
            ActivityThread.getPackageManager().setPermissionEnforced("android.permission.READ_EXTERNAL_STORAGE", z);
        } catch (RemoteException e) {
            throw new RuntimeException("Problem talking with PackageManager", e);
        }
    }

    private void updateAnimationScaleOptions() {
        updateAnimationScaleValue(0, this.mWindowAnimationScale);
        updateAnimationScaleValue(1, this.mTransitionAnimationScale);
        updateAnimationScaleValue(2, this.mAnimatorDurationScale);
    }

    private void updateVerifyAppsOverUsbOptions() {
        boolean z = true;
        CheckBoxPreference checkBoxPreference = this.mVerifyAppsOverUsb;
        if (Global.getInt(getActivity().getContentResolver(), "verifier_verify_adb_installs", 1) == 0) {
            z = false;
        }
        updateCheckBox(checkBoxPreference, z);
        this.mVerifyAppsOverUsb.setEnabled(enableVerifierSetting());
    }

    private void writeDebugLayoutOptions() {
        SystemProperties.set("debug.layout", this.mDebugLayout.isChecked() ? "true" : "false");
        pokeSystemProperties();
    }

    private void writeHardwareUiOptions() {
        SystemProperties.set("persist.sys.ui.hw", this.mForceHardwareUi.isChecked() ? "true" : "false");
        pokeSystemProperties();
    }

    private void writeMsaaOptions() {
        SystemProperties.set("debug.egl.force_msaa", this.mForceMsaa.isChecked() ? "true" : "false");
        pokeSystemProperties();
    }

    private void writeShowHwLayersUpdatesOptions() {
        SystemProperties.set("debug.hwui.show_layers_updates", this.mShowHwLayersUpdates.isChecked() ? "true" : null);
        pokeSystemProperties();
    }

    private void writeShowHwOverdrawOptions() {
        SystemProperties.set("debug.hwui.show_overdraw", this.mShowHwOverdraw.isChecked() ? "true" : null);
        pokeSystemProperties();
    }

    private void writeShowHwScreenUpdatesOptions() {
        SystemProperties.set("debug.hwui.show_dirty_regions", this.mShowHwScreenUpdates.isChecked() ? "true" : null);
        pokeSystemProperties();
    }

    private void writeStrictModeVisualOptions() {
        try {
            this.mWindowManager.setStrictModeVisualIndicatorPreference(this.mStrictMode.isChecked() ? "1" : "");
        } catch (RemoteException e) {
        }
    }

    private static boolean isPermissionEnforced(String str) {
        try {
            return ActivityThread.getPackageManager().isPermissionEnforced(str);
        } catch (RemoteException e) {
            throw new RuntimeException("Problem talking with PackageManager", e);
        }
    }

    private static void resetDebuggerOptions() {
        try {
            ActivityManagerNative.getDefault().setDebugApp(null, false, true);
        } catch (RemoteException e) {
        }
    }

    private void updateExperimentalWebViewOptions() {
        if (this.mExperimentalWebView != null) {
            updateCheckBox(this.mExperimentalWebView, SystemProperties.getBoolean("persist.sys.webview.exp", false));
        }
    }

    private void updateStrictModeVisualOptions() {
        boolean z = true;
        CheckBoxPreference checkBoxPreference = this.mStrictMode;
        if (currentStrictModeActiveIndex() != 1) {
            z = false;
        }
        updateCheckBox(checkBoxPreference, z);
    }

    private void writeDebuggerOptions() {
        try {
            ActivityManagerNative.getDefault().setDebugApp(this.mDebugApp, this.mWaitForDebugger.isChecked(), true);
        } catch (RemoteException e) {
        }
    }

    private void writeImmediatelyDestroyActivitiesOptions() {
        try {
            ActivityManagerNative.getDefault().setAlwaysFinish(this.mImmediatelyDestroyActivities.isChecked());
        } catch (RemoteException e) {
        }
    }

    private void writeOverlayDisplayDevicesOptions(Object obj) {
        Global.putString(getActivity().getContentResolver(), "overlay_display_devices", (String) obj);
        updateOverlayDisplayDevicesOptions();
    }

    private void writePointerLocationOptions() {
        Secure.putInt(getActivity().getContentResolver(), "pointer_location", this.mPointerLocation.isChecked() ? 1 : 0);
    }

    private void writeShowAllANRsOptions() {
        Secure.putInt(getActivity().getContentResolver(), "anr_show_background", this.mShowAllANRs.isChecked() ? 1 : 0);
    }

    private void writeShowTouchesOptions() {
        Secure.putInt(getActivity().getContentResolver(), "show_touches", this.mShowTouches.isChecked() ? 1 : 0);
    }

    private void writeVerifyAppsOverUsbOptions() {
        Secure.putInt(getActivity().getContentResolver(), "verifier_verify_adb_installs", this.mVerifyAppsOverUsb.isChecked() ? 1 : 0);
    }

    public void onDestroy() {
        dismissDialogs();
        super.onDestroy();
    }

    void pokeSystemProperties() {
        if (!this.mDontPokeProperties) {
            new SystemPropPoker().execute(new Void[0]);
        }
    }

    void updateCheckBox(CheckBoxPreference checkBoxPreference, boolean z) {
        checkBoxPreference.setChecked(z);
        this.mHaveDebugSettings |= z;
    }

    private void updateCpuUsageOptions() {
        boolean z = false;
        CheckBoxPreference checkBoxPreference = this.mShowCpuUsage;
        if (Global.getInt(getActivity().getContentResolver(), "show_processes", 0) != 0) {
            z = true;
        }
        updateCheckBox(checkBoxPreference, z);
    }

    private void updateDebugLayoutOptions() {
        updateCheckBox(this.mDebugLayout, SystemProperties.getBoolean("debug.layout", false));
    }

    private void updateHardwareUiOptions() {
        updateCheckBox(this.mForceHardwareUi, SystemProperties.getBoolean("persist.sys.ui.hw", false));
    }

    private void updateImmediatelyDestroyActivitiesOptions() {
        boolean z = false;
        CheckBoxPreference checkBoxPreference = this.mImmediatelyDestroyActivities;
        if (Global.getInt(getActivity().getContentResolver(), "always_finish_activities", 0) != 0) {
            z = true;
        }
        updateCheckBox(checkBoxPreference, z);
    }

    private void updateMsaaOptions() {
        updateCheckBox(this.mForceMsaa, SystemProperties.getBoolean("debug.egl.force_msaa", false));
    }

    private void updatePointerLocationOptions() {
        boolean z = false;
        CheckBoxPreference checkBoxPreference = this.mPointerLocation;
        if (Global.getInt(getActivity().getContentResolver(), "pointer_location", 0) != 0) {
            z = true;
        }
        updateCheckBox(checkBoxPreference, z);
    }

    private void updateShowAllANRsOptions() {
        boolean z = false;
        CheckBoxPreference checkBoxPreference = this.mShowAllANRs;
        if (Global.getInt(getActivity().getContentResolver(), "anr_show_background", 0) != 0) {
            z = true;
        }
        updateCheckBox(checkBoxPreference, z);
    }

    private void updateShowHwLayersUpdatesOptions() {
        updateCheckBox(this.mShowHwLayersUpdates, SystemProperties.getBoolean("debug.hwui.show_layers_updates", false));
    }

    private void updateShowHwOverdrawOptions() {
        updateCheckBox(this.mShowHwOverdraw, SystemProperties.getBoolean("debug.hwui.show_overdraw", false));
    }

    private void updateShowHwScreenUpdatesOptions() {
        updateCheckBox(this.mShowHwScreenUpdates, SystemProperties.getBoolean("debug.hwui.show_dirty_regions", false));
    }

    private void updateShowTouchesOptions() {
        boolean z = false;
        CheckBoxPreference checkBoxPreference = this.mShowTouches;
        if (Global.getInt(getActivity().getContentResolver(), "show_touches", 0) != 0) {
            z = true;
        }
        updateCheckBox(checkBoxPreference, z);
    }

    private boolean showVerifierSetting() {
        return Global.getInt(getActivity().getContentResolver(), "verifier_setting_visible", 1) > 0;
    }
}