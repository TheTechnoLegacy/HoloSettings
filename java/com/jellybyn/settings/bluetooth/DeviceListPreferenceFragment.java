package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.util.Log;
import com.jellybyn.settings.SettingsPreferenceFragment;
import com.jellybyn.settings.bluetooth.BluetoothDeviceFilter.Filter;
import java.util.WeakHashMap;

public abstract class DeviceListPreferenceFragment extends SettingsPreferenceFragment implements BluetoothCallback {
    private PreferenceGroup mDeviceListGroup;
    final WeakHashMap<CachedBluetoothDevice, BluetoothDevicePreference> mDevicePreferenceMap = new WeakHashMap();
    private Filter mFilter = BluetoothDeviceFilter.ALL_FILTER;
    LocalBluetoothAdapter mLocalAdapter;
    LocalBluetoothManager mLocalManager;
    BluetoothDevice mSelectedDevice;

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if ("bt_scan".equals(preference.getKey())) {
            this.mLocalAdapter.startScanning(true);
            return true;
        } else if (!(preference instanceof BluetoothDevicePreference)) {
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        } else {
            BluetoothDevicePreference bluetoothDevicePreference = (BluetoothDevicePreference) preference;
            this.mSelectedDevice = bluetoothDevicePreference.getCachedDevice().getDevice();
            onDevicePreferenceClick(bluetoothDevicePreference);
            return true;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mLocalManager = LocalBluetoothManager.getInstance(getActivity());
        if (this.mLocalManager == null) {
            Log.e("DeviceListPreferenceFragment", "Bluetooth is not supported on this device");
            return;
        }
        this.mLocalAdapter = this.mLocalManager.getBluetoothAdapter();
        addPreferencesForActivity();
        this.mDeviceListGroup = (PreferenceCategory) findPreference("bt_device_list");
    }

    public void onPause() {
        super.onPause();
        if (this.mLocalManager != null) {
            removeAllDevices();
            this.mLocalManager.setForegroundActivity(null);
            this.mLocalManager.getEventManager().unregisterCallback(this);
        }
    }

    public void onResume() {
        super.onResume();
        if (this.mLocalManager != null) {
            this.mLocalManager.setForegroundActivity(getActivity());
            this.mLocalManager.getEventManager().registerCallback(this);
            updateProgressUi(this.mLocalAdapter.isDiscovering());
        }
    }

    void createDevicePreference(CachedBluetoothDevice cachedBluetoothDevice) {
        BluetoothDevicePreference preference = new BluetoothDevicePreference(getActivity(), cachedBluetoothDevice);
        initDevicePreference(preference);
        this.mDeviceListGroup.addPreference(preference);
        this.mDevicePreferenceMap.put(cachedBluetoothDevice, preference);
    }

    public void onDeviceAdded(CachedBluetoothDevice cachedBluetoothDevice) {
        if (this.mDevicePreferenceMap.get(cachedBluetoothDevice) == null && this.mLocalAdapter.getBluetoothState() == 12 && this.mFilter.matches(cachedBluetoothDevice.getDevice())) {
            createDevicePreference(cachedBluetoothDevice);
        }
    }

    DeviceListPreferenceFragment() {
    }

    void addCachedDevices() {
        for (CachedBluetoothDevice onDeviceAdded : this.mLocalManager.getCachedDeviceManager().getCachedDevicesCopy()) {
            onDeviceAdded(onDeviceAdded);
        }
    }

    public void onDeviceDeleted(CachedBluetoothDevice cachedBluetoothDevice) {
        BluetoothDevicePreference preference = (BluetoothDevicePreference) this.mDevicePreferenceMap.remove(cachedBluetoothDevice);
        if (preference != null) {
            this.mDeviceListGroup.removePreference(preference);
        }
    }

    void removeAllDevices() {
        this.mLocalAdapter.stopScanning();
        this.mDevicePreferenceMap.clear();
        this.mDeviceListGroup.removeAll();
    }

    private void updateProgressUi(boolean z) {
        if (this.mDeviceListGroup instanceof BluetoothProgressCategory) {
            ((BluetoothProgressCategory) this.mDeviceListGroup).setProgress(z);
        }
    }

    public void onBluetoothStateChanged(int i) {
        if (i == 10) {
            updateProgressUi(false);
        }
    }

    void onDevicePreferenceClick(BluetoothDevicePreference bluetoothDevicePreference) {
        bluetoothDevicePreference.onClicked();
    }

    public void onScanningStateChanged(boolean z) {
        updateProgressUi(z);
    }

    void setDeviceListGroup(PreferenceGroup preferenceGroup) {
        this.mDeviceListGroup = preferenceGroup;
    }

    final void setFilter(int i) {
        this.mFilter = BluetoothDeviceFilter.getFilter(i);
    }

    final void setFilter(Filter filter) {
        this.mFilter = filter;
    }

    void initDevicePreference(BluetoothDevicePreference bluetoothDevicePreference) {
    }

    abstract void addPreferencesForActivity();
}