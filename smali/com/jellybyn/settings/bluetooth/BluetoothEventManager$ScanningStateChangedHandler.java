package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import com.jellybyn.settings.bluetooth.BluetoothEventManager.Handler;

class BluetoothEventManager$ScanningStateChangedHandler implements Handler {
    private final boolean mStarted;
    final /* synthetic */ BluetoothEventManager this$0;

    public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice) {
        synchronized (BluetoothEventManager.access$1100(this.this$0)) {
            for (BluetoothCallback onScanningStateChanged : BluetoothEventManager.access$1100(this.this$0)) {
                onScanningStateChanged.onScanningStateChanged(this.mStarted);
            }
        }
        BluetoothEventManager.access$1200(this.this$0).onScanningStateChanged(this.mStarted);
        LocalBluetoothPreferences.persistDiscoveringTimestamp(context);
    }

    BluetoothEventManager$ScanningStateChangedHandler(BluetoothEventManager bluetoothEventManager, boolean z) {
        this.this$0 = bluetoothEventManager;
        this.mStarted = z;
    }
}