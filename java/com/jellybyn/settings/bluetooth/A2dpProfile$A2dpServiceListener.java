package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothA2dp;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfile;
import android.bluetooth.BluetoothProfile.ServiceListener;
import android.util.Log;
import java.util.List;

final class A2dpProfile$A2dpServiceListener implements ServiceListener {
    final /* synthetic */ A2dpProfile this$0;

    public void onServiceConnected(int i, BluetoothProfile bluetoothProfile) {
        if (A2dpProfile.access$000()) {
            Log.d("A2dpProfile", "Bluetooth service connected");
        }
        A2dpProfile.access$102(this.this$0, (BluetoothA2dp) bluetoothProfile);
        List<BluetoothDevice> deviceList = A2dpProfile.access$100(this.this$0).getConnectedDevices();
        while (!deviceList.isEmpty()) {
            BluetoothDevice bluetoothDevice = (BluetoothDevice) deviceList.remove(0);
            CachedBluetoothDevice findDevice = A2dpProfile.access$200(this.this$0).findDevice(bluetoothDevice);
            if (findDevice == null) {
                Log.w("A2dpProfile", "A2dpProfile found new device: " + bluetoothDevice);
                findDevice = A2dpProfile.access$200(this.this$0).addDevice(A2dpProfile.access$300(this.this$0), A2dpProfile.access$400(this.this$0), bluetoothDevice);
            }
            findDevice.onProfileStateChanged(this.this$0, 2);
            findDevice.refresh();
        }
        A2dpProfile.access$502(this.this$0, true);
    }

    public void onServiceDisconnected(int i) {
        if (A2dpProfile.access$000()) {
            Log.d("A2dpProfile", "Bluetooth service disconnected");
        }
        A2dpProfile.access$502(this.this$0, false);
    }

    private A2dpProfile$A2dpServiceListener(A2dpProfile a2dpProfile) {
        this.this$0 = a2dpProfile;
    }
}