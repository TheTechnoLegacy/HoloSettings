package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class BluetoothPermissionActivity$1 extends BroadcastReceiver {
    final /* synthetic */ BluetoothPermissionActivity this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.bluetooth.device.action.CONNECTION_ACCESS_CANCEL")) {
            if (BluetoothPermissionActivity.access$000(this.this$0).equals((BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE"))) {
                BluetoothPermissionActivity.access$100(this.this$0);
            }
        }
    }

    BluetoothPermissionActivity$1(BluetoothPermissionActivity bluetoothPermissionActivity) {
        this.this$0 = bluetoothPermissionActivity;
    }
}