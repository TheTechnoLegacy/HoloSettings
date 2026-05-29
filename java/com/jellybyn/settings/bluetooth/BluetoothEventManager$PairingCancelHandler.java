package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.jellybyn.settings.bluetooth.BluetoothEventManager.Handler;

class BluetoothEventManager$PairingCancelHandler implements Handler {
    final /* synthetic */ BluetoothEventManager this$0;

    public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice) {
        if (bluetoothDevice == null) {
            Log.e("BluetoothEventManager", "ACTION_PAIRING_CANCEL with no EXTRA_DEVICE");
        } else {
            Utils.showError(context, BluetoothEventManager.access$1200(this.this$0).findDevice(bluetoothDevice).getName(), 2131427712);
        }
    }

    private BluetoothEventManager$PairingCancelHandler(BluetoothEventManager bluetoothEventManager) {
        this.this$0 = bluetoothEventManager;
    }
}