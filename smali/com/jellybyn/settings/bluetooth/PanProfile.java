package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothPan;
import android.content.Context;
import android.util.Log;
import java.util.HashMap;
import java.util.List;

final class PanProfile implements LocalBluetoothProfile {
    private static boolean V = true;
    private final HashMap<BluetoothDevice, Integer> mDeviceRoleMap = new HashMap();
    private boolean mIsProfileReady;
    private BluetoothPan mService;

    public int getSummaryResourceForDevice(BluetoothDevice bluetoothDevice) {
        int state = getConnectionStatus(bluetoothDevice);
        switch (state) {
            case 0:
                return 2131427761;
            case 2:
                return isLocalRoleNap(bluetoothDevice) ? 2131427756 : 2131427755;
            default:
                return Utils.getConnectionStateSummary(state);
        }
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
            Log.d("PanProfile", "finalize()");
        }
        if (this.mService != null) {
            try {
                BluetoothAdapter.getDefaultAdapter().closeProfileProxy(5, this.mService);
                this.mService = null;
            } catch (Throwable t) {
                Log.w("PanProfile", "Error cleaning up PAN proxy", t);
            }
        }
    }

    PanProfile(Context context) {
        BluetoothAdapter.getDefaultAdapter().getProfileProxy(context, new PanServiceListener(this, null), 5);
    }

    boolean isLocalRoleNap(BluetoothDevice bluetoothDevice) {
        if (this.mDeviceRoleMap.containsKey(bluetoothDevice)) {
            return ((Integer) this.mDeviceRoleMap.get(bluetoothDevice)).intValue() == 1;
        } else {
            return false;
        }
    }

    public int getConnectionStatus(BluetoothDevice bluetoothDevice) {
        return this.mService == null ? 0 : this.mService.getConnectionState(bluetoothDevice);
    }

    public int getNameResource(BluetoothDevice bluetoothDevice) {
        return isLocalRoleNap(bluetoothDevice) ? 2131427738 : 2131427737;
    }

    public boolean disconnect(BluetoothDevice bluetoothDevice) {
        return this.mService == null ? false : this.mService.disconnect(bluetoothDevice);
    }

    void setLocalRole(BluetoothDevice bluetoothDevice, int i) {
        this.mDeviceRoleMap.put(bluetoothDevice, Integer.valueOf(i));
    }

    public int getDrawableResource(BluetoothClass bluetoothClass) {
        return 2130837577;
    }

    public int getOrdinal() {
        return 4;
    }

    public int getPreferred(BluetoothDevice bluetoothDevice) {
        return -1;
    }

    public boolean isAutoConnectable() {
        return false;
    }

    public boolean isConnectable() {
        return true;
    }

    public boolean isPreferred(BluetoothDevice bluetoothDevice) {
        return getConnectionStatus(bluetoothDevice) == 2;
    }

    public boolean isProfileReady() {
        return this.mIsProfileReady;
    }

    public void setPreferred(BluetoothDevice bluetoothDevice, boolean z) {
    }

    public String toString() {
        return "PAN";
    }
}