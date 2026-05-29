package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.Filter;

final class BluetoothDeviceFilter$AllFilter implements Filter {
    private BluetoothDeviceFilter$AllFilter() {
    }

    public boolean matches(BluetoothDevice bluetoothDevice) {
        return true;
    }
}