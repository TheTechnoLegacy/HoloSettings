package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.jellybyn.settings.bluetooth.BluetoothEventManager.Handler;

class BluetoothEventManager$BondStateChangedHandler implements Handler {
    final /* synthetic */ BluetoothEventManager this$0;

    public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothDevice) {
        if (bluetoothDevice == null) {
            Log.e("BluetoothEventManager", "ACTION_BOND_STATE_CHANGED with no EXTRA_DEVICE");
            return;
        }
        int bondState = intent.getIntExtra("android.bluetooth.device.extra.BOND_STATE", Integer.MIN_VALUE);
        CachedBluetoothDevice cachedDevice = BluetoothEventManager.access$1200(this.this$0).findDevice(bluetoothDevice);
        if (cachedDevice == null) {
            Log.w("BluetoothEventManager", "CachedBluetoothDevice for device " + bluetoothDevice + " not found, calling readPairedDevices().");
            if (this.this$0.readPairedDevices()) {
                cachedDevice = BluetoothEventManager.access$1200(this.this$0).findDevice(bluetoothDevice);
                if (cachedDevice == null) {
                    Log.e("BluetoothEventManager", "Got bonding state changed for " + bluetoothDevice + ", but device not added in cache.");
                    return;
                }
            }
            Log.e("BluetoothEventManager", "Got bonding state changed for " + bluetoothDevice + ", but we have no record of that device.");
            return;
        }
        synchronized (BluetoothEventManager.access$1100(this.this$0)) {
            for (BluetoothCallback onDeviceBondStateChanged : BluetoothEventManager.access$1100(this.this$0)) {
                onDeviceBondStateChanged.onDeviceBondStateChanged(cachedDevice, bondState);
            }
        }
        cachedDevice.onBondingStateChanged(bondState);
        if (bondState == 10) {
            if (bluetoothDevice.isBluetoothDock()) {
                LocalBluetoothPreferences.removeDockAutoConnectSetting(context, bluetoothDevice.getAddress());
                if (!bluetoothDevice.getAddress().equals(BluetoothEventManager.access$1500(context))) {
                    cachedDevice.setVisible(false);
                }
            }
            showUnbondMessage(context, cachedDevice.getName(), intent.getIntExtra("android.bluetooth.device.extra.REASON", Integer.MIN_VALUE));
        }
    }

    private void showUnbondMessage(Context context, String str, int i) {
        int errorMsg;
        switch (i) {
            case 1:
                errorMsg = 2131427713;
                break;
            case 2:
                errorMsg = 2131427715;
                break;
            case 4:
                errorMsg = 2131427714;
                break;
            case 5:
            case 6:
            case 7:
            case 8:
                errorMsg = 2131427712;
                break;
            default:
                Log.w("BluetoothEventManager", "showUnbondMessage: Not displaying any message for reason: " + i);
                return;
        }
        Utils.showError(context, str, errorMsg);
    }

    private BluetoothEventManager$BondStateChangedHandler(BluetoothEventManager bluetoothEventManager) {
        this.this$0 = bluetoothEventManager;
    }
}