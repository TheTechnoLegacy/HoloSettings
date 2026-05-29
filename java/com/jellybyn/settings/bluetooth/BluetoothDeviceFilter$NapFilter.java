package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothUuid;
import android.os.ParcelUuid;
import com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.ClassUuidFilter;

final class BluetoothDeviceFilter$NapFilter extends ClassUuidFilter {
    boolean matches(ParcelUuid[] parcelUuidArr, BluetoothClass bluetoothClass) {
        if (parcelUuidArr == null || !BluetoothUuid.isUuidPresent(parcelUuidArr, BluetoothUuid.NAP)) {
            return bluetoothClass != null && bluetoothClass.doesClassMatch(5);
        } else {
            return true;
        }
    }

    private BluetoothDeviceFilter$NapFilter() {
        this();
    }
}