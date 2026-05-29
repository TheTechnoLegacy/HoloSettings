package com.jellybyn.settings.bluetooth;

import android.content.Context;
import android.util.Log;

public final class LocalBluetoothManager {
    private static LocalBluetoothManager sInstance;
    private final CachedBluetoothDeviceManager mCachedDeviceManager;
    private final Context mContext;
    private BluetoothDiscoverableEnabler mDiscoverableEnabler;
    private final BluetoothEventManager mEventManager;
    private Context mForegroundActivity;
    private final LocalBluetoothAdapter mLocalAdapter;
    private final LocalBluetoothProfileManager mProfileManager;

    public static synchronized LocalBluetoothManager getInstance(Context context) {
        LocalBluetoothManager localBluetoothManager;
        synchronized (LocalBluetoothManager.class) {
            if (sInstance == null) {
                LocalBluetoothAdapter instance = LocalBluetoothAdapter.getInstance();
                if (instance == null) {
                    localBluetoothManager = null;
                } else {
                    sInstance = new LocalBluetoothManager(instance, context.getApplicationContext());
                }
            }
            localBluetoothManager = sInstance;
        }
        return localBluetoothManager;
    }

    synchronized void setForegroundActivity(Context context) {
        if (context != null) {
            Log.d("LocalBluetoothManager", "setting foreground activity to non-null context");
            this.mForegroundActivity = context;
        } else if (this.mForegroundActivity != null) {
            Log.d("LocalBluetoothManager", "setting foreground activity to null");
            this.mForegroundActivity = null;
        }
    }

    private LocalBluetoothManager(LocalBluetoothAdapter localBluetoothAdapter, Context context) {
        this.mContext = context;
        this.mLocalAdapter = localBluetoothAdapter;
        this.mCachedDeviceManager = new CachedBluetoothDeviceManager(context);
        this.mEventManager = new BluetoothEventManager(this.mLocalAdapter, this.mCachedDeviceManager, context);
        LocalBluetoothAdapter localBluetoothAdapter2 = this.mLocalAdapter;
        CachedBluetoothDeviceManager cachedBluetoothDeviceManager = this.mCachedDeviceManager;
        BluetoothEventManager bluetoothEventManager = this.mEventManager;
        this.mProfileManager = r0;
    }

    public void setDiscoverableEnabler(BluetoothDiscoverableEnabler bluetoothDiscoverableEnabler) {
        this.mDiscoverableEnabler = bluetoothDiscoverableEnabler;
    }

    public LocalBluetoothAdapter getBluetoothAdapter() {
        return this.mLocalAdapter;
    }

    CachedBluetoothDeviceManager getCachedDeviceManager() {
        return this.mCachedDeviceManager;
    }

    public BluetoothDiscoverableEnabler getDiscoverableEnabler() {
        return this.mDiscoverableEnabler;
    }

    BluetoothEventManager getEventManager() {
        return this.mEventManager;
    }

    public Context getForegroundActivity() {
        return this.mForegroundActivity;
    }

    LocalBluetoothProfileManager getProfileManager() {
        return this.mProfileManager;
    }

    boolean isForegroundActivity() {
        return this.mForegroundActivity != null;
    }
}