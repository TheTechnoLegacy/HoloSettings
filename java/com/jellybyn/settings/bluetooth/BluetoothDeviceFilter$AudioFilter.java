package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothUuid;
import android.os.ParcelUuid;
import com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.ClassUuidFilter;

final class BluetoothDeviceFilter$AudioFilter extends ClassUuidFilter {
    boolean matches(ParcelUuid[] parcelUuidArr, BluetoothClass bluetoothClass) {
        if (parcelUuidArr != null) {
            if (BluetoothUuid.containsAnyUuid(parcelUuidArr, A2dpProfile.SINK_UUIDS) || BluetoothUuid.containsAnyUuid(parcelUuidArr, HeadsetProfile.UUIDS)) {
                return true;
            }
        } else if (bluetoothClass != null) {
            if (bluetoothClass.doesClassMatch(1)) {
                return true;
            }
            if (bluetoothClass.doesClassMatch(0)) {
                return true;
            }
        }
        return false;
    }

    private BluetoothDeviceFilter$AudioFilter() {
        this();
    }
}