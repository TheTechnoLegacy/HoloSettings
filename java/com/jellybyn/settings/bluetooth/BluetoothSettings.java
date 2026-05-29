package com.jellybyn.settings.bluetooth;

public final class BluetoothSettings extends com.jellybyn.settings.bluetooth.DeviceListPreferenceFragment {
    private boolean mActivityStarted;
    private android.preference.PreferenceGroup mAvailableDevicesCategory;
    private boolean mAvailableDevicesCategoryIsPresent;
    private final android.view.View.OnClickListener mDeviceProfilesListener;
    private com.jellybyn.settings.bluetooth.BluetoothDiscoverableEnabler mDiscoverableEnabler;
    private android.widget.TextView mEmptyView;
    private final android.content.IntentFilter mIntentFilter;
    android.preference.Preference mMyDevicePreference;
    private android.preference.PreferenceGroup mPairedDevicesCategory;
    private final android.content.BroadcastReceiver mReceiver;
    private android.os.UserManager mUserManager;

    public BluetoothSettings() {
        r2 = this;
        r2.<init>();
        r0 = new com.jellybyn.settings.bluetooth.BluetoothSettings$1;
        r0.<init>(r2);
        r2.mReceiver = r0;
        r0 = new com.jellybyn.settings.bluetooth.BluetoothSettings$2;
        r0.<init>(r2);
        r2.mDeviceProfilesListener = r0;
        r0 = new android.content.IntentFilter;
        r1 = "android.bluetooth.adapter.action.LOCAL_NAME_CHANGED";
        r0.<init>(r1);
        r2.mIntentFilter = r0;
        return;
    }

    static /* synthetic */ android.os.UserManager access$000(com.jellybyn.settings.bluetooth.BluetoothSettings r1) {
        r0 = r1.mUserManager;
        return r0;
    }

    private void addDeviceCategory(android.preference.PreferenceGroup r2, int r3, com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.Filter r4) {
        r1 = this;
        r2.setTitle(r3);
        r0 = r1.getPreferenceScreen();
        r0.addPreference(r2);
        r1.setFilter(r4);
        r1.setDeviceListGroup(r2);
        r1.addCachedDevices();
        r0 = 1;
        r2.setEnabled(r0);
        return;
    }

    private void startScanning() {
        r2 = this;
        r0 = r2.mUserManager;
        r1 = "no_config_bluetooth";
        r0 = r0.hasUserRestriction(r1);
        if (r0 == 0) goto L_0x000b;
    L_0x000a:
        return;
    L_0x000b:
        r0 = r2.mAvailableDevicesCategoryIsPresent;
        if (r0 != 0) goto L_0x0018;
    L_0x000f:
        r0 = r2.getPreferenceScreen();
        r1 = r2.mAvailableDevicesCategory;
        r0.addPreference(r1);
    L_0x0018:
        r0 = r2.mLocalAdapter;
        r1 = 1;
        r0.startScanning(r1);
        goto L_0x000a;
    }

    private void updateContent(int r11, boolean r12) {
        r10 = this;
        r9 = 0;
        r8 = 1;
        r3 = r10.getPreferenceScreen();
        r0 = 0;
        switch(r11) {
            case 10: goto L_0x0132;
            case 11: goto L_0x0137;
            case 12: goto L_0x001d;
            case 13: goto L_0x012d;
            default: goto L_0x000a;
        };
    L_0x000a:
        r10.setDeviceListGroup(r3);
        r10.removeAllDevices();
        r4 = r10.mEmptyView;
        r4.setText(r0);
        r4 = r10.getActivity();
        r4.invalidateOptionsMenu();
    L_0x001c:
        return;
    L_0x001d:
        r3.removeAll();
        r3.setOrderingAsAdded(r8);
        r4 = r10.mDevicePreferenceMap;
        r4.clear();
        r4 = r10.mMyDevicePreference;
        if (r4 != 0) goto L_0x0037;
    L_0x002c:
        r4 = new android.preference.Preference;
        r5 = r10.getActivity();
        r4.<init>(r5);
        r10.mMyDevicePreference = r4;
    L_0x0037:
        r4 = r10.mMyDevicePreference;
        r5 = r10.mLocalAdapter;
        r5 = r5.getName();
        r4.setTitle(r5);
        r4 = r10.getResources();
        r5 = 17891378; // 0x1110032 float:2.6632434E-38 double:8.839515E-317;
        r4 = r4.getBoolean(r5);
        if (r4 == 0) goto L_0x0109;
    L_0x004f:
        r4 = r10.mMyDevicePreference;
        r5 = 2130837569; // 0x7f020041 float:1.7280096E38 double:1.0527736397E-314;
        r4.setIcon(r5);
    L_0x0057:
        r4 = r10.mMyDevicePreference;
        r4.setPersistent(r9);
        r4 = r10.mMyDevicePreference;
        r4.setEnabled(r8);
        r4 = r10.mMyDevicePreference;
        r3.addPreference(r4);
        r4 = r10.mUserManager;
        r5 = "no_config_bluetooth";
        r4 = r4.hasUserRestriction(r5);
        if (r4 != 0) goto L_0x0095;
    L_0x0070:
        r4 = r10.mDiscoverableEnabler;
        if (r4 != 0) goto L_0x0095;
    L_0x0074:
        r4 = new com.jellybyn.settings.bluetooth.BluetoothDiscoverableEnabler;
        r5 = r10.getActivity();
        r6 = r10.mLocalAdapter;
        r7 = r10.mMyDevicePreference;
        r4.<init>(r5, r6, r7);
        r10.mDiscoverableEnabler = r4;
        r4 = r10.mDiscoverableEnabler;
        r4.resume();
        r4 = r10.getActivity();
        r4 = com.jellybyn.settings.bluetooth.LocalBluetoothManager.getInstance(r4);
        r5 = r10.mDiscoverableEnabler;
        r4.setDiscoverableEnabler(r5);
    L_0x0095:
        r4 = r10.mPairedDevicesCategory;
        if (r4 != 0) goto L_0x0113;
    L_0x0099:
        r4 = new android.preference.PreferenceCategory;
        r5 = r10.getActivity();
        r4.<init>(r5);
        r10.mPairedDevicesCategory = r4;
    L_0x00a4:
        r4 = r10.mPairedDevicesCategory;
        r5 = 2131427721; // 0x7f0b0189 float:1.8477066E38 double:1.0530652135E-314;
        r6 = com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.BONDED_DEVICE_FILTER;
        r10.addDeviceCategory(r4, r5, r6);
        r4 = r10.mPairedDevicesCategory;
        r2 = r4.getPreferenceCount();
        r4 = r10.mDiscoverableEnabler;
        if (r4 == 0) goto L_0x00bd;
    L_0x00b8:
        r4 = r10.mDiscoverableEnabler;
        r4.setNumberOfPairedDevices(r2);
    L_0x00bd:
        r4 = r10.mAvailableDevicesCategory;
        if (r4 != 0) goto L_0x0119;
    L_0x00c1:
        r4 = new com.jellybyn.settings.bluetooth.BluetoothProgressCategory;
        r5 = r10.getActivity();
        r6 = 0;
        r4.<init>(r5, r6);
        r10.mAvailableDevicesCategory = r4;
    L_0x00cd:
        r4 = r10.mUserManager;
        r5 = "no_config_bluetooth";
        r4 = r4.hasUserRestriction(r5);
        if (r4 != 0) goto L_0x00e1;
    L_0x00d7:
        r4 = r10.mAvailableDevicesCategory;
        r5 = 2131427722; // 0x7f0b018a float:1.8477068E38 double:1.053065214E-314;
        r6 = com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.UNBONDED_DEVICE_FILTER;
        r10.addDeviceCategory(r4, r5, r6);
    L_0x00e1:
        r4 = r10.mAvailableDevicesCategory;
        r1 = r4.getPreferenceCount();
        r10.mAvailableDevicesCategoryIsPresent = r8;
        if (r1 != 0) goto L_0x00f2;
    L_0x00eb:
        r4 = r10.mAvailableDevicesCategory;
        r3.removePreference(r4);
        r10.mAvailableDevicesCategoryIsPresent = r9;
    L_0x00f2:
        if (r2 != 0) goto L_0x0100;
    L_0x00f4:
        r4 = r10.mPairedDevicesCategory;
        r3.removePreference(r4);
        if (r12 != r8) goto L_0x011f;
    L_0x00fb:
        r10.mActivityStarted = r9;
        r10.startScanning();
    L_0x0100:
        r4 = r10.getActivity();
        r4.invalidateOptionsMenu();
        goto L_0x001c;
    L_0x0109:
        r4 = r10.mMyDevicePreference;
        r5 = 2130837575; // 0x7f020047 float:1.7280108E38 double:1.0527736427E-314;
        r4.setIcon(r5);
        goto L_0x0057;
    L_0x0113:
        r4 = r10.mPairedDevicesCategory;
        r4.removeAll();
        goto L_0x00a4;
    L_0x0119:
        r4 = r10.mAvailableDevicesCategory;
        r4.removeAll();
        goto L_0x00cd;
    L_0x011f:
        r4 = r10.mAvailableDevicesCategoryIsPresent;
        if (r4 != 0) goto L_0x0100;
    L_0x0123:
        r4 = r10.getPreferenceScreen();
        r5 = r10.mAvailableDevicesCategory;
        r4.addPreference(r5);
        goto L_0x0100;
    L_0x012d:
        r0 = 2131427465; // 0x7f0b0089 float:1.8476547E38 double:1.053065087E-314;
        goto L_0x000a;
    L_0x0132:
        r0 = 2131427731; // 0x7f0b0193 float:1.8477087E38 double:1.0530652185E-314;
        goto L_0x000a;
    L_0x0137:
        r0 = 2131427464; // 0x7f0b0088 float:1.8476545E38 double:1.0530650866E-314;
        goto L_0x000a;
    }

    void addPreferencesForActivity() {
        r9 = this;
        r8 = 16;
        r7 = -2;
        r6 = 0;
        r4 = 2131034121; // 0x7f050009 float:1.767875E38 double:1.0528707493E-314;
        r9.addPreferencesFromResource(r4);
        r1 = r9.getActivity();
        r0 = new android.widget.Switch;
        r0.<init>(r1);
        r4 = r1 instanceof android.preference.PreferenceActivity;
        if (r4 == 0) goto L_0x004a;
    L_0x0017:
        r3 = r1;
        r3 = (android.preference.PreferenceActivity) r3;
        r4 = r3.onIsHidingHeaders();
        if (r4 != 0) goto L_0x0026;
    L_0x0020:
        r4 = r3.onIsMultiPane();
        if (r4 != 0) goto L_0x004a;
    L_0x0026:
        r4 = r1.getResources();
        r5 = 2131558402; // 0x7f0d0002 float:1.8742119E38 double:1.0531297785E-314;
        r2 = r4.getDimensionPixelSize(r5);
        r0.setPaddingRelative(r6, r6, r2, r6);
        r4 = r1.getActionBar();
        r4.setDisplayOptions(r8, r8);
        r4 = r1.getActionBar();
        r5 = new android.app.ActionBar$LayoutParams;
        r6 = 8388629; // 0x800015 float:1.1754973E-38 double:4.1445334E-317;
        r5.<init>(r7, r7, r6);
        r4.setCustomView(r0, r5);
    L_0x004a:
        r4 = 1;
        r9.setHasOptionsMenu(r4);
        return;
    }

    protected int getHelpResource() {
        r1 = this;
        r0 = 2131429115; // 0x7f0b06fb float:1.8479894E38 double:1.0530659023E-314;
        return r0;
    }

    void initDevicePreference(com.jellybyn.settings.bluetooth.BluetoothDevicePreference r4) {
        r3 = this;
        r0 = r4.getCachedDevice();
        r1 = r0.getBondState();
        r2 = 12;
        if (r1 != r2) goto L_0x0011;
    L_0x000c:
        r1 = r3.mDeviceProfilesListener;
        r4.setOnSettingsClickListener(r1);
    L_0x0011:
        return;
    }

    public void onActivityCreated(android.os.Bundle r3) {
        r2 = this;
        super.onActivityCreated(r3);
        r0 = "user";
        r0 = r2.getSystemService(r0);
        r0 = (android.os.UserManager) r0;
        r2.mUserManager = r0;
        if (r3 != 0) goto L_0x002b;
    L_0x000f:
        r0 = 1;
    L_0x0010:
        r2.mActivityStarted = r0;
        r0 = r2.getView();
        r1 = 16908292; // 0x1020004 float:2.387724E-38 double:8.353806E-317;
        r0 = r0.findViewById(r1);
        r0 = (android.widget.TextView) r0;
        r2.mEmptyView = r0;
        r0 = r2.getListView();
        r1 = r2.mEmptyView;
        r0.setEmptyView(r1);
        return;
    L_0x002b:
        r0 = 0;
        goto L_0x0010;
    }

    public void onBluetoothStateChanged(int r2) {
        r1 = this;
        super.onBluetoothStateChanged(r2);
        r0 = 1;
        r1.updateContent(r2, r0);
        return;
    }

    public void onCreateOptionsMenu(android.view.Menu r8, android.view.MenuInflater r9) {
        r7 = this;
        r3 = 1;
        r4 = 0;
        r5 = r7.mLocalAdapter;
        if (r5 != 0) goto L_0x0007;
    L_0x0006:
        return;
    L_0x0007:
        r5 = r7.mUserManager;
        r6 = "no_config_bluetooth";
        r5 = r5.hasUserRestriction(r6);
        if (r5 != 0) goto L_0x0006;
    L_0x0011:
        r5 = r7.mLocalAdapter;
        r5 = r5.getBluetoothState();
        r6 = 12;
        if (r5 != r6) goto L_0x0064;
    L_0x001b:
        r0 = r3;
    L_0x001c:
        r5 = r7.mLocalAdapter;
        r1 = r5.isDiscovering();
        if (r1 == 0) goto L_0x0066;
    L_0x0024:
        r2 = 2131427719; // 0x7f0b0187 float:1.8477062E38 double:1.0530652126E-314;
    L_0x0027:
        r6 = r8.add(r4, r3, r4, r2);
        if (r0 == 0) goto L_0x006a;
    L_0x002d:
        if (r1 != 0) goto L_0x006a;
    L_0x002f:
        r5 = r3;
    L_0x0030:
        r5 = r6.setEnabled(r5);
        r5.setShowAsAction(r3);
        r3 = 2;
        r5 = 2131427435; // 0x7f0b006b float:1.8476486E38 double:1.053065072E-314;
        r3 = r8.add(r4, r3, r4, r5);
        r3 = r3.setEnabled(r0);
        r3.setShowAsAction(r4);
        r3 = 3;
        r5 = 2131427426; // 0x7f0b0062 float:1.8476468E38 double:1.053065068E-314;
        r3 = r8.add(r4, r3, r4, r5);
        r3 = r3.setEnabled(r0);
        r3.setShowAsAction(r4);
        r3 = 4;
        r5 = 2131427456; // 0x7f0b0080 float:1.8476529E38 double:1.0530650826E-314;
        r3 = r8.add(r4, r3, r4, r5);
        r3.setShowAsAction(r4);
        super.onCreateOptionsMenu(r8, r9);
        goto L_0x0006;
    L_0x0064:
        r0 = r4;
        goto L_0x001c;
    L_0x0066:
        r2 = 2131427718; // 0x7f0b0186 float:1.847706E38 double:1.053065212E-314;
        goto L_0x0027;
    L_0x006a:
        r5 = r4;
        goto L_0x0030;
    }

    public void onDeviceBondStateChanged(com.jellybyn.settings.bluetooth.CachedBluetoothDevice r3, int r4) {
        r2 = this;
        r0 = r2.getPreferenceScreen();
        r2.setDeviceListGroup(r0);
        r2.removeAllDevices();
        r0 = r2.mLocalAdapter;
        r0 = r0.getBluetoothState();
        r1 = 0;
        r2.updateContent(r0, r1);
        return;
    }

    void onDevicePreferenceClick(com.jellybyn.settings.bluetooth.BluetoothDevicePreference r2) {
        r1 = this;
        r0 = r1.mLocalAdapter;
        r0.stopScanning();
        super.onDevicePreferenceClick(r2);
        return;
    }

    public boolean onOptionsItemSelected(android.view.MenuItem r6) {
        r5 = this;
        r1 = 1;
        r2 = r6.getItemId();
        switch(r2) {
            case 1: goto L_0x000d;
            case 2: goto L_0x001b;
            case 3: goto L_0x002a;
            case 4: goto L_0x0039;
            default: goto L_0x0008;
        };
    L_0x0008:
        r1 = super.onOptionsItemSelected(r6);
    L_0x000c:
        return r1;
    L_0x000d:
        r2 = r5.mLocalAdapter;
        r2 = r2.getBluetoothState();
        r3 = 12;
        if (r2 != r3) goto L_0x000c;
    L_0x0017:
        r5.startScanning();
        goto L_0x000c;
    L_0x001b:
        r2 = new com.jellybyn.settings.bluetooth.BluetoothNameDialogFragment;
        r2.<init>();
        r3 = r5.getFragmentManager();
        r4 = "rename device";
        r2.show(r3, r4);
        goto L_0x000c;
    L_0x002a:
        r2 = new com.jellybyn.settings.bluetooth.BluetoothVisibilityTimeoutFragment;
        r2.<init>();
        r3 = r5.getFragmentManager();
        r4 = "visibility timeout";
        r2.show(r3, r4);
        goto L_0x000c;
    L_0x0039:
        r0 = new android.content.Intent;
        r2 = "android.btopp.intent.action.OPEN_RECEIVED_FILES";
        r0.<init>(r2);
        r2 = r5.getActivity();
        r2.sendBroadcast(r0);
        goto L_0x000c;
    }

    public void onPause() {
        r2 = this;
        super.onPause();
        if (r0 == 0) goto L_0x0005;
    L_0x0005:
        r0 = r2.getActivity();
        r1 = r2.mReceiver;
        r0.unregisterReceiver(r1);
        r0 = r2.mDiscoverableEnabler;
        if (r0 == 0) goto L_0x0017;
    L_0x0012:
        r0 = r2.mDiscoverableEnabler;
        r0.pause();
    L_0x0017:
        return;
    }

    public void onResume() {
        r3 = this;
        if (r0 == 0) goto L_0x0002;
    L_0x0002:
        super.onResume();
        r0 = r3.mDiscoverableEnabler;
        if (r0 == 0) goto L_0x000e;
    L_0x0009:
        r0 = r3.mDiscoverableEnabler;
        r0.resume();
    L_0x000e:
        r0 = r3.getActivity();
        r1 = r3.mReceiver;
        r2 = r3.mIntentFilter;
        r0.registerReceiver(r1, r2);
        r0 = r3.mLocalAdapter;
        if (r0 == 0) goto L_0x0028;
    L_0x001d:
        r0 = r3.mLocalAdapter;
        r0 = r0.getBluetoothState();
        r1 = r3.mActivityStarted;
        r3.updateContent(r0, r1);
    L_0x0028:
        return;
    }

    public void onScanningStateChanged(boolean r2) {
        r1 = this;
        super.onScanningStateChanged(r2);
        r0 = r1.getActivity();
        r0.invalidateOptionsMenu();
        return;
    }
}