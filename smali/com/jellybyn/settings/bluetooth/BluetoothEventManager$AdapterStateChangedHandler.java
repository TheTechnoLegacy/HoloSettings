package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import com.jellybyn.settings.bluetooth.BluetoothEventManager.Handler;

class BluetoothEventManager$AdapterStateChangedHandler implements Handler {
    final /* synthetic */ BluetoothEventManager this$0;

    public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice) {
        int state = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE);
        BluetoothEventManager.access$1000(this.this$0).setBluetoothStateInt(state);
        synchronized (BluetoothEventManager.access$1100(this.this$0)) {
            for (BluetoothCallback onBluetoothStateChanged : BluetoothEventManager.access$1100(this.this$0)) {
                onBluetoothStateChanged.onBluetoothStateChanged(state);
            }
        }
        BluetoothEventManager.access$1200(this.this$0).onBluetoothStateChanged(state);
    }

    private BluetoothEventManager$AdapterStateChangedHandler(BluetoothEventManager bluetoothEventManager) {
        this.this$0 = bluetoothEventManager;
    }
}