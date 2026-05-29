package com.jellybyn.settings.bluetooth;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class BluetoothNameDialogFragment$1 extends BroadcastReceiver {
    final /* synthetic */ BluetoothNameDialogFragment this$0;

    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (action.equals("android.bluetooth.adapter.action.LOCAL_NAME_CHANGED")) {
            this.this$0.updateDeviceName();
        } else if (action.equals("android.bluetooth.adapter.action.STATE_CHANGED") && intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE) == 12) {
            this.this$0.updateDeviceName();
        }
    }

    BluetoothNameDialogFragment$1(BluetoothNameDialogFragment bluetoothNameDialogFragment) {
        this.this$0 = bluetoothNameDialogFragment;
    }
}