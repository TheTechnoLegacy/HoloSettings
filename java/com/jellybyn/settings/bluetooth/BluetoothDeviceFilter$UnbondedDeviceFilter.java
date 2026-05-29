package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.Filter;

final class BluetoothDeviceFilter$UnbondedDeviceFilter implements Filter {
    private BluetoothDeviceFilter$UnbondedDeviceFilter() {
    }

    public boolean matches(BluetoothDevice bluetoothDevice) {
        return bluetoothDevice.getBondState() != 12;
    }
}