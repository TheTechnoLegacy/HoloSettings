package com.jellybyn.settings.bluetooth;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Notification;
import android.app.Service;
import android.bluetooth.BluetoothDevice;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnMultiChoiceClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.provider.Settings.Global;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton.OnCheckedChangeListener;
import com.jellybyn.settings.bluetooth.LocalBluetoothProfileManager.ServiceListener;
import java.util.Collection;
import java.util.Set;

public final class DockService extends Service implements ServiceListener {
    private CheckBox mAudioMediaCheckbox;
    private final OnCheckedChangeListener mCheckedChangeListener = new 2(this);
    private boolean[] mCheckedItems;
    private final OnClickListener mClickListener = new 2(this);
    private BluetoothDevice mDevice;
    private CachedBluetoothDeviceManager mDeviceManager;
    private AlertDialog mDialog;
    private final OnDismissListener mDismissListener = new 2(this);
    private LocalBluetoothAdapter mLocalAdapter;
    private final OnMultiChoiceClickListener mMultiClickListener = new 2(this);
    private BluetoothDevice mPendingDevice;
    private int mPendingStartId;
    private int mPendingTurnOffStartId = -100;
    private int mPendingTurnOnStartId = -100;
    private LocalBluetoothProfileManager mProfileManager;
    private LocalBluetoothProfile[] mProfiles;
    private Runnable mRunnable;
    private volatile ServiceHandler mServiceHandler;
    private volatile Looper mServiceLooper;
    private int mStartIdAssociatedWithDialog;

    private void createDialog(BluetoothDevice bluetoothDevice, int i, int i2) {
        if (this.mDialog != null) {
            this.mDialog.dismiss();
            this.mDialog = null;
        }
        this.mDevice = bluetoothDevice;
        switch (i) {
            case 1:
            case 2:
            case 3:
            case 4:
                View view;
                startForeground(0, new Notification());
                Builder ab = new Builder(this);
                LayoutInflater inflater = (LayoutInflater) getSystemService("layout_inflater");
                this.mAudioMediaCheckbox = null;
                if (bluetoothDevice != null) {
                    boolean z = !LocalBluetoothPreferences.hasDockAutoConnectSetting(this, bluetoothDevice.getAddress());
                    CharSequence[] initBtSettings = initBtSettings(bluetoothDevice, i, z);
                    ab.setTitle(getString(2131427763));
                    ab.setMultiChoiceItems(initBtSettings, this.mCheckedItems, this.mMultiClickListener);
                    view = inflater.inflate(2130968683, null);
                    CheckBox checkBox = (CheckBox) view.findViewById(2131231010);
                    boolean z2 = z || LocalBluetoothPreferences.getDockAutoConnectSetting(this, bluetoothDevice.getAddress());
                    checkBox.setChecked(z2);
                    checkBox.setOnCheckedChangeListener(this.mCheckedChangeListener);
                } else {
                    ab.setTitle(getString(2131427763));
                    view = inflater.inflate(2130968626, null);
                    this.mAudioMediaCheckbox = (CheckBox) view.findViewById(2131230841);
                    this.mAudioMediaCheckbox.setChecked(Global.getInt(getContentResolver(), "dock_audio_media_enabled", 0) == 1);
                    this.mAudioMediaCheckbox.setOnCheckedChangeListener(this.mCheckedChangeListener);
                }
                float f = getResources().getDisplayMetrics().density;
                ab.setView(view, (int) (14.0f * f), 0, (int) (14.0f * f), 0);
                ab.setPositiveButton(getString(17039370), this.mClickListener);
                this.mStartIdAssociatedWithDialog = i2;
                this.mDialog = ab.create();
                this.mDialog.getWindow().setType(2009);
                this.mDialog.setOnDismissListener(this.mDismissListener);
                this.mDialog.show();
                return;
            default:
                return;
        }
    }

    private synchronized void applyBtSettings(BluetoothDevice bluetoothDevice, int i) {
        if (bluetoothDevice != null) {
            if (!(this.mProfiles == null || this.mCheckedItems == null || this.mLocalAdapter == null)) {
                for (boolean z : this.mCheckedItems) {
                    if (z) {
                        int bluetoothState = this.mLocalAdapter.getBluetoothState();
                        this.mLocalAdapter.enable();
                        if (bluetoothState != 12) {
                            if (this.mPendingDevice == null || !this.mPendingDevice.equals(this.mDevice)) {
                                this.mPendingDevice = bluetoothDevice;
                                this.mPendingStartId = i;
                                if (bluetoothState != 11) {
                                    getPrefs().edit().putBoolean("disable_bt_when_undock", true).apply();
                                }
                            }
                        }
                    }
                }
                this.mPendingDevice = null;
                boolean callConnect = false;
                CachedBluetoothDevice cachedDevice = getCachedBluetoothDevice(bluetoothDevice);
                for (int i2 = 0; i2 < this.mProfiles.length; i2++) {
                    LocalBluetoothProfile localBluetoothProfile = this.mProfiles[i2];
                    if (this.mCheckedItems[i2]) {
                        callConnect = true;
                    } else if (!this.mCheckedItems[i2] && localBluetoothProfile.getConnectionStatus(cachedDevice.getDevice()) == 2) {
                        cachedDevice.disconnect(this.mProfiles[i2]);
                    }
                    localBluetoothProfile.setPreferred(bluetoothDevice, this.mCheckedItems[i2]);
                }
                if (callConnect) {
                    cachedDevice.connect(false);
                }
            }
        }
    }

    private CharSequence[] initBtSettings(BluetoothDevice bluetoothDevice, int i, boolean z) {
        int numOfProfiles;
        switch (i) {
            case 1:
            case 3:
            case 4:
                numOfProfiles = 1;
                break;
            case 2:
                numOfProfiles = 2;
                break;
            default:
                return null;
        }
        this.mProfiles = new LocalBluetoothProfile[numOfProfiles];
        this.mCheckedItems = new boolean[numOfProfiles];
        CharSequence[] items = new CharSequence[numOfProfiles];
        switch (i) {
            case 1:
            case 3:
            case 4:
                items[0] = getString(2131427765);
                this.mProfiles[0] = this.mProfileManager.getA2dpProfile();
                if (z) {
                    this.mCheckedItems[0] = false;
                    return items;
                }
                this.mCheckedItems[0] = this.mProfiles[0].isPreferred(bluetoothDevice);
                return items;
            case 2:
                items[0] = getString(2131427764);
                items[1] = getString(2131427765);
                this.mProfiles[0] = this.mProfileManager.getHeadsetProfile();
                this.mProfiles[1] = this.mProfileManager.getA2dpProfile();
                if (z) {
                    this.mCheckedItems[0] = true;
                    this.mCheckedItems[1] = true;
                    return items;
                }
                this.mCheckedItems[0] = this.mProfiles[0].isPreferred(bluetoothDevice);
                this.mCheckedItems[1] = this.mProfiles[1].isPreferred(bluetoothDevice);
                return items;
            default:
                return items;
        }
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        if (intent == null) {
            DockEventReceiver.finishStartingService(this, i2);
        } else if ("android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction())) {
            handleBtStateChange(intent, i2);
        } else {
            SharedPreferences prefs = getPrefs();
            BluetoothDevice bluetoothDevice;
            int i3;
            if ("android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED".equals(intent.getAction())) {
                bluetoothDevice = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                i3 = prefs.getInt("connect_retry_count", 0);
                if (i3 < 6) {
                    prefs.edit().putInt("connect_retry_count", i3 + 1).apply();
                    handleUnexpectedDisconnect(bluetoothDevice, this.mProfileManager.getHeadsetProfile(), i2);
                }
            } else if ("android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED".equals(intent.getAction())) {
                bluetoothDevice = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                i3 = prefs.getInt("connect_retry_count", 0);
                if (i3 < 6) {
                    prefs.edit().putInt("connect_retry_count", i3 + 1).apply();
                    handleUnexpectedDisconnect(bluetoothDevice, this.mProfileManager.getA2dpProfile(), i2);
                }
            } else {
                Message msg = parseIntent(intent);
                if (msg == null) {
                    DockEventReceiver.finishStartingService(this, i2);
                } else {
                    if (msg.what == 222) {
                        prefs.edit().remove("connect_retry_count").apply();
                    }
                    msg.arg2 = i2;
                    processMessage(msg);
                }
            }
        }
        return 2;
    }

    private void handleBluetoothStateOn(int i) {
        if (this.mPendingDevice != null) {
            if (this.mPendingDevice.equals(this.mDevice)) {
                applyBtSettings(this.mPendingDevice, this.mPendingStartId);
            }
            this.mPendingDevice = null;
            DockEventReceiver.finishStartingService(this, this.mPendingStartId);
        } else {
            SharedPreferences prefs = getPrefs();
            Intent i2 = registerReceiver(null, new IntentFilter("android.intent.action.DOCK_EVENT"));
            if (i2 != null) {
                if (i2.getIntExtra("android.intent.extra.DOCK_STATE", 0) != 0) {
                    BluetoothDevice bluetoothDevice = (BluetoothDevice) i2.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                    if (bluetoothDevice != null) {
                        connectIfEnabled(bluetoothDevice);
                    }
                } else if (prefs.getBoolean("disable_bt", false) && this.mLocalAdapter.disable()) {
                    this.mPendingTurnOffStartId = i;
                    prefs.edit().remove("disable_bt").apply();
                    return;
                }
            }
        }
        if (this.mPendingTurnOnStartId != -100) {
            DockEventReceiver.finishStartingService(this, this.mPendingTurnOnStartId);
            this.mPendingTurnOnStartId = -100;
        }
        DockEventReceiver.finishStartingService(this, i);
    }

    private synchronized void processMessage(Message message) {
        int msgType = message.what;
        int state = message.arg1;
        int startId = message.arg2;
        BluetoothDevice device = null;
        if (message.obj != null) {
            device = message.obj;
        }
        boolean deferFinishCall = false;
        switch (msgType) {
            case 111:
                if (device != null) {
                    createDialog(device, state, startId);
                    break;
                }
                break;
            case 222:
                deferFinishCall = msgTypeDocked(device, state, startId);
                break;
            case 333:
                msgTypeUndockedTemporary(device, state, startId);
                break;
            case 444:
                deferFinishCall = msgTypeUndockedPermanent(device, startId);
                break;
            case 555:
                deferFinishCall = msgTypeDisableBluetooth(startId);
                break;
        }
        if (this.mDialog == null && this.mPendingDevice == null && msgType != 333 && !deferFinishCall) {
            DockEventReceiver.finishStartingService(this, startId);
        }
    }

    private void handleBtStateChange(Intent intent, int i) {
        int btState = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE);
        synchronized (this) {
            if (btState == 12) {
                handleBluetoothStateOn(i);
            } else if (btState == 13) {
                getPrefs().edit().remove("disable_bt_when_undock").apply();
                DockEventReceiver.finishStartingService(this, i);
            } else if (btState == 10) {
                if (this.mPendingTurnOffStartId != -100) {
                    DockEventReceiver.finishStartingService(this, this.mPendingTurnOffStartId);
                    getPrefs().edit().remove("disable_bt").apply();
                    this.mPendingTurnOffStartId = -100;
                }
                if (this.mPendingDevice != null) {
                    this.mLocalAdapter.enable();
                    this.mPendingTurnOnStartId = i;
                } else {
                    DockEventReceiver.finishStartingService(this, i);
                }
            }
        }
    }

    private boolean msgTypeDocked(BluetoothDevice bluetoothDevice, int i, int i2) {
        this.mServiceHandler.removeMessages(444);
        this.mServiceHandler.removeMessages(555);
        getPrefs().edit().remove("disable_bt").apply();
        if (bluetoothDevice != null) {
            if (!bluetoothDevice.equals(this.mDevice)) {
                if (this.mDevice != null) {
                    handleUndocked(this.mDevice);
                }
                this.mDevice = bluetoothDevice;
                this.mProfileManager.addServiceListener(this);
                if (this.mProfileManager.isManagerReady()) {
                    handleDocked(bluetoothDevice, i, i2);
                    this.mProfileManager.removeServiceListener(this);
                } else {
                    this.mRunnable = new 1(this, bluetoothDevice, i, i2);
                    return true;
                }
            }
        } else if (Global.getInt(getContentResolver(), "dock_audio_media_enabled", -1) == -1 && i == 3) {
            handleDocked(null, i, i2);
            return true;
        }
        return false;
    }

    private Message parseIntent(Intent intent) {
        int msgType;
        BluetoothDevice device = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
        int state = intent.getIntExtra("android.intent.extra.DOCK_STATE", -1234);
        switch (state) {
            case 0:
                msgType = 333;
                break;
            case 1:
            case 2:
            case 4:
                if (device == null) {
                    Log.w("DockService", "device is null");
                    return null;
                }
                break;
            case 3:
                break;
            default:
                return null;
        }
        if (!"com.jellybyn.settings.bluetooth.action.DOCK_SHOW_UI".equals(intent.getAction())) {
            msgType = 222;
        } else if (device == null) {
            Log.w("DockService", "device is null");
            return null;
        } else {
            msgType = 111;
        }
        return this.mServiceHandler.obtainMessage(msgType, state, 0, device);
    }

    public void onDestroy() {
        this.mRunnable = null;
        if (this.mDialog != null) {
            this.mDialog.dismiss();
            this.mDialog = null;
        }
        if (this.mProfileManager != null) {
            this.mProfileManager.removeServiceListener(this);
        }
        if (this.mServiceLooper != null) {
            this.mServiceLooper.quit();
        }
        this.mLocalAdapter = null;
        this.mDeviceManager = null;
        this.mProfileManager = null;
        this.mServiceLooper = null;
        this.mServiceHandler = null;
    }

    public void onCreate() {
        LocalBluetoothManager manager = LocalBluetoothManager.getInstance(this);
        if (manager == null) {
            Log.e("DockService", "Can't get LocalBluetoothManager: exiting");
            return;
        }
        this.mLocalAdapter = manager.getBluetoothAdapter();
        this.mDeviceManager = manager.getCachedDeviceManager();
        this.mProfileManager = manager.getProfileManager();
        if (this.mProfileManager == null) {
            Log.e("DockService", "Can't get LocalBluetoothProfileManager: exiting");
            return;
        }
        HandlerThread thread = new IntentFilter("DockService");
        thread.start();
        this.mServiceLooper = thread.getLooper();
        this.mServiceHandler = new ServiceHandler(this, this.mServiceLooper, null);
    }

    private synchronized void handleUndocked(BluetoothDevice bluetoothDevice) {
        this.mRunnable = null;
        this.mProfileManager.removeServiceListener(this);
        if (this.mDialog != null) {
            this.mDialog.dismiss();
            this.mDialog = null;
        }
        this.mDevice = null;
        this.mPendingDevice = null;
        if (bluetoothDevice != null) {
            getCachedBluetoothDevice(bluetoothDevice).disconnect();
        }
    }

    private synchronized void handleUnexpectedDisconnect(BluetoothDevice bluetoothDevice, LocalBluetoothProfile localBluetoothProfile, int i) {
        if (bluetoothDevice != null) {
            Intent registerReceiver = registerReceiver(null, new IntentFilter("android.intent.action.DOCK_EVENT"));
            if (!(registerReceiver == null || registerReceiver.getIntExtra("android.intent.extra.DOCK_STATE", 0) == 0)) {
                BluetoothDevice bluetoothDevice2 = (BluetoothDevice) registerReceiver.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                if (bluetoothDevice2 != null && bluetoothDevice2.equals(bluetoothDevice)) {
                    getCachedBluetoothDevice(bluetoothDevice2).connectProfile(localBluetoothProfile);
                }
            }
        }
        DockEventReceiver.finishStartingService(this, i);
    }

    private boolean msgTypeUndockedPermanent(BluetoothDevice bluetoothDevice, int i) {
        handleUndocked(bluetoothDevice);
        if (bluetoothDevice == null) {
            return false;
        }
        SharedPreferences prefs = getPrefs();
        if (!prefs.getBoolean("disable_bt_when_undock", false)) {
            return false;
        }
        if (hasOtherConnectedDevices(bluetoothDevice)) {
            prefs.edit().remove("disable_bt_when_undock").apply();
            return false;
        }
        this.mServiceHandler.sendMessageDelayed(this.mServiceHandler.obtainMessage(555, 0, i, null), 2000);
        return true;
    }

    synchronized boolean hasOtherConnectedDevices(BluetoothDevice bluetoothDevice) {
        boolean z = false;
        synchronized (this) {
            Collection<CachedBluetoothDevice> cachedDevicesCopy = this.mDeviceManager.getCachedDevicesCopy();
            Set bondedDevices = this.mLocalAdapter.getBondedDevices();
            if (bondedDevices != null && cachedDevicesCopy != null && !bondedDevices.isEmpty()) {
                for (CachedBluetoothDevice cachedBluetoothDevice : cachedDevicesCopy) {
                    BluetoothDevice device = cachedBluetoothDevice.getDevice();
                    if (!device.equals(bluetoothDevice) && bondedDevices.contains(device) && cachedBluetoothDevice.isConnected()) {
                        z = true;
                        break;
                    }
                }
            }
        }
        return z;
    }

    private synchronized void connectIfEnabled(BluetoothDevice bluetoothDevice) {
        CachedBluetoothDevice cachedBluetoothDevice = getCachedBluetoothDevice(bluetoothDevice);
        for (LocalBluetoothProfile preferred : cachedBluetoothDevice.getConnectableProfiles()) {
            if (preferred.getPreferred(bluetoothDevice) == 1000) {
                cachedBluetoothDevice.connect(false);
                break;
            }
        }
    }

    private boolean msgTypeDisableBluetooth(int i) {
        SharedPreferences prefs = getPrefs();
        if (this.mLocalAdapter.disable()) {
            prefs.edit().remove("disable_bt_when_undock").apply();
            return false;
        }
        prefs.edit().putBoolean("disable_bt", true).apply();
        this.mPendingTurnOffStartId = i;
        return true;
    }

    private synchronized void handleDocked(BluetoothDevice bluetoothDevice, int i, int i2) {
        if (bluetoothDevice != null) {
            if (LocalBluetoothPreferences.getDockAutoConnectSetting(this, bluetoothDevice.getAddress())) {
                initBtSettings(bluetoothDevice, i, false);
                applyBtSettings(this.mDevice, i2);
            }
        }
        createDialog(bluetoothDevice, i, i2);
    }

    public synchronized void onServiceConnected() {
        if (this.mRunnable != null) {
            this.mRunnable.run();
            this.mRunnable = null;
            this.mProfileManager.removeServiceListener(this);
        }
    }

    private CachedBluetoothDevice getCachedBluetoothDevice(BluetoothDevice bluetoothDevice) {
        CachedBluetoothDevice cachedDevice = this.mDeviceManager.findDevice(bluetoothDevice);
        return cachedDevice == null ? this.mDeviceManager.addDevice(this.mLocalAdapter, this.mProfileManager, bluetoothDevice) : cachedDevice;
    }

    private void msgTypeUndockedTemporary(BluetoothDevice bluetoothDevice, int i, int i2) {
        this.mServiceHandler.sendMessageDelayed(this.mServiceHandler.obtainMessage(444, i, i2, bluetoothDevice), 1000);
    }

    private SharedPreferences getPrefs() {
        return getSharedPreferences("dock_settings", 0);
    }

    public IBinder onBind(Intent intent) {
        return null;
    }

    public void onServiceDisconnected() {
    }
}