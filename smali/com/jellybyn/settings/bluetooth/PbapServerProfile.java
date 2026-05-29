package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothPbap;
import android.content.Context;
import android.util.Log;

final class PbapServerProfile implements LocalBluetoothProfile {
    private static boolean V = true;
    private boolean mIsProfileReady;
    private BluetoothPbap mService;

    protected void finalize() {
        if (V) {
            Log.d("PbapServerProfile", "finalize()");
        }
        if (this.mService != null) {
            try {
                this.mService.close();
                this.mService = null;
            } catch (Throwable t) {
                Log.w("PbapServerProfile", "Error cleaning up PBAP proxy", t);
            }
        }
    }

    public int getConnectionStatus(BluetoothDevice bluetoothDevice) {
        return (this.mService != null && this.mService.isConnected(bluetoothDevice)) ? 2 : 0;
    }

    PbapServerProfile(Context context) {
        BluetoothPbap pbap = new BluetoothPbap(context, new PbapServiceListener(this, null));
    }

    public boolean disconnect(BluetoothDevice bluetoothDevice) {
        return this.mService == null ? false : this.mService.disconnect();
    }

    public boolean connect(BluetoothDevice bluetoothDevice) {
        return false;
    }

    public int getDrawableResource(BluetoothClass bluetoothClass) {
        return 0;
    }

    public int getNameResource(BluetoothDevice bluetoothDevice) {
        return 0;
    }

    public int getOrdinal() {
        return 6;
    }

    public int getPreferred(BluetoothDevice bluetoothDevice) {
        return -1;
    }

    public int getSummaryResourceForDevice(BluetoothDevice bluetoothDevice) {
        return 0;
    }

    public boolean isAutoConnectable() {
        return false;
    }

    public boolean isConnectable() {
        return true;
    }

    public boolean isPreferred(BluetoothDevice bluetoothDevice) {
        return false;
    }

    public boolean isProfileReady() {
        return this.mIsProfileReady;
    }

    public void setPreferred(BluetoothDevice bluetoothDevice, boolean z) {
    }

    public String toString() {
        return "PBAP Server";
    }
}