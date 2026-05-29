package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothPan;
import android.bluetooth.BluetoothProfile;
import android.bluetooth.BluetoothProfile.ServiceListener;
import android.util.Log;

final class PanProfile$PanServiceListener implements ServiceListener {
    final /* synthetic */ PanProfile this$0;

    public void onServiceConnected(int i, BluetoothProfile bluetoothProfile) {
        if (PanProfile.access$000()) {
            Log.d("PanProfile", "Bluetooth service connected");
        }
        PanProfile.access$102(this.this$0, (BluetoothPan) bluetoothProfile);
        PanProfile.access$202(this.this$0, true);
    }

    public void onServiceDisconnected(int i) {
        if (PanProfile.access$000()) {
            Log.d("PanProfile", "Bluetooth service disconnected");
        }
        PanProfile.access$202(this.this$0, false);
    }

    private PanProfile$PanServiceListener(PanProfile panProfile) {
        this.this$0 = panProfile;
    }
}