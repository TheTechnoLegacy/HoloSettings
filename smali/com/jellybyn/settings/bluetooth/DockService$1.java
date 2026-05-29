package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;

class DockService$1 implements Runnable {
    final /* synthetic */ DockService this$0;
    final /* synthetic */ BluetoothDevice val$d;
    final /* synthetic */ int val$startId;
    final /* synthetic */ int val$state;

    public void run() {
        DockService.access$200(this.this$0, this.val$d, this.val$state, this.val$startId);
    }

    DockService$1(DockService dockService, BluetoothDevice bluetoothDevice, int i, int i2) {
        this.this$0 = dockService;
        this.val$d = bluetoothDevice;
        this.val$state = i;
        this.val$startId = i2;
    }
}