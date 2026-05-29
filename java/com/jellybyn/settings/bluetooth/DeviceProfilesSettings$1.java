package com.jellybyn.settings.bluetooth;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class DeviceProfilesSettings$1 implements OnClickListener {
    final /* synthetic */ DeviceProfilesSettings this$0;
    final /* synthetic */ CachedBluetoothDevice val$device;
    final /* synthetic */ LocalBluetoothProfile val$profile;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.val$device.disconnect(this.val$profile);
        this.val$profile.setPreferred(this.val$device.getDevice(), false);
    }

    DeviceProfilesSettings$1(DeviceProfilesSettings deviceProfilesSettings, CachedBluetoothDevice cachedBluetoothDevice, LocalBluetoothProfile localBluetoothProfile) {
        this.this$0 = deviceProfilesSettings;
        this.val$device = cachedBluetoothDevice;
        this.val$profile = localBluetoothProfile;
    }
}