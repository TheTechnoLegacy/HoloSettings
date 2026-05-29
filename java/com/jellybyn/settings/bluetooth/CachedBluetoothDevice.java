package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.os.ParcelUuid;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

final class CachedBluetoothDevice implements Comparable<CachedBluetoothDevice> {
    private BluetoothClass mBtClass;
    private final Collection<Callback> mCallbacks = new ArrayList();
    private boolean mConnectAfterPairing;
    private long mConnectAttempted;
    private final Context mContext;
    private final BluetoothDevice mDevice;
    private boolean mIsConnectingErrorPossible;
    private final LocalBluetoothAdapter mLocalAdapter;
    private boolean mLocalNapRoleConnected;
    private String mName;
    private int mPhonebookPermissionChoice;
    private HashMap<LocalBluetoothProfile, Integer> mProfileConnectionState;
    private final LocalBluetoothProfileManager mProfileManager;
    private final List<LocalBluetoothProfile> mProfiles = new ArrayList();
    private final List<LocalBluetoothProfile> mRemovedProfiles = new ArrayList();
    private short mRssi;
    private boolean mVisible;

    void onProfileStateChanged(LocalBluetoothProfile localBluetoothProfile, int i) {
        Log.d("CachedBluetoothDevice", "onProfileStateChanged: profile " + localBluetoothProfile + " newProfileState " + i);
        if (this.mLocalAdapter.getBluetoothState() == 13) {
            Log.d("CachedBluetoothDevice", " BT Turninig Off...Profile conn state change ignored...");
            return;
        }
        this.mProfileConnectionState.put(localBluetoothProfile, Integer.valueOf(i));
        if (i == 2) {
            if (!this.mProfiles.contains(localBluetoothProfile)) {
                this.mRemovedProfiles.remove(localBluetoothProfile);
                this.mProfiles.add(localBluetoothProfile);
                if ((localBluetoothProfile instanceof PanProfile) && ((PanProfile) localBluetoothProfile).isLocalRoleNap(this.mDevice)) {
                    this.mLocalNapRoleConnected = true;
                }
            }
        } else if (this.mLocalNapRoleConnected && (localBluetoothProfile instanceof PanProfile) && ((PanProfile) localBluetoothProfile).isLocalRoleNap(this.mDevice) && i == 0) {
            Log.d("CachedBluetoothDevice", "Removing PanProfile from device after NAP disconnect");
            this.mProfiles.remove(localBluetoothProfile);
            this.mRemovedProfiles.add(localBluetoothProfile);
            this.mLocalNapRoleConnected = false;
        }
    }

    private void connectWithoutResettingTimer(boolean z) {
        if (this.mProfiles.isEmpty()) {
            Log.d("CachedBluetoothDevice", "No profiles. Maybe we will connect later");
            return;
        }
        this.mIsConnectingErrorPossible = true;
        int preferredProfiles = 0;
        for (LocalBluetoothProfile localBluetoothProfile : this.mProfiles) {
            if (z) {
                if (!localBluetoothProfile.isConnectable()) {
                }
            } else if (localBluetoothProfile.isAutoConnectable()) {
            }
            if (localBluetoothProfile.isPreferred(this.mDevice)) {
                preferredProfiles++;
                connectInt(localBluetoothProfile);
            }
        }
        if (preferredProfiles == 0) {
            connectAutoConnectableProfiles();
        }
    }

    public int compareTo(CachedBluetoothDevice cachedBluetoothDevice) {
        int i = 1;
        int comparison = (cachedBluetoothDevice.isConnected() ? 1 : 0) - (isConnected() ? 1 : 0);
        if (comparison != 0) {
            return comparison;
        }
        comparison = (cachedBluetoothDevice.getBondState() == 12 ? 1 : 0) - (getBondState() == 12 ? 1 : 0);
        if (comparison != 0) {
            return comparison;
        }
        int i2 = cachedBluetoothDevice.mVisible ? 1 : 0;
        if (!this.mVisible) {
            i = 0;
        }
        comparison = i2 - i;
        if (comparison != 0) {
            return comparison;
        }
        comparison = cachedBluetoothDevice.mRssi - this.mRssi;
        return comparison != 0 ? comparison : this.mName.compareTo(cachedBluetoothDevice.mName);
    }

    void onBondingStateChanged(int i) {
        if (i == 10) {
            this.mProfiles.clear();
            this.mConnectAfterPairing = false;
            setPhonebookPermissionChoice(0);
        }
        refresh();
        if (i == 12) {
            if (this.mDevice.isBluetoothDock()) {
                onBondingDockConnect();
            } else if (this.mConnectAfterPairing) {
                connect(false);
            }
            this.mConnectAfterPairing = false;
        }
    }

    CachedBluetoothDevice(Context context, LocalBluetoothAdapter localBluetoothAdapter, LocalBluetoothProfileManager localBluetoothProfileManager, BluetoothDevice bluetoothDevice) {
        this.mContext = context;
        this.mLocalAdapter = localBluetoothAdapter;
        this.mProfileManager = localBluetoothProfileManager;
        this.mDevice = bluetoothDevice;
        this.mProfileConnectionState = new HashMap();
        fillData();
    }

    void unpair() {
        int state = getBondState();
        if (state == 11) {
            this.mDevice.cancelBondProcess();
        }
        if (state != 10) {
            BluetoothDevice bluetoothDevice = this.mDevice;
            if (bluetoothDevice != null && bluetoothDevice.removeBond()) {
                Log.d("CachedBluetoothDevice", "Command sent successfully:REMOVE_BOND " + describe(null));
            }
        }
    }

    private void connectAutoConnectableProfiles() {
        if (ensurePaired()) {
            this.mIsConnectingErrorPossible = true;
            for (LocalBluetoothProfile profile : this.mProfiles) {
                if (profile.isAutoConnectable()) {
                    profile.setPreferred(this.mDevice, true);
                    connectInt(profile);
                }
            }
        }
    }

    private void fillData() {
        fetchName();
        fetchBtClass();
        updateProfiles();
        fetchPhonebookPermissionChoice();
        this.mVisible = false;
        dispatchAttributesChanged();
    }

    private boolean updateProfiles() {
        ParcelUuid[] uuids = this.mDevice.getUuids();
        if (uuids == null) {
            return false;
        }
        ParcelUuid[] localUuids = this.mLocalAdapter.getUuids();
        if (localUuids == null) {
            return false;
        }
        this.mProfileManager.updateProfiles(uuids, localUuids, this.mProfiles, this.mRemovedProfiles, this.mLocalNapRoleConnected);
        return true;
    }

    void setName(String str) {
        if (!this.mName.equals(str)) {
            if (TextUtils.isEmpty(str)) {
                this.mName = this.mDevice.getAddress();
            } else {
                this.mName = str;
                this.mDevice.setAlias(str);
            }
            dispatchAttributesChanged();
        }
    }

    void setPhonebookPermissionChoice(int i) {
        Editor editor = this.mContext.getSharedPreferences("bluetooth_phonebook_permission", 0).edit();
        if (i == 0) {
            editor.remove(this.mDevice.getAddress());
        } else {
            editor.putInt(this.mDevice.getAddress(), i);
        }
        editor.commit();
        this.mPhonebookPermissionChoice = i;
    }

    synchronized void connectInt(LocalBluetoothProfile localBluetoothProfile) {
        if (ensurePaired()) {
            if (localBluetoothProfile.connect(this.mDevice)) {
                Log.d("CachedBluetoothDevice", "Command sent successfully:CONNECT " + describe(localBluetoothProfile));
            } else {
                Log.i("CachedBluetoothDevice", "Failed to connect " + localBluetoothProfile.toString() + " to " + this.mName);
            }
        }
    }

    void disconnect() {
        for (LocalBluetoothProfile disconnect : this.mProfiles) {
            disconnect(disconnect);
        }
        PbapServerProfile PbapProfile = this.mProfileManager.getPbapProfile();
        if (PbapProfile.getConnectionStatus(this.mDevice) == 2) {
            PbapProfile.disconnect(this.mDevice);
        }
    }

    boolean startPairing() {
        if (this.mLocalAdapter.isDiscovering()) {
            this.mLocalAdapter.cancelDiscovery();
        }
        if (!this.mDevice.createBond()) {
            return false;
        }
        this.mConnectAfterPairing = true;
        return true;
    }

    private String describe(LocalBluetoothProfile localBluetoothProfile) {
        StringBuilder sb = new StringBuilder();
        sb.append("Address:").append(this.mDevice);
        if (localBluetoothProfile != null) {
            sb.append(" Profile:").append(localBluetoothProfile);
        }
        return sb.toString();
    }

    private void dispatchAttributesChanged() {
        synchronized (this.mCallbacks) {
            for (Callback onDeviceAttributesChanged : this.mCallbacks) {
                onDeviceAttributesChanged.onDeviceAttributesChanged();
            }
        }
    }

    void connectProfile(LocalBluetoothProfile localBluetoothProfile) {
        this.mConnectAttempted = SystemClock.elapsedRealtime();
        this.mIsConnectingErrorPossible = true;
        connectInt(localBluetoothProfile);
        refresh();
    }

    List<LocalBluetoothProfile> getConnectableProfiles() {
        List<LocalBluetoothProfile> connectableProfiles = new ArrayList();
        for (LocalBluetoothProfile localBluetoothProfile : this.mProfiles) {
            if (localBluetoothProfile.isConnectable()) {
                connectableProfiles.add(localBluetoothProfile);
            }
        }
        return connectableProfiles;
    }

    boolean isConnected() {
        for (LocalBluetoothProfile profileConnectionState : this.mProfiles) {
            if (getProfileConnectionState(profileConnectionState) == 2) {
                return true;
            }
        }
        return false;
    }

    void onUuidChanged() {
        updateProfiles();
        if (!this.mProfiles.isEmpty() && this.mConnectAttempted + 5000 > SystemClock.elapsedRealtime()) {
            connectWithoutResettingTimer(false);
        }
        dispatchAttributesChanged();
    }

    void registerCallback(Callback callback) {
        synchronized (this.mCallbacks) {
            this.mCallbacks.add(callback);
        }
    }

    void unregisterCallback(Callback callback) {
        synchronized (this.mCallbacks) {
            this.mCallbacks.remove(callback);
        }
    }

    private boolean ensurePaired() {
        if (getBondState() != 10) {
            return true;
        }
        startPairing();
        return false;
    }

    private void fetchName() {
        this.mName = this.mDevice.getAliasName();
        if (TextUtils.isEmpty(this.mName)) {
            this.mName = this.mDevice.getAddress();
        }
    }

    public void clearProfileConnectionState() {
        Log.d("CachedBluetoothDevice", " Clearing all connection state for dev:" + this.mDevice.getName());
        for (LocalBluetoothProfile put : getProfiles()) {
            this.mProfileConnectionState.put(put, Integer.valueOf(0));
        }
    }

    void connect(boolean z) {
        if (ensurePaired()) {
            this.mConnectAttempted = SystemClock.elapsedRealtime();
            connectWithoutResettingTimer(z);
        }
    }

    int getProfileConnectionState(LocalBluetoothProfile localBluetoothProfile) {
        if (this.mProfileConnectionState == null || this.mProfileConnectionState.get(localBluetoothProfile) == null) {
            this.mProfileConnectionState.put(localBluetoothProfile, Integer.valueOf(localBluetoothProfile.getConnectionStatus(this.mDevice)));
        }
        return ((Integer) this.mProfileConnectionState.get(localBluetoothProfile)).intValue();
    }

    boolean isBusy() {
        for (LocalBluetoothProfile profileConnectionState : this.mProfiles) {
            int profileConnectionState2 = getProfileConnectionState(profileConnectionState);
            if (profileConnectionState2 == 1) {
                return true;
            }
            if (profileConnectionState2 == 3) {
                return true;
            }
        }
        return getBondState() == 11;
    }

    void setBtClass(BluetoothClass bluetoothClass) {
        if (bluetoothClass != null && this.mBtClass != bluetoothClass) {
            this.mBtClass = bluetoothClass;
            dispatchAttributesChanged();
        }
    }

    void setRssi(short s) {
        if (this.mRssi != s) {
            this.mRssi = s;
            dispatchAttributesChanged();
        }
    }

    void setVisible(boolean z) {
        if (this.mVisible != z) {
            this.mVisible = z;
            dispatchAttributesChanged();
        }
    }

    private void fetchPhonebookPermissionChoice() {
        this.mPhonebookPermissionChoice = this.mContext.getSharedPreferences("bluetooth_phonebook_permission", 0).getInt(this.mDevice.getAddress(), 0);
    }

    void disconnect(LocalBluetoothProfile localBluetoothProfile) {
        if (localBluetoothProfile.disconnect(this.mDevice)) {
            Log.d("CachedBluetoothDevice", "Command sent successfully:DISCONNECT " + describe(localBluetoothProfile));
        }
    }

    public boolean equals(Object obj) {
        return (obj == null || !(obj instanceof CachedBluetoothDevice)) ? false : this.mDevice.equals(((CachedBluetoothDevice) obj).mDevice);
    }

    void refreshBtClass() {
        fetchBtClass();
        dispatchAttributesChanged();
    }

    void refreshName() {
        fetchName();
        dispatchAttributesChanged();
    }

    private void fetchBtClass() {
        this.mBtClass = this.mDevice.getBluetoothClass();
    }

    void onBondingDockConnect() {
        connect(false);
    }

    void refresh() {
        dispatchAttributesChanged();
    }

    int getBondState() {
        return this.mDevice.getBondState();
    }

    BluetoothClass getBtClass() {
        return this.mBtClass;
    }

    BluetoothDevice getDevice() {
        return this.mDevice;
    }

    String getName() {
        return this.mName;
    }

    int getPhonebookPermissionChoice() {
        return this.mPhonebookPermissionChoice;
    }

    List<LocalBluetoothProfile> getProfiles() {
        return Collections.unmodifiableList(this.mProfiles);
    }

    List<LocalBluetoothProfile> getRemovedProfiles() {
        return this.mRemovedProfiles;
    }

    public int hashCode() {
        return this.mDevice.getAddress().hashCode();
    }

    public String toString() {
        return this.mDevice.toString();
    }
}