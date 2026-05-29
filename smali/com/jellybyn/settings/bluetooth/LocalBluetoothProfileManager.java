package com.jellybyn.settings.bluetooth;

final class LocalBluetoothProfileManager {
    private com.jellybyn.settings.bluetooth.A2dpProfile mA2dpProfile;
    private final android.content.Context mContext;
    private final com.jellybyn.settings.bluetooth.CachedBluetoothDeviceManager mDeviceManager;
    private final com.jellybyn.settings.bluetooth.BluetoothEventManager mEventManager;
    private com.jellybyn.settings.bluetooth.HeadsetProfile mHeadsetProfile;
    private final com.jellybyn.settings.bluetooth.HidProfile mHidProfile;
    private final com.jellybyn.settings.bluetooth.LocalBluetoothAdapter mLocalAdapter;
    private com.jellybyn.settings.bluetooth.OppProfile mOppProfile;
    private final com.jellybyn.settings.bluetooth.PanProfile mPanProfile;
    private final com.jellybyn.settings.bluetooth.PbapServerProfile mPbapProfile;
    private final java.util.Map<java.lang.String, com.jellybyn.settings.bluetooth.LocalBluetoothProfile> mProfileNameMap;
    private final java.util.Collection<com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager.ServiceListener> mServiceListeners;

    LocalBluetoothProfileManager(android.content.Context r5, com.jellybyn.settings.bluetooth.LocalBluetoothAdapter r6, com.jellybyn.settings.bluetooth.CachedBluetoothDeviceManager r7, com.jellybyn.settings.bluetooth.BluetoothEventManager r8) {
        r4 = this;
        r4.<init>();
        r1 = new java.util.HashMap;
        r1.<init>();
        r4.mProfileNameMap = r1;
        r1 = new java.util.ArrayList;
        r1.<init>();
        r4.mServiceListeners = r1;
        r4.mContext = r5;
        r4.mLocalAdapter = r6;
        r4.mDeviceManager = r7;
        r4.mEventManager = r8;
        r1 = r4.mLocalAdapter;
        r1.setProfileManager(r4);
        r1 = r4.mEventManager;
        r1.setProfileManager(r4);
        r0 = r6.getUuids();
        if (r0 == 0) goto L_0x0029;
    L_0x0029:
        r1 = new com.jellybyn.settings.bluetooth.HidProfile;
        r2 = r4.mLocalAdapter;
        r3 = r4.mDeviceManager;
        r1.<init>(r5, r2, r3, r4);
        r4.mHidProfile = r1;
        r1 = r4.mHidProfile;
        r2 = "HID";
        r3 = "android.bluetooth.input.profile.action.CONNECTION_STATE_CHANGED";
        r4.addProfile(r1, r2, r3);
        r1 = new com.jellybyn.settings.bluetooth.PanProfile;
        r1.<init>(r5);
        r4.mPanProfile = r1;
        r1 = r4.mPanProfile;
        r2 = "PAN";
        r3 = "android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED";
        r4.addPanProfile(r1, r2, r3);
        r1 = new com.jellybyn.settings.bluetooth.PbapServerProfile;
        r1.<init>(r5);
        r4.mPbapProfile = r1;
        r1 = "LocalBluetoothProfileManager";
        r2 = "LocalBluetoothProfileManager construction complete";
        android.util.Log.d(r1, r2);
        return;
    }

    static /* synthetic */ com.jellybyn.settings.bluetooth.CachedBluetoothDeviceManager access$000(com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager r1) {
        r0 = r1.mDeviceManager;
        return r0;
    }

    static /* synthetic */ com.jellybyn.settings.bluetooth.LocalBluetoothAdapter access$100(com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager r1) {
        r0 = r1.mLocalAdapter;
        return r0;
    }

    private void addPanProfile(com.jellybyn.settings.bluetooth.LocalBluetoothProfile r3, java.lang.String r4, java.lang.String r5) {
        r2 = this;
        r0 = r2.mEventManager;
        r1 = new com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager$PanStateChangedHandler;
        r1.<init>(r2, r3);
        r0.addProfileHandler(r5, r1);
        r0 = r2.mProfileNameMap;
        r0.put(r4, r3);
        return;
    }

    private void addProfile(com.jellybyn.settings.bluetooth.LocalBluetoothProfile r3, java.lang.String r4, java.lang.String r5) {
        r2 = this;
        r0 = r2.mEventManager;
        r1 = new com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager$StateChangedHandler;
        r1.<init>(r2, r3);
        r0.addProfileHandler(r5, r1);
        r0 = r2.mProfileNameMap;
        r0.put(r4, r3);
        return;
    }

    void addServiceListener(com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager.ServiceListener r2) {
        r1 = this;
        r0 = r1.mServiceListeners;
        r0.add(r2);
        return;
    }

    void callServiceConnectedListeners() {
        r3 = this;
        r2 = r3.mServiceListeners;
        r0 = r2.iterator();
    L_0x0006:
        r2 = r0.hasNext();
        if (r2 == 0) goto L_0x0016;
    L_0x000c:
        r1 = r0.next();
        r1 = (com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager.ServiceListener) r1;
        r1.onServiceConnected();
        goto L_0x0006;
    L_0x0016:
        return;
    }

    void callServiceDisconnectedListeners() {
        r3 = this;
        r2 = r3.mServiceListeners;
        r0 = r2.iterator();
    L_0x0006:
        r2 = r0.hasNext();
        if (r2 == 0) goto L_0x0016;
    L_0x000c:
        r1 = r0.next();
        r1 = (com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager.ServiceListener) r1;
        r1.onServiceDisconnected();
        goto L_0x0006;
    L_0x0016:
        return;
    }

    com.jellybyn.settings.bluetooth.A2dpProfile getA2dpProfile() {
        r1 = this;
        r0 = r1.mA2dpProfile;
        return r0;
    }

    com.jellybyn.settings.bluetooth.HeadsetProfile getHeadsetProfile() {
        r1 = this;
        r0 = r1.mHeadsetProfile;
        return r0;
    }

    com.jellybyn.settings.bluetooth.PbapServerProfile getPbapProfile() {
        r1 = this;
        r0 = r1.mPbapProfile;
        return r0;
    }

    com.jellybyn.settings.bluetooth.LocalBluetoothProfile getProfileByName(java.lang.String r2) {
        r1 = this;
        r0 = r1.mProfileNameMap;
        r0 = r0.get(r2);
        r0 = (com.jellybyn.settings.bluetooth.LocalBluetoothProfile) r0;
        return r0;
    }

    public synchronized boolean isManagerReady() {
        r2 = this;
        monitor-enter(r2);
        r0 = r2.mHeadsetProfile;	 Catch:{ all -> 0x0016 }
        if (r0 == 0) goto L_0x000b;
    L_0x0005:
        r1 = r0.isProfileReady();	 Catch:{ all -> 0x0016 }
    L_0x0009:
        monitor-exit(r2);
        return r1;
    L_0x000b:
        r0 = r2.mA2dpProfile;
        if (r0 == 0) goto L_0x0014;
    L_0x000f:
        r1 = r0.isProfileReady();
        goto L_0x0009;
    L_0x0014:
        r1 = 0;
        goto L_0x0009;
    L_0x0016:
        r1 = move-exception;
        monitor-exit(r2);
        throw r1;
    }

    void removeServiceListener(com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager.ServiceListener r2) {
        r1 = this;
        r0 = r1.mServiceListeners;
        r0.remove(r2);
        return;
    }

    void setBluetoothStateOn() {
        r2 = this;
        r1 = r2.mLocalAdapter;
        r0 = r1.getUuids();
        if (r0 == 0) goto L_0x000b;
    L_0x0008:
        r2.updateLocalProfiles(r0);
    L_0x000b:
        r1 = r2.mEventManager;
        r1.readPairedDevices();
        return;
    }

    void updateLocalProfiles(android.os.ParcelUuid[] r5) {
        r4 = this;
        r0 = r4.mA2dpProfile;
        if (r0 != 0) goto L_0x0021;
    L_0x0004:
        r0 = "LocalBluetoothProfileManager";
        r1 = "Adding local A2DP profile";
        android.util.Log.d(r0, r1);
        r0 = new com.jellybyn.settings.bluetooth.A2dpProfile;
        r1 = r4.mContext;
        r2 = r4.mLocalAdapter;
        r3 = r4.mDeviceManager;
        r0.<init>(r1, r2, r3, r4);
        r4.mA2dpProfile = r0;
        r0 = r4.mA2dpProfile;
        r1 = "A2DP";
        r2 = "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED";
        r4.addProfile(r0, r1, r2);
    L_0x0021:
        r0 = android.bluetooth.BluetoothUuid.Handsfree_AG;
        r0 = android.bluetooth.BluetoothUuid.isUuidPresent(r5, r0);
        if (r0 != 0) goto L_0x0031;
    L_0x0029:
        r0 = android.bluetooth.BluetoothUuid.HSP_AG;
        r0 = android.bluetooth.BluetoothUuid.isUuidPresent(r5, r0);
        if (r0 == 0) goto L_0x0087;
    L_0x0031:
        r0 = r4.mHeadsetProfile;
        if (r0 != 0) goto L_0x0052;
    L_0x0035:
        r0 = "LocalBluetoothProfileManager";
        r1 = "Adding local HEADSET profile";
        android.util.Log.d(r0, r1);
        r0 = new com.jellybyn.settings.bluetooth.HeadsetProfile;
        r1 = r4.mContext;
        r2 = r4.mLocalAdapter;
        r3 = r4.mDeviceManager;
        r0.<init>(r1, r2, r3, r4);
        r4.mHeadsetProfile = r0;
        r0 = r4.mHeadsetProfile;
        r1 = "HEADSET";
        r2 = "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED";
        r4.addProfile(r0, r1, r2);
    L_0x0052:
        r0 = android.bluetooth.BluetoothUuid.ObexObjectPush;
        r0 = android.bluetooth.BluetoothUuid.isUuidPresent(r5, r0);
        if (r0 == 0) goto L_0x0093;
    L_0x005a:
        r0 = r4.mOppProfile;
        if (r0 != 0) goto L_0x0075;
    L_0x005e:
        r0 = "LocalBluetoothProfileManager";
        r1 = "Adding local OPP profile";
        android.util.Log.d(r0, r1);
        r0 = new com.jellybyn.settings.bluetooth.OppProfile;
        r0.<init>();
        r4.mOppProfile = r0;
        r0 = r4.mProfileNameMap;
        r1 = "OPP";
        r2 = r4.mOppProfile;
        r0.put(r1, r2);
    L_0x0075:
        r0 = r4.mEventManager;
        r0.registerProfileIntentReceiver();
        return;
        r0 = r4.mA2dpProfile;
        if (r0 == 0) goto L_0x0021;
    L_0x007f:
        r0 = "LocalBluetoothProfileManager";
        r1 = "Warning: A2DP profile was previously added but the UUID is now missing.";
        android.util.Log.w(r0, r1);
        goto L_0x0021;
    L_0x0087:
        r0 = r4.mHeadsetProfile;
        if (r0 == 0) goto L_0x0052;
    L_0x008b:
        r0 = "LocalBluetoothProfileManager";
        r1 = "Warning: HEADSET profile was previously added but the UUID is now missing.";
        android.util.Log.w(r0, r1);
        goto L_0x0052;
    L_0x0093:
        r0 = r4.mOppProfile;
        if (r0 == 0) goto L_0x0075;
    L_0x0097:
        r0 = "LocalBluetoothProfileManager";
        r1 = "Warning: OPP profile was previously added but the UUID is now missing.";
        android.util.Log.w(r0, r1);
        goto L_0x0075;
    }

    synchronized void updateProfiles(android.os.ParcelUuid[] r3, android.os.ParcelUuid[] r4, java.util.Collection<com.jellybyn.settings.bluetooth.LocalBluetoothProfile> r5, java.util.Collection<com.jellybyn.settings.bluetooth.LocalBluetoothProfile> r6, boolean r7) {
        r2 = this;
        monitor-enter(r2);
        r6.clear();	 Catch:{ all -> 0x00a1 }
        r6.addAll(r5);	 Catch:{ all -> 0x00a1 }
        r5.clear();	 Catch:{ all -> 0x00a1 }
        if (r3 != 0) goto L_0x000e;
    L_0x000c:
        monitor-exit(r2);
        return;
    L_0x000e:
        r0 = r2.mHeadsetProfile;
        if (r0 == 0) goto L_0x003c;
    L_0x0012:
        r0 = android.bluetooth.BluetoothUuid.HSP_AG;
        r0 = android.bluetooth.BluetoothUuid.isUuidPresent(r4, r0);
        if (r0 == 0) goto L_0x0022;
    L_0x001a:
        r0 = android.bluetooth.BluetoothUuid.HSP;
        r0 = android.bluetooth.BluetoothUuid.isUuidPresent(r3, r0);
        if (r0 != 0) goto L_0x0032;
    L_0x0022:
        r0 = android.bluetooth.BluetoothUuid.Handsfree_AG;
        r0 = android.bluetooth.BluetoothUuid.isUuidPresent(r4, r0);
        if (r0 == 0) goto L_0x003c;
    L_0x002a:
        r0 = android.bluetooth.BluetoothUuid.Handsfree;
        r0 = android.bluetooth.BluetoothUuid.isUuidPresent(r3, r0);
        if (r0 == 0) goto L_0x003c;
    L_0x0032:
        r0 = r2.mHeadsetProfile;
        r5.add(r0);
        r0 = r2.mHeadsetProfile;
        r6.remove(r0);
    L_0x003c:
        r0 = com.jellybyn.settings.bluetooth.A2dpProfile.SINK_UUIDS;
        r0 = android.bluetooth.BluetoothUuid.containsAnyUuid(r3, r0);
        if (r0 == 0) goto L_0x0052;
    L_0x0044:
        r0 = r2.mA2dpProfile;
        if (r0 == 0) goto L_0x0052;
    L_0x0048:
        r0 = r2.mA2dpProfile;
        r5.add(r0);
        r0 = r2.mA2dpProfile;
        r6.remove(r0);
    L_0x0052:
        r0 = android.bluetooth.BluetoothUuid.ObexObjectPush;
        r0 = android.bluetooth.BluetoothUuid.isUuidPresent(r3, r0);
        if (r0 == 0) goto L_0x0068;
    L_0x005a:
        r0 = r2.mOppProfile;
        if (r0 == 0) goto L_0x0068;
    L_0x005e:
        r0 = r2.mOppProfile;
        r5.add(r0);
        r0 = r2.mOppProfile;
        r6.remove(r0);
    L_0x0068:
        r0 = android.bluetooth.BluetoothUuid.Hid;
        r0 = android.bluetooth.BluetoothUuid.isUuidPresent(r3, r0);
        if (r0 == 0) goto L_0x007e;
    L_0x0070:
        r0 = r2.mHidProfile;
        if (r0 == 0) goto L_0x007e;
    L_0x0074:
        r0 = r2.mHidProfile;
        r5.add(r0);
        r0 = r2.mHidProfile;
        r6.remove(r0);
    L_0x007e:
        if (r7 == 0) goto L_0x0087;
    L_0x0080:
        r0 = "LocalBluetoothProfileManager";
        r1 = "Valid PAN-NAP connection exists.";
        android.util.Log.d(r0, r1);
    L_0x0087:
        r0 = android.bluetooth.BluetoothUuid.NAP;
        r0 = android.bluetooth.BluetoothUuid.isUuidPresent(r3, r0);
        if (r0 == 0) goto L_0x0093;
    L_0x008f:
        r0 = r2.mPanProfile;
        if (r0 != 0) goto L_0x0095;
    L_0x0093:
        if (r7 == 0) goto L_0x000c;
    L_0x0095:
        r0 = r2.mPanProfile;
        r5.add(r0);
        r0 = r2.mPanProfile;
        r6.remove(r0);
        goto L_0x000c;
    L_0x00a1:
        r0 = move-exception;
        monitor-exit(r2);
        throw r0;
    }
}