package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import com.jellybyn.settings.bluetooth.BluetoothEventManager.Handler;

class BluetoothEventManager$DockEventHandler implements Handler {
    final /* synthetic */ BluetoothEventManager this$0;

    public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice) {
        if (intent.getIntExtra("android.intent.extra.DOCK_STATE", 1) == 0 && bluetoothDevice != null && bluetoothDevice.getBondState() == 10) {
            CachedBluetoothDevice findDevice = BluetoothEventManager.access$1200(this.this$0).findDevice(bluetoothDevice);
            if (findDevice != null) {
                findDevice.setVisible(false);
            }
        }
    }

    private BluetoothEventManager$DockEventHandler(BluetoothEventManager bluetoothEventManager) {
        this.this$0 = bluetoothEventManager;
    }
}