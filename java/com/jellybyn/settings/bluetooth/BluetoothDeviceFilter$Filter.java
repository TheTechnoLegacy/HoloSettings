package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;

interface BluetoothDeviceFilter$Filter {
    boolean matches(BluetoothDevice bluetoothDevice);
}