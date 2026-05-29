package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothHeadset;
import android.bluetooth.BluetoothProfile;
import android.bluetooth.BluetoothProfile.ServiceListener;
import android.util.Log;
import java.util.List;

final class HeadsetProfile$HeadsetServiceListener implements ServiceListener {
    final /* synthetic */ HeadsetProfile this$0;

    public void onServiceConnected(int i, BluetoothProfile bluetoothProfile) {
        if (HeadsetProfile.access$000()) {
            Log.d("HeadsetProfile", "Bluetooth service connected");
        }
        HeadsetProfile.access$102(this.this$0, (BluetoothHeadset) bluetoothProfile);
        List<BluetoothDevice> deviceList = HeadsetProfile.access$100(this.this$0).getConnectedDevices();
        while (!deviceList.isEmpty()) {
            BluetoothDevice bluetoothDevice = (BluetoothDevice) deviceList.remove(0);
            CachedBluetoothDevice findDevice = HeadsetProfile.access$200(this.this$0).findDevice(bluetoothDevice);
            if (findDevice == null) {
                Log.w("HeadsetProfile", "HeadsetProfile found new device: " + bluetoothDevice);
                findDevice = HeadsetProfile.access$200(this.this$0).addDevice(HeadsetProfile.access$300(this.this$0), HeadsetProfile.access$400(this.this$0), bluetoothDevice);
            }
            findDevice.onProfileStateChanged(this.this$0, 2);
            findDevice.refresh();
        }
        HeadsetProfile.access$400(this.this$0).callServiceConnectedListeners();
        HeadsetProfile.access$502(this.this$0, true);
    }

    public void onServiceDisconnected(int i) {
        if (HeadsetProfile.access$000()) {
            Log.d("HeadsetProfile", "Bluetooth service disconnected");
        }
        HeadsetProfile.access$400(this.this$0).callServiceDisconnectedListeners();
        HeadsetProfile.access$502(this.this$0, false);
    }

    private HeadsetProfile$HeadsetServiceListener(HeadsetProfile headsetProfile) {
        this.this$0 = headsetProfile;
    }
}