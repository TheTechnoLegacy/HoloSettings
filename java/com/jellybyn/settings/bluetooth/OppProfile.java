package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;

final class OppProfile implements LocalBluetoothProfile {
    OppProfile() {
    }

    public boolean connect(BluetoothDevice bluetoothDevice) {
        return false;
    }

    public boolean disconnect(BluetoothDevice bluetoothDevice) {
        return false;
    }

    public int getConnectionStatus(BluetoothDevice bluetoothDevice) {
        return 0;
    }

    public int getDrawableResource(BluetoothClass bluetoothClass) {
        return 0;
    }

    public int getNameResource(BluetoothDevice bluetoothDevice) {
        return 2131427735;
    }

    public int getOrdinal() {
        return 2;
    }

    public int getPreferred(BluetoothDevice bluetoothDevice) {
        return 0;
    }

    public int getSummaryResourceForDevice(BluetoothDevice bluetoothDevice) {
        return 0;
    }

    public boolean isAutoConnectable() {
        return false;
    }

    public boolean isConnectable() {
        return false;
    }

    public boolean isPreferred(BluetoothDevice bluetoothDevice) {
        return false;
    }

    public boolean isProfileReady() {
        return true;
    }

    public void setPreferred(BluetoothDevice bluetoothDevice, boolean z) {
    }

    public String toString() {
        return "OPP";
    }
}