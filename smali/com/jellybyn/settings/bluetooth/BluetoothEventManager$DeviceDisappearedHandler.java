package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.jellybyn.settings.bluetooth.BluetoothEventManager.Handler;

class BluetoothEventManager$DeviceDisappearedHandler implements Handler {
    final /* synthetic */ BluetoothEventManager this$0;

    public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice) {
        CachedBluetoothDevice cachedDevice = BluetoothEventManager.access$1200(this.this$0).findDevice(bluetoothDevice);
        if (cachedDevice == null) {
            Log.w("BluetoothEventManager", "received ACTION_DISAPPEARED for an unknown device: " + bluetoothDevice);
        } else if (CachedBluetoothDeviceManager.onDeviceDisappeared(cachedDevice)) {
            synchronized (BluetoothEventManager.access$1100(this.this$0)) {
                for (BluetoothCallback onDeviceDeleted : BluetoothEventManager.access$1100(this.this$0)) {
                    onDeviceDeleted.onDeviceDeleted(cachedDevice);
                }
            }
        }
    }

    private BluetoothEventManager$DeviceDisappearedHandler(BluetoothEventManager bluetoothEventManager) {
        this.this$0 = bluetoothEventManager;
    }
}