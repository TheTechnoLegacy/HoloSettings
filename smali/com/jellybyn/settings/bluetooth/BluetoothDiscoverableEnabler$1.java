package com.jellybyn.settings.bluetooth;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class BluetoothDiscoverableEnabler$1 extends BroadcastReceiver {
    final /* synthetic */ BluetoothDiscoverableEnabler this$0;

    public void onReceive(Context context, Intent intent) {
        if ("android.bluetooth.adapter.action.SCAN_MODE_CHANGED".equals(intent.getAction())) {
            int intExtra = intent.getIntExtra("android.bluetooth.adapter.extra.SCAN_MODE", Integer.MIN_VALUE);
            if (intExtra != Integer.MIN_VALUE) {
                this.this$0.handleModeChanged(intExtra);
            }
        }
    }

    BluetoothDiscoverableEnabler$1(BluetoothDiscoverableEnabler bluetoothDiscoverableEnabler) {
        this.this$0 = bluetoothDiscoverableEnabler;
    }
}