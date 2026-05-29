package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.jellybyn.settings.bluetooth.BluetoothEventManager.Handler;

class BluetoothEventManager$1 extends BroadcastReceiver {
    final /* synthetic */ BluetoothEventManager this$0;

    public void onReceive(Context context, Intent intent) {
        BluetoothDevice device = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
        Handler handler = (Handler) BluetoothEventManager.access$900(this.this$0).get(intent.getAction());
        if (handler != null) {
            handler.onReceive(context, intent, device);
        }
    }

    BluetoothEventManager$1(BluetoothEventManager bluetoothEventManager) {
        this.this$0 = bluetoothEventManager;
    }
}