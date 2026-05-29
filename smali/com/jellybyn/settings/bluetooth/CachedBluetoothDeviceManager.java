package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

final class CachedBluetoothDeviceManager {
    private final List<CachedBluetoothDevice> mCachedDevices = new ArrayList();
    private Context mContext;

    public synchronized void onBluetoothStateChanged(int i) {
        if (i == 13) {
            for (int size = this.mCachedDevices.size() - 1; size >= 0; size--) {
                CachedBluetoothDevice cachedBluetoothDevice = (CachedBluetoothDevice) this.mCachedDevices.get(size);
                if (cachedBluetoothDevice.getBondState() != 12) {
                    cachedBluetoothDevice.setVisible(false);
                    this.mCachedDevices.remove(size);
                } else {
                    cachedBluetoothDevice.clearProfileConnectionState();
                }
            }
        }
    }

    public String getName(BluetoothDevice bluetoothDevice) {
        CachedBluetoothDevice cachedDevice = findDevice(bluetoothDevice);
        if (cachedDevice != null) {
            return cachedDevice.getName();
        }
        String name = bluetoothDevice.getAliasName();
        return name == null ? bluetoothDevice.getAddress() : name;
    }

    public synchronized void onScanningStateChanged(boolean z) {
        if (z) {
            for (int size = this.mCachedDevices.size() - 1; size >= 0; size--) {
                ((CachedBluetoothDevice) this.mCachedDevices.get(size)).setVisible(false);
            }
        }
    }

    public synchronized void onBtClassChanged(BluetoothDevice bluetoothDevice) {
        CachedBluetoothDevice findDevice = findDevice(bluetoothDevice);
        if (findDevice != null) {
            findDevice.refreshBtClass();
        }
    }

    public synchronized void onUuidChanged(BluetoothDevice bluetoothDevice) {
        CachedBluetoothDevice findDevice = findDevice(bluetoothDevice);
        if (findDevice != null) {
            findDevice.onUuidChanged();
        }
    }

    CachedBluetoothDeviceManager(Context context) {
        this.mContext = context;
    }

    public void onDeviceNameUpdated(BluetoothDevice bluetoothDevice) {
        CachedBluetoothDevice cachedDevice = findDevice(bluetoothDevice);
        if (cachedDevice != null) {
            cachedDevice.refreshName();
        }
    }

    CachedBluetoothDevice addDevice(LocalBluetoothAdapter localBluetoothAdapter, LocalBluetoothProfileManager localBluetoothProfileManager, BluetoothDevice bluetoothDevice) {
        CachedBluetoothDevice newDevice = new CachedBluetoothDevice(this.mContext, localBluetoothAdapter, localBluetoothProfileManager, bluetoothDevice);
        this.mCachedDevices.add(newDevice);
        return newDevice;
    }

    CachedBluetoothDevice findDevice(BluetoothDevice bluetoothDevice) {
        for (CachedBluetoothDevice cachedBluetoothDevice : this.mCachedDevices) {
            if (cachedBluetoothDevice.getDevice().equals(bluetoothDevice)) {
                return cachedBluetoothDevice;
            }
        }
        return null;
    }

    public static boolean onDeviceDisappeared(CachedBluetoothDevice cachedBluetoothDevice) {
        cachedBluetoothDevice.setVisible(false);
        return cachedBluetoothDevice.getBondState() == 10;
    }

    public synchronized Collection<CachedBluetoothDevice> getCachedDevicesCopy() {
        return new ArrayList(this.mCachedDevices);
    }
}