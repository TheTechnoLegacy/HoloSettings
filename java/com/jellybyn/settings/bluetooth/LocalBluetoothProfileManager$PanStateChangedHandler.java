package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager.StateChangedHandler;

class LocalBluetoothProfileManager$PanStateChangedHandler extends StateChangedHandler {
    final /* synthetic */ LocalBluetoothProfileManager this$0;

    public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice) {
        this.mProfile.setLocalRole(bluetoothDevice, intent.getIntExtra("android.bluetooth.pan.extra.LOCAL_ROLE", 0));
        super.onReceive(context, intent, bluetoothDevice);
    }

    LocalBluetoothProfileManager$PanStateChangedHandler(LocalBluetoothProfileManager localBluetoothProfileManager, LocalBluetoothProfile localBluetoothProfile) {
        this.this$0 = localBluetoothProfileManager;
    }
}