package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.jellybyn.settings.bluetooth.BluetoothEventManager.Handler;

class BluetoothEventManager$DeviceFoundHandler implements Handler {
    final /* synthetic */ BluetoothEventManager this$0;

    public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice) {
        short rssi = intent.getShortExtra("android.bluetooth.device.extra.RSSI", Short.MIN_VALUE);
        BluetoothClass btClass = (BluetoothClass) intent.getParcelableExtra("android.bluetooth.device.extra.CLASS");
        String name = intent.getStringExtra("android.bluetooth.device.extra.NAME");
        CachedBluetoothDevice cachedDevice = BluetoothEventManager.access$1200(this.this$0).findDevice(bluetoothDevice);
        if (cachedDevice == null) {
            cachedDevice = BluetoothEventManager.access$1200(this.this$0).addDevice(BluetoothEventManager.access$1000(this.this$0), BluetoothEventManager.access$1300(this.this$0), bluetoothDevice);
            Log.d("BluetoothEventManager", "DeviceFoundHandler created new CachedBluetoothDevice: " + cachedDevice);
            BluetoothEventManager.access$1400(this.this$0, cachedDevice);
        }
        cachedDevice.setRssi(rssi);
        cachedDevice.setBtClass(btClass);
        cachedDevice.setName(name);
        cachedDevice.setVisible(true);
    }

    private BluetoothEventManager$DeviceFoundHandler(BluetoothEventManager bluetoothEventManager) {
        this.this$0 = bluetoothEventManager;
    }
}