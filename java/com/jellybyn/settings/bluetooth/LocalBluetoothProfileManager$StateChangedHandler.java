package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.jellybyn.settings.bluetooth.BluetoothEventManager.Handler;

class LocalBluetoothProfileManager$StateChangedHandler implements Handler {
    final LocalBluetoothProfile mProfile;
    final /* synthetic */ LocalBluetoothProfileManager this$0;

    public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice) {
        CachedBluetoothDevice cachedDevice = LocalBluetoothProfileManager.access$000(this.this$0).findDevice(bluetoothDevice);
        if (cachedDevice == null) {
            Log.w("LocalBluetoothProfileManager", "StateChangedHandler found new device: " + bluetoothDevice);
            cachedDevice = LocalBluetoothProfileManager.access$000(this.this$0).addDevice(LocalBluetoothProfileManager.access$100(this.this$0), this.this$0, bluetoothDevice);
        }
        int newState = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 0);
        int oldState = intent.getIntExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", 0);
        if (newState == 0 && oldState == 1) {
            Log.i("LocalBluetoothProfileManager", "Failed to connect " + this.mProfile + " device");
        }
        cachedDevice.onProfileStateChanged(this.mProfile, newState);
        cachedDevice.refresh();
    }

    LocalBluetoothProfileManager$StateChangedHandler(LocalBluetoothProfileManager localBluetoothProfileManager, LocalBluetoothProfile localBluetoothProfile) {
        this.this$0 = localBluetoothProfileManager;
        this.mProfile = localBluetoothProfile;
    }
}