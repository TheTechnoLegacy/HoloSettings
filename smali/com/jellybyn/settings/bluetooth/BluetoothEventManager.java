package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

final class BluetoothEventManager {
    private final IntentFilter mAdapterIntentFilter;
    private final BroadcastReceiver mBroadcastReceiver = new 1(this);
    private final Collection<BluetoothCallback> mCallbacks = new ArrayList();
    private Context mContext;
    private final CachedBluetoothDeviceManager mDeviceManager;
    private final Map<String, Handler> mHandlerMap;
    private final LocalBluetoothAdapter mLocalAdapter;
    private final IntentFilter mProfileIntentFilter;
    private LocalBluetoothProfileManager mProfileManager;

    BluetoothEventManager(LocalBluetoothAdapter localBluetoothAdapter, CachedBluetoothDeviceManager cachedBluetoothDeviceManager, Context context) {
        this.mLocalAdapter = localBluetoothAdapter;
        this.mDeviceManager = cachedBluetoothDeviceManager;
        this.mAdapterIntentFilter = new IntentFilter();
        this.mProfileIntentFilter = new IntentFilter();
        this.mHandlerMap = new HashMap();
        this.mContext = context;
        addHandler("android.bluetooth.adapter.action.STATE_CHANGED", new AdapterStateChangedHandler(this, null));
        addHandler("android.bluetooth.adapter.action.DISCOVERY_STARTED", new ScanningStateChangedHandler(this, true));
        addHandler("android.bluetooth.adapter.action.DISCOVERY_FINISHED", new ScanningStateChangedHandler(this, false));
        addHandler("android.bluetooth.device.action.FOUND", new DeviceFoundHandler(this, null));
        addHandler("android.bluetooth.device.action.DISAPPEARED", new DeviceDisappearedHandler(this, null));
        addHandler("android.bluetooth.device.action.NAME_CHANGED", new NameChangedHandler(this, null));
        addHandler("android.bluetooth.device.action.BOND_STATE_CHANGED", new BondStateChangedHandler(this, null));
        addHandler("android.bluetooth.device.action.PAIRING_CANCEL", new PairingCancelHandler(this, null));
        addHandler("android.bluetooth.device.action.CLASS_CHANGED", new ClassChangedHandler(this, null));
        addHandler("android.bluetooth.device.action.UUID", new UuidChangedHandler(this, null));
        addHandler("android.intent.action.DOCK_EVENT", new DockEventHandler(this, null));
        this.mContext.registerReceiver(this.mBroadcastReceiver, this.mAdapterIntentFilter);
    }

    boolean readPairedDevices() {
        Set<BluetoothDevice> bondedDevices = this.mLocalAdapter.getBondedDevices();
        if (bondedDevices == null) {
            return false;
        }
        boolean deviceAdded = false;
        for (BluetoothDevice device : bondedDevices) {
            if (this.mDeviceManager.findDevice(device) == null) {
                dispatchDeviceAdded(this.mDeviceManager.addDevice(this.mLocalAdapter, this.mProfileManager, device));
                deviceAdded = true;
            }
        }
        return deviceAdded;
    }

    private static String getDockedDeviceAddress(Context context) {
        Intent i = context.registerReceiver(null, new IntentFilter("android.intent.action.DOCK_EVENT"));
        if (i == null || i.getIntExtra("android.intent.extra.DOCK_STATE", 0) == 0) {
            return null;
        }
        BluetoothDevice bluetoothDevice = (BluetoothDevice) i.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
        return bluetoothDevice != null ? bluetoothDevice.getAddress() : null;
    }

    private void dispatchDeviceAdded(CachedBluetoothDevice cachedBluetoothDevice) {
        synchronized (this.mCallbacks) {
            for (BluetoothCallback onDeviceAdded : this.mCallbacks) {
                onDeviceAdded.onDeviceAdded(cachedBluetoothDevice);
            }
        }
    }

    void registerCallback(BluetoothCallback bluetoothCallback) {
        synchronized (this.mCallbacks) {
            this.mCallbacks.add(bluetoothCallback);
        }
    }

    void unregisterCallback(BluetoothCallback bluetoothCallback) {
        synchronized (this.mCallbacks) {
            this.mCallbacks.remove(bluetoothCallback);
        }
    }

    void addHandler(String str, Handler handler) {
        this.mHandlerMap.put(str, handler);
        this.mAdapterIntentFilter.addAction(str);
    }

    void addProfileHandler(String str, Handler handler) {
        this.mHandlerMap.put(str, handler);
        this.mProfileIntentFilter.addAction(str);
    }

    void registerProfileIntentReceiver() {
        this.mContext.registerReceiver(this.mBroadcastReceiver, this.mProfileIntentFilter);
    }

    void setProfileManager(LocalBluetoothProfileManager localBluetoothProfileManager) {
        this.mProfileManager = localBluetoothProfileManager;
    }
}