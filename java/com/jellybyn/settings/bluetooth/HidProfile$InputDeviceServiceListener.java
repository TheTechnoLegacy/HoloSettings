package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothInputDevice;
import android.bluetooth.BluetoothProfile;
import android.bluetooth.BluetoothProfile.ServiceListener;
import android.util.Log;
import java.util.List;

final class HidProfile$InputDeviceServiceListener implements ServiceListener {
    final /* synthetic */ HidProfile this$0;

    public void onServiceConnected(int i, BluetoothProfile bluetoothProfile) {
        if (HidProfile.access$000()) {
            Log.d("HidProfile", "Bluetooth service connected");
        }
        HidProfile.access$102(this.this$0, (BluetoothInputDevice) bluetoothProfile);
        List<BluetoothDevice> deviceList = HidProfile.access$100(this.this$0).getConnectedDevices();
        while (!deviceList.isEmpty()) {
            BluetoothDevice bluetoothDevice = (BluetoothDevice) deviceList.remove(0);
            CachedBluetoothDevice findDevice = HidProfile.access$200(this.this$0).findDevice(bluetoothDevice);
            if (findDevice == null) {
                Log.w("HidProfile", "HidProfile found new device: " + bluetoothDevice);
                findDevice = HidProfile.access$200(this.this$0).addDevice(HidProfile.access$300(this.this$0), HidProfile.access$400(this.this$0), bluetoothDevice);
            }
            findDevice.onProfileStateChanged(this.this$0, 2);
            findDevice.refresh();
        }
        HidProfile.access$502(this.this$0, true);
    }

    public void onServiceDisconnected(int i) {
        if (HidProfile.access$000()) {
            Log.d("HidProfile", "Bluetooth service disconnected");
        }
        HidProfile.access$502(this.this$0, false);
    }

    private HidProfile$InputDeviceServiceListener(HidProfile hidProfile) {
        this.this$0 = hidProfile;
    }
}