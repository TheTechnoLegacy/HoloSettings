package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.Filter;

final class BluetoothDeviceFilter$BondedDeviceFilter implements Filter {
    private BluetoothDeviceFilter$BondedDeviceFilter() {
    }

    public boolean matches(BluetoothDevice bluetoothDevice) {
        return bluetoothDevice.getBondState() == 12;
    }
}