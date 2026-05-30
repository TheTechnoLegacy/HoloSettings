package com.jellybyn.settings;

public class DisplaySettings extends com.jellybyn.settings.SettingsPreferenceFragment implements android.preference.Preference.OnPreferenceChangeListener, android.preference.Preference.OnPreferenceClickListener {
    private android.preference.CheckBoxPreference mAccelerometer;
    private final android.content.res.Configuration mCurConfig;
    private android.hardware.display.DisplayManager mDisplayManager;
    private com.jellybyn.settings.WarnedListPreference mFontSizePref;
    private android.preference.CheckBoxPreference mNotificationPulse;
    private final android.content.BroadcastReceiver mReceiver;
    private final com.android.internal.view.RotationPolicy.RotationPolicyListener mRotationPolicyListener;
    private android.preference.Preference mScreenSaverPreference;
    private android.preference.ListPreference mScreenTimeoutPreference;
    private android.preference.Preference mWifiDisplayPreference;
    private android.hardware.display.WifiDisplayStatus mWifiDisplayStatus;

    public DisplaySettings() {
        r1 = this;
        r1.<init>();
        r0 = new android.content.res.Configuration;
        r0.<init>();
        r1.mCurConfig = r0;
        r0 = new com.jellybyn.settings.DisplaySettings$1;
        r0.<init>(r1);
        r1.mRotationPolicyListener = r0;
        r0 = new com.jellybyn.settings.DisplaySettings$3;
        r0.<init>(r1);
        r1.mReceiver = r0;
        return;
    }

    static /* synthetic */ void access$000(com.jellybyn.settings.DisplaySettings r0) {
        r0.updateAccelerometerRotationCheckbox();
        return;
    }

    static /* synthetic */ com.jellybyn.settings.WarnedListPreference access$100(com.jellybyn.settings.DisplaySettings r1) {
        r0 = r1.mFontSizePref;
        return r0;
    }

    static /* synthetic */ android.hardware.display.WifiDisplayStatus access$202(com.jellybyn.settings.DisplaySettings r0, android.hardware.display.WifiDisplayStatus r1) {
        r0.mWifiDisplayStatus = r1;
        return r1;
    }

    static /* synthetic */ void access$300(com.jellybyn.settings.DisplaySettings r0) {
        r0.updateWifiDisplaySummary();
        return;
    }

    private void disableUnusableTimeouts(android.preference.ListPreference r14) {
        r13 = this;
        r11 = r13.getActivity();
        r12 = "device_policy";
        r0 = r11.getSystemService(r12);
        r0 = (android.app.admin.DevicePolicyManager) r0;
        if (r0 == 0) goto L_0x001a;
    L_0x000e:
        r11 = 0;
        r3 = r0.getMaximumTimeToLock(r11);
    L_0x0013:
        r11 = 0;
        r11 = (r3 > r11 ? 1 : (r3 == r11 ? 0 : -1));
        if (r11 != 0) goto L_0x001d;
    L_0x0019:
        return;
    L_0x001a:
        r3 = 0;
        goto L_0x0013;
    L_0x001d:
        r1 = r14.getEntries();
        r10 = r14.getEntryValues();
        r5 = new java.util.ArrayList;
        r5.<init>();
        r6 = new java.util.ArrayList;
        r6.<init>();
        r2 = 0;
    L_0x0030:
        r11 = r10.length;
        if (r2 >= r11) goto L_0x004e;
    L_0x0033:
        r11 = r10[r2];
        r11 = r11.toString();
        r7 = java.lang.Long.parseLong(r11);
        r11 = (r7 > r3 ? 1 : (r7 == r3 ? 0 : -1));
        if (r11 > 0) goto L_0x004b;
    L_0x0041:
        r11 = r1[r2];
        r5.add(r11);
        r11 = r10[r2];
        r6.add(r11);
    L_0x004b:
        r2 = r2 + 1;
        goto L_0x0030;
    L_0x004e:
        r11 = r5.size();
        r12 = r1.length;
        if (r11 != r12) goto L_0x005c;
    L_0x0055:
        r11 = r6.size();
        r12 = r10.length;
        if (r11 == r12) goto L_0x008e;
    L_0x005c:
        r11 = r5.size();
        r11 = new java.lang.CharSequence[r11];
        r11 = r5.toArray(r11);
        r11 = (java.lang.CharSequence[]) r11;
        r14.setEntries(r11);
        r11 = r6.size();
        r11 = new java.lang.CharSequence[r11];
        r11 = r6.toArray(r11);
        r11 = (java.lang.CharSequence[]) r11;
        r14.setEntryValues(r11);
        r11 = r14.getValue();
        r9 = java.lang.Integer.parseInt(r11);
        r11 = (long) r9;
        r11 = (r11 > r3 ? 1 : (r11 == r3 ? 0 : -1));
        if (r11 > 0) goto L_0x008e;
    L_0x0087:
        r11 = java.lang.String.valueOf(r9);
        r14.setValue(r11);
    L_0x008e:
        r11 = r5.size();
        if (r11 <= 0) goto L_0x0099;
    L_0x0094:
        r11 = 1;
    L_0x0095:
        r14.setEnabled(r11);
        goto L_0x0019;
    L_0x0099:
        r11 = 0;
        goto L_0x0095;
    }

    private void updateAccelerometerRotationCheckbox() {
        r2 = this;
        r0 = r2.getActivity();
        if (r0 != 0) goto L_0x0007;
    L_0x0006:
        return;
    L_0x0007:
        r1 = r2.mAccelerometer;
        r0 = 0;
        if (r0 != 0) goto L_0x0011;
    L_0x000c:
        r0 = 1;
    L_0x000d:
        r1.setChecked(r0);
        goto L_0x0006;
    L_0x0011:
        r0 = 0;
        goto L_0x000d;
    }

    private void updateScreenSaverSummary() {
        r2 = this;
        return;
        r0 = r2.mScreenSaverPreference;
        if (r0 == 0) goto L_0x0012;
    L_0x0005:
        r0 = r2.mScreenSaverPreference;
        r1 = r2.getActivity();
        r1 = com.jellybyn.settings.DreamSettings.getSummaryTextWithDreamName(r1);
        r0.setSummary(r1);
    L_0x0012:
        return;
    }

    private void updateState() {
        r1 = this;
        r1.updateAccelerometerRotationCheckbox();
        r0 = r1.mFontSizePref;
        r1.readFontSizePreference(r0);
        r1.updateScreenSaverSummary();
        r1.updateWifiDisplaySummary();
        return;
    }

    private void updateTimeoutPreferenceDescription(long r14) {
        r13 = this;
        r3 = r13.mScreenTimeoutPreference;
        r8 = 0;
        r8 = (r14 > r8 ? 1 : (r14 == r8 ? 0 : -1));
        if (r8 >= 0) goto L_0x000e;
    L_0x0008:
        r4 = "";
    L_0x000a:
        r3.setSummary(r4);
        return;
    L_0x000e:
        r1 = r3.getEntries();
        r7 = r3.getEntryValues();
        if (r1 == 0) goto L_0x001b;
    L_0x0018:
        r8 = r1.length;
        if (r8 != 0) goto L_0x001e;
    L_0x001b:
        r4 = "";
        goto L_0x000a;
    L_0x001e:
        r0 = 0;
        r2 = 0;
    L_0x0020:
        r8 = r7.length;
        if (r2 >= r8) goto L_0x0035;
    L_0x0023:
        r8 = r7[r2];
        r8 = r8.toString();
        r5 = java.lang.Long.parseLong(r8);
        r8 = (r14 > r5 ? 1 : (r14 == r5 ? 0 : -1));
        if (r8 < 0) goto L_0x0032;
    L_0x0031:
        r0 = r2;
    L_0x0032:
        r2 = r2 + 1;
        goto L_0x0020;
    L_0x0035:
        r8 = r3.getContext();
        r9 = 2131428038; // 0x7f0b02c6 float:1.847771E38 double:1.05306537E-314;
        r10 = 1;
        r10 = new java.lang.Object[r10];
        r11 = 0;
        r12 = r1[r0];
        r10[r11] = r12;
        r4 = r8.getString(r9, r10);
        goto L_0x000a;
    }

    private void updateWifiDisplaySummary() {
        r2 = this;
        r0 = r2.mWifiDisplayPreference;
        if (r0 == 0) goto L_0x0015;
    L_0x0004:
        r0 = r2.mWifiDisplayStatus;
        r0 = r0.getFeatureState();
        switch(r0) {
            case 2: goto L_0x0016;
            case 3: goto L_0x001f;
            default: goto L_0x000d;
        };
    L_0x000d:
        r0 = r2.mWifiDisplayPreference;
        r1 = 2131427787; // 0x7f0b01cb float:1.84772E38 double:1.053065246E-314;
        r0.setSummary(r1);
    L_0x0015:
        return;
    L_0x0016:
        r0 = r2.mWifiDisplayPreference;
        r1 = 2131427786; // 0x7f0b01ca float:1.8477198E38 double:1.0530652457E-314;
        r0.setSummary(r1);
        goto L_0x0015;
    L_0x001f:
        r0 = r2.mWifiDisplayPreference;
        r1 = 2131427785; // 0x7f0b01c9 float:1.8477196E38 double:1.053065245E-314;
        r0.setSummary(r1);
        goto L_0x0015;
    }

    int floatToIndex(float r7) {
        r6 = this;
        r4 = r6.getResources();
        r5 = 2131165193; // 0x7f070009 float:1.7944596E38 double:1.0529355075E-314;
        r1 = r4.getStringArray(r5);
        r4 = 0;
        r4 = r1[r4];
        r2 = java.lang.Float.parseFloat(r4);
        r0 = 1;
    L_0x0013:
        r4 = r1.length;
        if (r0 >= r4) goto L_0x002d;
    L_0x0016:
        r4 = r1[r0];
        r3 = java.lang.Float.parseFloat(r4);
        r4 = r3 - r2;
        r5 = 1056964608; // 0x3f000000 float:0.5 double:5.222099017E-315;
        r4 = r4 * r5;
        r4 = r4 + r2;
        r4 = (r7 > r4 ? 1 : (r7 == r4 ? 0 : -1));
        if (r4 >= 0) goto L_0x0029;
    L_0x0026:
        r4 = r0 + -1;
    L_0x0028:
        return r4;
    L_0x0029:
        r2 = r3;
        r0 = r0 + 1;
        goto L_0x0013;
    L_0x002d:
        r4 = r1.length;
        r4 = r4 + -1;
        goto L_0x0028;
    }

    public void onCreate(android.os.Bundle r10) {
        r9 = this;
        r5 = 1;
        r6 = 0;
        super.onCreate(r10);
        r4 = r9.getActivity();
        r2 = r4.getContentResolver();
        r4 = 2131034129; // 0x7f050011 float:1.7678767E38 double:1.0528707533E-314;
        r9.addPreferencesFromResource(r4);
        r4 = "accelerometer";
        r4 = r9.findPreference(r4);
        r4 = (android.preference.CheckBoxPreference) r4;
        r9.mAccelerometer = r4;
        r4 = r9.mAccelerometer;
        r4.setPersistent(r6);
        r4 = 0;
        if (r4 == 0) goto L_0x002e;
    L_0x0025:
        r4 = r9.getPreferenceScreen();
        r7 = r9.mAccelerometer;
        r4.removePreference(r7);
    L_0x002e:
        r4 = "screensaver";
        r4 = r9.findPreference(r4);
        r9.mScreenSaverPreference = r4;
        r4 = r9.mScreenSaverPreference;
        if (r4 == 0) goto L_0x0050;
    L_0x003a:
        r4 = r9.getResources();
        r7 = 17891394; // 0x1110042 float:2.663248E-38 double:8.839523E-317;
        r4 = r4.getBoolean(r7);
        if (r4 != 0) goto L_0x0050;
    L_0x0047:
        r4 = r9.getPreferenceScreen();
        r7 = r9.mScreenSaverPreference;
        r4.removePreference(r7);
    L_0x0050:
        r4 = "screen_timeout";
        r4 = r9.findPreference(r4);
        r4 = (android.preference.ListPreference) r4;
        r9.mScreenTimeoutPreference = r4;
        r4 = "screen_off_timeout";
        r7 = 30000; // 0x7530 float:4.2039E-41 double:1.4822E-319;
        r0 = android.provider.Settings.System.getLong(r2, r4, r7);
        r4 = r9.mScreenTimeoutPreference;
        r7 = java.lang.String.valueOf(r0);
        r4.setValue(r7);
        r4 = r9.mScreenTimeoutPreference;
        r4.setOnPreferenceChangeListener(r9);
        r4 = r9.mScreenTimeoutPreference;
        r9.disableUnusableTimeouts(r4);
        r9.updateTimeoutPreferenceDescription(r0);
        r4 = "font_size";
        r4 = r9.findPreference(r4);
        r4 = (com.jellybyn.settings.WarnedListPreference) r4;
        r9.mFontSizePref = r4;
        r4 = r9.mFontSizePref;
        r4.setOnPreferenceChangeListener(r9);
        r4 = r9.mFontSizePref;
        r4.setOnPreferenceClickListener(r9);
        r4 = "notification_pulse";
        r4 = r9.findPreference(r4);
        r4 = (android.preference.CheckBoxPreference) r4;
        r9.mNotificationPulse = r4;
        r4 = r9.mNotificationPulse;
        if (r4 == 0) goto L_0x00e3;
    L_0x009a:
        r4 = r9.getResources();
        r7 = 17891363; // 0x1110023 float:2.6632392E-38 double:8.839508E-317;
        r4 = r4.getBoolean(r7);
        if (r4 != 0) goto L_0x00e3;
    L_0x00a7:
        r4 = r9.getPreferenceScreen();
        r5 = r9.mNotificationPulse;
        r4.removePreference(r5);
    L_0x00b0:
        r4 = r9.getActivity();
        r5 = "display";
        r4 = r4.getSystemService(r5);
        r4 = (android.hardware.display.DisplayManager) r4;
        r9.mDisplayManager = r4;
        r4 = r9.mDisplayManager;
        r4 = r4.getWifiDisplayStatus();
        r9.mWifiDisplayStatus = r4;
        r4 = "wifi_display";
        r4 = r9.findPreference(r4);
        r9.mWifiDisplayPreference = r4;
        r4 = r9.mWifiDisplayStatus;
        r4 = r4.getFeatureState();
        if (r4 != 0) goto L_0x00e2;
    L_0x00d6:
        r4 = r9.getPreferenceScreen();
        r5 = r9.mWifiDisplayPreference;
        r4.removePreference(r5);
        r4 = 0;
        r9.mWifiDisplayPreference = r4;
    L_0x00e2:
        return;
    L_0x00e3:
        r7 = r9.mNotificationPulse;	 Catch:{ SettingNotFoundException -> 0x00f7 }
        r4 = "notification_light_pulse";
        r4 = android.provider.Settings.System.getInt(r2, r4);	 Catch:{ SettingNotFoundException -> 0x00f7 }
        if (r4 != r5) goto L_0x0100;
    L_0x00ed:
        r4 = r5;
    L_0x00ee:
        r7.setChecked(r4);	 Catch:{ SettingNotFoundException -> 0x00f7 }
        r4 = r9.mNotificationPulse;	 Catch:{ SettingNotFoundException -> 0x00f7 }
        r4.setOnPreferenceChangeListener(r9);	 Catch:{ SettingNotFoundException -> 0x00f7 }
        goto L_0x00b0;
    L_0x00f7:
        r3 = move-exception;
        r4 = "DisplaySettings";
        r5 = "notification_light_pulse not found";
        android.util.Log.e(r4, r5);
        goto L_0x00b0;
    L_0x0100:
        r4 = r6;
        goto L_0x00ee;
    }

    public android.app.Dialog onCreateDialog(int r4) {
        r3 = this;
        r0 = 1;
        if (r4 != r0) goto L_0x0014;
    L_0x0003:
        r0 = r3.getActivity();
        r1 = 2131429111; // 0x7f0b06f7 float:1.8479885E38 double:1.0530659003E-314;
        r2 = new com.jellybyn.settings.DisplaySettings$2;
        r2.<init>(r3);
        r0 = com.jellybyn.settings.Utils.buildGlobalChangeWarningDialog(r0, r1, r2);
    L_0x0013:
        return r0;
    L_0x0014:
        r0 = 0;
        goto L_0x0013;
    }

    public void onPause() {
        r2 = this;
        super.onPause();
        r0 = r2.getActivity();
        r1 = r2.mRotationPolicyListener;
        com.android.internal.view.RotationPolicy.unregisterRotationPolicyListener(r0, r1);
        r0 = r2.mWifiDisplayPreference;
        if (r0 == 0) goto L_0x0019;
    L_0x0010:
        r0 = r2.getActivity();
        r1 = r2.mReceiver;
        r0.unregisterReceiver(r1);
    L_0x0019:
        return;
    }

    public boolean onPreferenceChange(android.preference.Preference r6, java.lang.Object r7) {
        r5 = this;
        r1 = r6.getKey();
        r3 = "screen_timeout";
        r3 = r3.equals(r1);
        if (r3 == 0) goto L_0x0020;
    L_0x000c:
        r3 = r7;
        r3 = (java.lang.String) r3;
        r2 = java.lang.Integer.parseInt(r3);
        r3 = r5.getContentResolver();	 Catch:{ NumberFormatException -> 0x002d }
        r4 = "screen_off_timeout";
        android.provider.Settings.System.putInt(r3, r4, r2);	 Catch:{ NumberFormatException -> 0x002d }
        r3 = (long) r2;	 Catch:{ NumberFormatException -> 0x002d }
        r5.updateTimeoutPreferenceDescription(r3);	 Catch:{ NumberFormatException -> 0x002d }
    L_0x0020:
        r3 = "font_size";
        r3 = r3.equals(r1);
        if (r3 == 0) goto L_0x002b;
    L_0x0028:
        r5.writeFontSizePreference(r7);
    L_0x002b:
        r3 = 1;
        return r3;
    L_0x002d:
        r0 = move-exception;
        r3 = "DisplaySettings";
        r4 = "could not persist screen timeout setting";
        android.util.Log.e(r3, r4, r0);
        goto L_0x0020;
    }

    public boolean onPreferenceClick(android.preference.Preference r3) {
        r2 = this;
        r0 = 1;
        r1 = r2.mFontSizePref;
        if (r3 != r1) goto L_0x0018;
    L_0x0005:
        r1 = r2.getActivity();
        r1 = com.jellybyn.settings.Utils.hasMultipleUsers(r1);
        if (r1 == 0) goto L_0x0013;
    L_0x000f:
        r2.showDialog(r0);
    L_0x0012:
        return r0;
    L_0x0013:
        r0 = r2.mFontSizePref;
        r0.click();
    L_0x0018:
        r0 = 0;
        goto L_0x0012;
    }

    public boolean onPreferenceTreeClick(android.preference.PreferenceScreen r6, android.preference.Preference r7) {
        r5 = this;
        r2 = 0;
        r1 = 1;
        r3 = r5.mAccelerometer;
        if (r7 != r3) goto L_0x001c;
    L_0x0006:
        r3 = r5.getActivity();
        r4 = r5.mAccelerometer;
        r4 = r4.isChecked();
        if (r4 != 0) goto L_0x001a;
    L_0x0012:
        com.android.internal.view.RotationPolicy.setRotationLockForAccessibility(r3, r1);
    L_0x0015:
        r1 = super.onPreferenceTreeClick(r6, r7);
    L_0x0019:
        return r1;
    L_0x001a:
        r1 = r2;
        goto L_0x0012;
    L_0x001c:
        r3 = r5.mNotificationPulse;
        if (r7 != r3) goto L_0x0015;
    L_0x0020:
        r3 = r5.mNotificationPulse;
        r0 = r3.isChecked();
        r3 = r5.getContentResolver();
        r4 = "notification_light_pulse";
        if (r0 == 0) goto L_0x002f;
    L_0x002e:
        r2 = r1;
    L_0x002f:
        android.provider.Settings.System.putInt(r3, r4, r2);
        goto L_0x0019;
    }

    public void onResume() {
        r4 = this;
        super.onResume();
        r0 = r4.getActivity();
        r1 = r4.mRotationPolicyListener;
        com.android.internal.view.RotationPolicy.registerRotationPolicyListener(r0, r1);
        r0 = r4.mWifiDisplayPreference;
        if (r0 == 0) goto L_0x0028;
    L_0x0010:
        r0 = r4.getActivity();
        r1 = r4.mReceiver;
        r2 = new android.content.IntentFilter;
        r3 = "android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED";
        r2.<init>(r3);
        r0.registerReceiver(r1, r2);
        r0 = r4.mDisplayManager;
        r0 = r0.getWifiDisplayStatus();
        r4.mWifiDisplayStatus = r0;
    L_0x0028:
        r4.updateState();
        return;
    }

    public void readFontSizePreference(android.preference.ListPreference r9) {
        r8 = this;
        r4 = r8.mCurConfig;	 Catch:{ RemoteException -> 0x003a }
        r5 = android.app.ActivityManagerNative.getDefault();	 Catch:{ RemoteException -> 0x003a }
        r5 = r5.getConfiguration();	 Catch:{ RemoteException -> 0x003a }
        r4.updateFrom(r5);	 Catch:{ RemoteException -> 0x003a }
    L_0x000d:
        r4 = r8.mCurConfig;
        r4 = r4.fontScale;
        r2 = r8.floatToIndex(r4);
        r9.setValueIndex(r2);
        r3 = r8.getResources();
        r4 = 2131165192; // 0x7f070008 float:1.7944594E38 double:1.052935507E-314;
        r1 = r3.getStringArray(r4);
        r4 = 2131428053; // 0x7f0b02d5 float:1.847774E38 double:1.0530653776E-314;
        r4 = r3.getString(r4);
        r5 = 1;
        r5 = new java.lang.Object[r5];
        r6 = 0;
        r7 = r1[r2];
        r5[r6] = r7;
        r4 = java.lang.String.format(r4, r5);
        r9.setSummary(r4);
        return;
    L_0x003a:
        r0 = move-exception;
        r4 = "DisplaySettings";
        r5 = "Unable to retrieve font size";
        android.util.Log.w(r4, r5);
        goto L_0x000d;
    }

    public void writeFontSizePreference(java.lang.Object r4) {
        r3 = this;
        r1 = r3.mCurConfig;	 Catch:{ RemoteException -> 0x0016 }
        r2 = r4.toString();	 Catch:{ RemoteException -> 0x0016 }
        r2 = java.lang.Float.parseFloat(r2);	 Catch:{ RemoteException -> 0x0016 }
        r1.fontScale = r2;	 Catch:{ RemoteException -> 0x0016 }
        r1 = android.app.ActivityManagerNative.getDefault();	 Catch:{ RemoteException -> 0x0016 }
        r2 = r3.mCurConfig;	 Catch:{ RemoteException -> 0x0016 }
        r1.updatePersistentConfiguration(r2);	 Catch:{ RemoteException -> 0x0016 }
    L_0x0015:
        return;
    L_0x0016:
        r0 = move-exception;
        r1 = "DisplaySettings";
        r2 = "Unable to save font size";
        android.util.Log.w(r1, r2);
        goto L_0x0015;
    }
}