package com.jellybyn.settings;

import android.bluetooth.BluetoothPan;
import android.bluetooth.BluetoothProfile;
import android.bluetooth.BluetoothProfile.ServiceListener;

class TetherSettings$1 implements ServiceListener {
    final /* synthetic */ TetherSettings this$0;

    public void onServiceConnected(int i, BluetoothProfile bluetoothProfile) {
        TetherSettings.access$000(this.this$0).set((BluetoothPan) bluetoothProfile);
    }

    public void onServiceDisconnected(int i) {
        TetherSettings.access$000(this.this$0).set(null);
    }

    TetherSettings$1(TetherSettings tetherSettings) {
        this.this$0 = tetherSettings;
    }
}