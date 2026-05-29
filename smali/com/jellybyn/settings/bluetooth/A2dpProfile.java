package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothA2dp;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothUuid;
import android.content.Context;
import android.os.ParcelUuid;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;

final class A2dpProfile implements LocalBluetoothProfile {
    static final ParcelUuid[] SINK_UUIDS = new ParcelUuid[]{BluetoothUuid.AudioSink, BluetoothUuid.AdvAudioDist};
    private static boolean V = true;
    private final CachedBluetoothDeviceManager mDeviceManager;
    private boolean mIsProfileReady;
    private final LocalBluetoothAdapter mLocalAdapter;
    private final LocalBluetoothProfileManager mProfileManager;
    private BluetoothA2dp mService;

    public boolean connect(BluetoothDevice bluetoothDevice) {
        if (this.mService == null) {
            return false;
        }
        List<BluetoothDevice> sinks = getConnectedDevices();
        if (sinks != null) {
            for (BluetoothDevice disconnect : sinks) {
                this.mService.disconnect(disconnect);
            }
        }
        return this.mService.connect(bluetoothDevice);
    }

    protected void finalize() {
        if (V) {
            Log.d("A2dpProfile", "finalize()");
        }
        if (this.mService != null) {
            try {
                BluetoothAdapter.getDefaultAdapter().closeProfileProxy(2, this.mService);
                this.mService = null;
            } catch (Throwable t) {
                Log.w("A2dpProfile", "Error cleaning up A2DP proxy", t);
            }
        }
    }

    boolean isA2dpPlaying() {
        if (this.mService == null) {
            return false;
        }
        List<BluetoothDevice> sinks = this.mService.getConnectedDevices();
        return !sinks.isEmpty() && this.mService.isA2dpPlaying((BluetoothDevice) sinks.get(0));
    }

    A2dpProfile(Context context, LocalBluetoothAdapter localBluetoothAdapter, CachedBluetoothDeviceManager cachedBluetoothDeviceManager, LocalBluetoothProfileManager localBluetoothProfileManager) {
        this.mLocalAdapter = localBluetoothAdapter;
        this.mDeviceManager = cachedBluetoothDeviceManager;
        this.mProfileManager = localBluetoothProfileManager;
        this.mLocalAdapter.getProfileProxy(context, new A2dpServiceListener(this, null), 2);
    }

    public int getSummaryResourceForDevice(BluetoothDevice bluetoothDevice) {
        int state = getConnectionStatus(bluetoothDevice);
        switch (state) {
            case 0:
                return 2131427757;
            case 2:
                return 2131427750;
            default:
                return Utils.getConnectionStateSummary(state);
        }
    }

    public void setPreferred(BluetoothDevice bluetoothDevice, boolean z) {
        if (this.mService != null) {
            if (!z) {
                this.mService.setPriority(bluetoothDevice, 0);
            } else if (this.mService.getPriority(bluetoothDevice) < 100) {
                this.mService.setPriority(bluetoothDevice, 100);
            }
        }
    }

    public boolean disconnect(BluetoothDevice bluetoothDevice) {
        if (this.mService == null) {
            return false;
        }
        if (this.mService.getPriority(bluetoothDevice) > 100) {
            this.mService.setPriority(bluetoothDevice, 100);
        }
        return this.mService.disconnect(bluetoothDevice);
    }

    public int getConnectionStatus(BluetoothDevice bluetoothDevice) {
        return this.mService == null ? 0 : this.mService.getConnectionState(bluetoothDevice);
    }

    public List<BluetoothDevice> getConnectedDevices() {
        return this.mService == null ? new ArrayList(0) : this.mService.getDevicesMatchingConnectionStates(new int[]{2, 1, 3});
    }

    public int getPreferred(BluetoothDevice bluetoothDevice) {
        return this.mService == null ? 0 : this.mService.getPriority(bluetoothDevice);
    }

    public boolean isPreferred(BluetoothDevice bluetoothDevice) {
        return this.mService != null && this.mService.getPriority(bluetoothDevice) > 0;
    }

    public int getDrawableResource(BluetoothClass bluetoothClass) {
        return 2130837571;
    }

    public int getNameResource(BluetoothDevice bluetoothDevice) {
        return 2131427733;
    }

    public int getOrdinal() {
        return 1;
    }

    public boolean isAutoConnectable() {
        return true;
    }

    public boolean isConnectable() {
        return true;
    }

    public boolean isProfileReady() {
        return this.mIsProfileReady;
    }

    public String toString() {
        return "A2DP";
    }
}