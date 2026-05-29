package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.os.ParcelUuid;
import com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.Filter;

abstract class BluetoothDeviceFilter$ClassUuidFilter implements Filter {
    private BluetoothDeviceFilter$ClassUuidFilter() {
    }

    public boolean matches(BluetoothDevice bluetoothDevice) {
        return matches(bluetoothDevice.getUuids(), bluetoothDevice.getBluetoothClass());
    }

    abstract boolean matches(ParcelUuid[] parcelUuidArr, BluetoothClass bluetoothClass);
}