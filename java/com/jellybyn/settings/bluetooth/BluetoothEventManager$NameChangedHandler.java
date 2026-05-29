package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import com.jellybyn.settings.bluetooth.BluetoothEventManager.Handler;

class BluetoothEventManager$NameChangedHandler implements Handler {
    final /* synthetic */ BluetoothEventManager this$0;

    public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice) {
        BluetoothEventManager.access$1200(this.this$0).onDeviceNameUpdated(bluetoothDevice);
    }

    private BluetoothEventManager$NameChangedHandler(BluetoothEventManager bluetoothEventManager) {
        this.this$0 = bluetoothEventManager;
    }
}