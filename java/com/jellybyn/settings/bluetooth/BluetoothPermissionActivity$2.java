package com.jellybyn.settings.bluetooth;

import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;

class BluetoothPermissionActivity$2 implements OnCheckedChangeListener {
    final /* synthetic */ BluetoothPermissionActivity this$0;

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        if (z) {
            BluetoothPermissionActivity.access$202(this.this$0, true);
        } else {
            BluetoothPermissionActivity.access$202(this.this$0, false);
        }
    }

    BluetoothPermissionActivity$2(BluetoothPermissionActivity bluetoothPermissionActivity) {
        this.this$0 = bluetoothPermissionActivity;
    }
}