package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Intent;
import android.os.Bundle;
import android.os.UserManager;

public final class DevicePickerFragment extends DeviceListPreferenceFragment {
    private String mLaunchClass;
    private String mLaunchPackage;
    private boolean mNeedAuth;
    private boolean mStartScanOnResume;

    void addPreferencesForActivity() {
        addPreferencesFromResource(2131034128);
        Intent intent = getActivity().getIntent();
        this.mNeedAuth = intent.getBooleanExtra("android.bluetooth.devicepicker.extra.NEED_AUTH", false);
        setFilter(intent.getIntExtra("android.bluetooth.devicepicker.extra.FILTER_TYPE", 0));
        this.mLaunchPackage = intent.getStringExtra("android.bluetooth.devicepicker.extra.LAUNCH_PACKAGE");
        this.mLaunchClass = intent.getStringExtra("android.bluetooth.devicepicker.extra.DEVICE_PICKER_LAUNCH_CLASS");
    }

    void onDevicePreferenceClick(BluetoothDevicePreference bluetoothDevicePreference) {
        this.mLocalAdapter.stopScanning();
        LocalBluetoothPreferences.persistSelectedDeviceInPicker(getActivity(), this.mSelectedDevice.getAddress());
        if (bluetoothDevicePreference.getCachedDevice().getBondState() == 12 || !this.mNeedAuth) {
            sendDevicePickedIntent(this.mSelectedDevice);
            finish();
            return;
        }
        super.onDevicePreferenceClick(bluetoothDevicePreference);
    }

    private void sendDevicePickedIntent(BluetoothDevice bluetoothDevice) {
        Intent intent = new Intent("android.bluetooth.devicepicker.action.DEVICE_SELECTED");
        intent.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothDevice);
        if (!(this.mLaunchPackage == null || this.mLaunchClass == null)) {
            intent.setClassName(this.mLaunchPackage, this.mLaunchClass);
        }
        getActivity().sendBroadcast(intent);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getActivity().setTitle(getString(2131427457));
        boolean z = !((UserManager) getSystemService("user")).hasUserRestriction("no_config_bluetooth") && bundle == null;
        this.mStartScanOnResume = z;
    }

    public void onDeviceBondStateChanged(CachedBluetoothDevice cachedBluetoothDevice, int i) {
        if (i == 12) {
            BluetoothDevice device = cachedBluetoothDevice.getDevice();
            if (device.equals(this.mSelectedDevice)) {
                sendDevicePickedIntent(device);
                finish();
            }
        }
    }

    public void onResume() {
        super.onResume();
        addCachedDevices();
        if (this.mStartScanOnResume) {
            this.mLocalAdapter.startScanning(true);
            this.mStartScanOnResume = false;
        }
    }

    public void onBluetoothStateChanged(int i) {
        super.onBluetoothStateChanged(i);
        if (i == 12) {
            this.mLocalAdapter.startScanning(false);
        }
    }
}