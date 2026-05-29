package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothUuid;
import android.os.ParcelUuid;
import com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.ClassUuidFilter;

final class BluetoothDeviceFilter$TransferFilter extends ClassUuidFilter {
    boolean matches(ParcelUuid[] parcelUuidArr, BluetoothClass bluetoothClass) {
        if (parcelUuidArr == null || !BluetoothUuid.isUuidPresent(parcelUuidArr, BluetoothUuid.ObexObjectPush)) {
            return bluetoothClass != null && bluetoothClass.doesClassMatch(2);
        } else {
            return true;
        }
    }

    private BluetoothDeviceFilter$TransferFilter() {
        this();
    }
}