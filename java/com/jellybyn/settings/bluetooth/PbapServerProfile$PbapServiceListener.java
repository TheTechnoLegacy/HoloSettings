package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothPbap;
import android.bluetooth.BluetoothPbap.ServiceListener;
import android.util.Log;

final class PbapServerProfile$PbapServiceListener implements ServiceListener {
    final /* synthetic */ PbapServerProfile this$0;

    public void onServiceConnected(BluetoothPbap bluetoothPbap) {
        if (PbapServerProfile.access$000()) {
            Log.d("PbapServerProfile", "Bluetooth service connected");
        }
        PbapServerProfile.access$102(this.this$0, bluetoothPbap);
        PbapServerProfile.access$202(this.this$0, true);
    }

    public void onServiceDisconnected() {
        if (PbapServerProfile.access$000()) {
            Log.d("PbapServerProfile", "Bluetooth service disconnected");
        }
        PbapServerProfile.access$202(this.this$0, false);
    }

    private PbapServerProfile$PbapServiceListener(PbapServerProfile pbapServerProfile) {
        this.this$0 = pbapServerProfile;
    }
}