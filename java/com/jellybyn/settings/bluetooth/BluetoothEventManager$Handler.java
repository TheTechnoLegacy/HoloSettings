package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;

interface BluetoothEventManager$Handler {
    void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice);
}