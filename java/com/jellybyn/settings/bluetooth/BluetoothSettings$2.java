package com.jellybyn.settings.bluetooth;

import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;

class BluetoothSettings$2 implements OnClickListener {
    final /* synthetic */ BluetoothSettings this$0;

    public void onClick(View view) {
        if (!(view.getTag() instanceof CachedBluetoothDevice)) {
            Log.w("BluetoothSettings", "onClick() called for other View: " + view);
        } else if (!BluetoothSettings.access$000(this.this$0).hasUserRestriction("no_config_bluetooth")) {
            CachedBluetoothDevice cachedBluetoothDevice = (CachedBluetoothDevice) view.getTag();
            Bundle bundle = new Bundle(1);
            bundle.putParcelable("device", cachedBluetoothDevice.getDevice());
            ((PreferenceActivity) this.this$0.getActivity()).startPreferencePanel(DeviceProfilesSettings.class.getName(), bundle, 2131427744, null, null, 0);
        }
    }

    BluetoothSettings$2(BluetoothSettings bluetoothSettings) {
        this.this$0 = bluetoothSettings;
    }
}