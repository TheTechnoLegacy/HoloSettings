package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothInputDevice;
import android.content.Context;
import android.util.Log;
import java.util.List;

final class HidProfile implements LocalBluetoothProfile {
    private static boolean V = true;
    private final CachedBluetoothDeviceManager mDeviceManager;
    private boolean mIsProfileReady;
    private final LocalBluetoothAdapter mLocalAdapter;
    private final LocalBluetoothProfileManager mProfileManager;
    private BluetoothInputDevice mService;

    protected void finalize() {
        if (V) {
            Log.d("HidProfile", "finalize()");
        }
        if (this.mService != null) {
            try {
                BluetoothAdapter.getDefaultAdapter().closeProfileProxy(4, this.mService);
                this.mService = null;
            } catch (Throwable t) {
                Log.w("HidProfile", "Error cleaning up HID proxy", t);
            }
        }
    }

    HidProfile(Context context, LocalBluetoothAdapter localBluetoothAdapter, CachedBluetoothDeviceManager cachedBluetoothDeviceManager, LocalBluetoothProfileManager localBluetoothProfileManager) {
        this.mLocalAdapter = localBluetoothAdapter;
        this.mDeviceManager = cachedBluetoothDeviceManager;
        this.mProfileManager = localBluetoothProfileManager;
        localBluetoothAdapter.getProfileProxy(context, new InputDeviceServiceListener(this, null), 4);
    }

    public int getSummaryResourceForDevice(BluetoothDevice bluetoothDevice) {
        int state = getConnectionStatus(bluetoothDevice);
        switch (state) {
            case 0:
                return 2131427760;
            case 2:
                return 2131427754;
            default:
                return Utils.getConnectionStateSummary(state);
        }
    }

    public void setPreferred(BluetoothDevice bluetoothDevice, boolean z) {
        if (this.mService != null) {
            if (!z) {
                this.mService.setPriority(bluetoothDevice, 0);
            } else if (this.mService.getPriority(bluetoothDevice) < 100) {
                this.mService.setPriority(bluetoothDevice, 100);
            }
        }
    }

    static int getHidClassDrawable(BluetoothClass bluetoothClass) {
        switch (bluetoothClass.getDeviceClass()) {
            case 1344:
            case 1472:
                return 2130837574;
            case 1408:
                return 2130837578;
            default:
                return 2130837576;
        }
    }

    public int getConnectionStatus(BluetoothDevice bluetoothDevice) {
        if (this.mService == null) {
            return 0;
        }
        List<BluetoothDevice> deviceList = this.mService.getConnectedDevices();
        int connectionState = (deviceList.isEmpty() || !((BluetoothDevice) deviceList.get(0)).equals(bluetoothDevice)) ? 0 : this.mService.getConnectionState(bluetoothDevice);
        return connectionState;
    }

    public int getDrawableResource(BluetoothClass bluetoothClass) {
        return bluetoothClass == null ? 2130837574 : getHidClassDrawable(bluetoothClass);
    }

    public boolean connect(BluetoothDevice bluetoothDevice) {
        return this.mService == null ? false : this.mService.connect(bluetoothDevice);
    }

    public boolean disconnect(BluetoothDevice bluetoothDevice) {
        return this.mService == null ? false : this.mService.disconnect(bluetoothDevice);
    }

    public int getPreferred(BluetoothDevice bluetoothDevice) {
        return this.mService == null ? 0 : this.mService.getPriority(bluetoothDevice);
    }

    public boolean isPreferred(BluetoothDevice bluetoothDevice) {
        return this.mService != null && this.mService.getPriority(bluetoothDevice) > 0;
    }

    public int getNameResource(BluetoothDevice bluetoothDevice) {
        return 2131427736;
    }

    public int getOrdinal() {
        return 3;
    }

    public boolean isAutoConnectable() {
        return true;
    }

    public boolean isConnectable() {
        return true;
    }

    public boolean isProfileReady() {
        return this.mIsProfileReady;
    }

    public String toString() {
        return "HID";
    }
}