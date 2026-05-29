package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothUuid;
import android.os.ParcelUuid;
import com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.ClassUuidFilter;

final class BluetoothDeviceFilter$PanuFilter extends ClassUuidFilter {
    boolean matches(ParcelUuid[] parcelUuidArr, BluetoothClass bluetoothClass) {
        if (parcelUuidArr == null || !BluetoothUuid.isUuidPresent(parcelUuidArr, BluetoothUuid.PANU)) {
            return bluetoothClass != null && bluetoothClass.doesClassMatch(4);
        } else {
            return true;
        }
    }

    private BluetoothDeviceFilter$PanuFilter() {
        this();
    }
}