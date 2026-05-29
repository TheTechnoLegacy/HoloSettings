package com.jellybyn.settings.bluetooth;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class BluetoothSettings$1 extends BroadcastReceiver {
    final /* synthetic */ BluetoothSettings this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.bluetooth.adapter.action.LOCAL_NAME_CHANGED")) {
            updateDeviceName();
        }
    }

    private void updateDeviceName() {
        if (this.this$0.mLocalAdapter.isEnabled() && this.this$0.mMyDevicePreference != null) {
            this.this$0.mMyDevicePreference.setTitle(this.this$0.mLocalAdapter.getName());
        }
    }

    BluetoothSettings$1(BluetoothSettings bluetoothSettings) {
        this.this$0 = bluetoothSettings;
    }
}