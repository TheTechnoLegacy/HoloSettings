package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class BluetoothPairingDialog$1 extends BroadcastReceiver {
    final /* synthetic */ BluetoothPairingDialog this$0;

    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if ("android.bluetooth.device.action.BOND_STATE_CHANGED".equals(action)) {
            int intExtra = intent.getIntExtra("android.bluetooth.device.extra.BOND_STATE", Integer.MIN_VALUE);
            if (intExtra == 12 || intExtra == 10) {
                this.this$0.dismiss();
            }
        } else if ("android.bluetooth.device.action.PAIRING_CANCEL".equals(action)) {
            BluetoothDevice device = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            if (device == null || device.equals(BluetoothPairingDialog.access$000(this.this$0))) {
                this.this$0.dismiss();
            }
        }
    }

    BluetoothPairingDialog$1(BluetoothPairingDialog bluetoothPairingDialog) {
        this.this$0 = bluetoothPairingDialog;
    }
}