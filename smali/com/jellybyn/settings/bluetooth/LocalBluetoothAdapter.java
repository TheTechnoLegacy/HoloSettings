package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfile.ServiceListener;
import android.content.Context;
import android.os.ParcelUuid;
import java.util.Set;

public final class LocalBluetoothAdapter {
    private static LocalBluetoothAdapter sInstance;
    private final BluetoothAdapter mAdapter;
    private long mLastScan;
    private LocalBluetoothProfileManager mProfileManager;
    private int mState = Integer.MIN_VALUE;

    void startScanning(boolean z) {
        if (!this.mAdapter.isDiscovering()) {
            if (!z) {
                if (this.mLastScan + 300000 <= System.currentTimeMillis()) {
                    A2dpProfile a2dpProfile = this.mProfileManager.getA2dpProfile();
                    if (a2dpProfile != null && a2dpProfile.isA2dpPlaying()) {
                        return;
                    }
                }
                return;
            }
            if (this.mAdapter.startDiscovery()) {
                this.mLastScan = System.currentTimeMillis();
            }
        }
    }

    public void setBluetoothEnabled(boolean z) {
        if (z ? this.mAdapter.enable() : this.mAdapter.disable()) {
            setBluetoothStateInt(z ? 11 : 13);
        } else {
            syncBluetoothState();
        }
    }

    static synchronized LocalBluetoothAdapter getInstance() {
        LocalBluetoothAdapter localBluetoothAdapter;
        synchronized (LocalBluetoothAdapter.class) {
            if (sInstance == null) {
                BluetoothAdapter adapter = BluetoothAdapter.getDefaultAdapter();
                if (adapter != null) {
                    sInstance = new LocalBluetoothAdapter(adapter);
                }
            }
            localBluetoothAdapter = sInstance;
        }
        return localBluetoothAdapter;
    }

    synchronized void setBluetoothStateInt(int i) {
        this.mState = i;
        if (i == 12 && this.mProfileManager != null) {
            this.mProfileManager.setBluetoothStateOn();
        }
    }

    boolean syncBluetoothState() {
        if (this.mAdapter.getState() == this.mState) {
            return false;
        }
        setBluetoothStateInt(this.mAdapter.getState());
        return true;
    }

    private LocalBluetoothAdapter(BluetoothAdapter bluetoothAdapter) {
        this.mAdapter = bluetoothAdapter;
    }

    public synchronized int getBluetoothState() {
        syncBluetoothState();
        return this.mState;
    }

    void stopScanning() {
        if (this.mAdapter.isDiscovering()) {
            this.mAdapter.cancelDiscovery();
        }
    }

    void cancelDiscovery() {
        this.mAdapter.cancelDiscovery();
    }

    void getProfileProxy(Context context, ServiceListener serviceListener, int i) {
        this.mAdapter.getProfileProxy(context, serviceListener, i);
    }

    void setName(String str) {
        this.mAdapter.setName(str);
    }

    void setProfileManager(LocalBluetoothProfileManager localBluetoothProfileManager) {
        this.mProfileManager = localBluetoothProfileManager;
    }

    void setScanMode(int i) {
        this.mAdapter.setScanMode(i);
    }

    boolean disable() {
        return this.mAdapter.disable();
    }

    boolean enable() {
        return this.mAdapter.enable();
    }

    Set<BluetoothDevice> getBondedDevices() {
        return this.mAdapter.getBondedDevices();
    }

    String getName() {
        return this.mAdapter.getName();
    }

    int getScanMode() {
        return this.mAdapter.getScanMode();
    }

    int getState() {
        return this.mAdapter.getState();
    }

    ParcelUuid[] getUuids() {
        return this.mAdapter.getUuids();
    }

    boolean isDiscovering() {
        return this.mAdapter.isDiscovering();
    }

    boolean isEnabled() {
        return this.mAdapter.isEnabled();
    }

    boolean setScanMode(int i, int i2) {
        return this.mAdapter.setScanMode(i, i2);
    }
}