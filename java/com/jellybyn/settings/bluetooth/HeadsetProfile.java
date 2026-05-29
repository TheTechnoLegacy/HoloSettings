package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothHeadset;
import android.bluetooth.BluetoothUuid;
import android.content.Context;
import android.os.ParcelUuid;
import android.util.Log;
import java.util.List;

final class HeadsetProfile implements LocalBluetoothProfile {
    static final ParcelUuid[] UUIDS = new ParcelUuid[]{BluetoothUuid.HSP, BluetoothUuid.Handsfree};
    private static boolean V = true;
    private final CachedBluetoothDeviceManager mDeviceManager;
    private boolean mIsProfileReady;
    private final LocalBluetoothAdapter mLocalAdapter;
    private final LocalBluetoothProfileManager mProfileManager;
    private BluetoothHeadset mService;

    public boolean disconnect(BluetoothDevice bluetoothDevice) {
        if (this.mService == null) {
            return false;
        }
        List<BluetoothDevice> deviceList = this.mService.getConnectedDevices();
        if (deviceList.isEmpty() || !((BluetoothDevice) deviceList.get(0)).equals(bluetoothDevice)) {
            return false;
        }
        if (this.mService.getPriority(bluetoothDevice) > 100) {
            this.mService.setPriority(bluetoothDevice, 100);
        }
        return this.mService.disconnect(bluetoothDevice);
    }

    public boolean connect(BluetoothDevice bluetoothDevice) {
        if (this.mService == null) {
            return false;
        }
        List<BluetoothDevice> sinks = this.mService.getConnectedDevices();
        if (sinks != null) {
            for (BluetoothDevice disconnect : sinks) {
                this.mService.disconnect(disconnect);
            }
        }
        return this.mService.connect(bluetoothDevice);
    }

    protected void finalize() {
        if (V) {
            Log.d("HeadsetProfile", "finalize()");
        }
        if (this.mService != null) {
            try {
                BluetoothAdapter.getDefaultAdapter().closeProfileProxy(1, this.mService);
                this.mService = null;
            } catch (Throwable t) {
                Log.w("HeadsetProfile", "Error cleaning up HID proxy", t);
            }
        }
    }

    HeadsetProfile(Context context, LocalBluetoothAdapter localBluetoothAdapter, CachedBluetoothDeviceManager cachedBluetoothDeviceManager, LocalBluetoothProfileManager localBluetoothProfileManager) {
        this.mLocalAdapter = localBluetoothAdapter;
        this.mDeviceManager = cachedBluetoothDeviceManager;
        this.mProfileManager = localBluetoothProfileManager;
        this.mLocalAdapter.getProfileProxy(context, new HeadsetServiceListener(this, null), 1);
    }

    public int getSummaryResourceForDevice(BluetoothDevice bluetoothDevice) {
        int state = getConnectionStatus(bluetoothDevice);
        switch (state) {
            case 0:
                return 2131427758;
            case 2:
                return 2131427751;
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

    public int getConnectionStatus(BluetoothDevice bluetoothDevice) {
        if (this.mService == null) {
            return 0;
        }
        List<BluetoothDevice> deviceList = this.mService.getConnectedDevices();
        int connectionState = (deviceList.isEmpty() || !((BluetoothDevice) deviceList.get(0)).equals(bluetoothDevice)) ? 0 : this.mService.getConnectionState(bluetoothDevice);
        return connectionState;
    }

    public int getPreferred(BluetoothDevice bluetoothDevice) {
        return this.mService == null ? 0 : this.mService.getPriority(bluetoothDevice);
    }

    public boolean isPreferred(BluetoothDevice bluetoothDevice) {
        return this.mService != null && this.mService.getPriority(bluetoothDevice) > 0;
    }

    public int getDrawableResource(BluetoothClass bluetoothClass) {
        return 2130837572;
    }

    public int getNameResource(BluetoothDevice bluetoothDevice) {
        return 2131427734;
    }

    public int getOrdinal() {
        return 0;
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
        return "HEADSET";
    }
}