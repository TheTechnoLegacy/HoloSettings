package com.jellybyn.settings.bluetooth;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class BluetoothDevicePreference$1 implements OnClickListener {
    final /* synthetic */ BluetoothDevicePreference this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        BluetoothDevicePreference.access$000(this.this$0).disconnect();
    }

    BluetoothDevicePreference$1(BluetoothDevicePreference bluetoothDevicePreference) {
        this.this$0 = bluetoothDevicePreference;
    }
}