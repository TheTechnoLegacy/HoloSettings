package com.jellybyn.settings.bluetooth;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import android.util.Log;

public final class BluetoothPermissionRequest extends BroadcastReceiver {
    Context mContext;
    BluetoothDevice mDevice;
    int mRequestType;
    String mReturnClass = null;
    String mReturnPackage = null;

    public void onReceive(Context context, Intent intent) {
        String str = null;
        this.mContext = context;
        String action = intent.getAction();
        if (action.equals("android.bluetooth.device.action.CONNECTION_ACCESS_REQUEST")) {
            this.mDevice = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            this.mRequestType = intent.getIntExtra("android.bluetooth.device.extra.ACCESS_REQUEST_TYPE", 1);
            this.mReturnPackage = intent.getStringExtra("android.bluetooth.device.extra.PACKAGE_NAME");
            this.mReturnClass = intent.getStringExtra("android.bluetooth.device.extra.CLASS_NAME");
            Intent intent2 = new Intent(action);
            intent2.setClass(context, BluetoothPermissionActivity.class);
            intent2.setFlags(268435456);
            intent2.putExtra("android.bluetooth.device.extra.ACCESS_REQUEST_TYPE", this.mRequestType);
            intent2.putExtra("android.bluetooth.device.extra.DEVICE", this.mDevice);
            intent2.putExtra("android.bluetooth.device.extra.PACKAGE_NAME", this.mReturnPackage);
            intent2.putExtra("android.bluetooth.device.extra.CLASS_NAME", this.mReturnClass);
            if (!checkUserChoice()) {
                action = this.mDevice != null ? this.mDevice.getAddress() : null;
                if (((PowerManager) context.getSystemService("power")).isScreenOn() && LocalBluetoothPreferences.shouldShowDialogInForeground(context, action)) {
                    context.startActivity(intent2);
                    return;
                }
                Intent intent3 = new Intent("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY");
                intent3.putExtra("android.bluetooth.device.extra.DEVICE", this.mDevice);
                intent3.putExtra("android.bluetooth.device.extra.CONNECTION_ACCESS_RESULT", 2);
                Notification notification = new Notification(17301632, context.getString(2131427467), System.currentTimeMillis());
                if (this.mDevice != null) {
                    str = this.mDevice.getAliasName();
                }
                notification.setLatestEventInfo(context, context.getString(2131427467), context.getString(2131427468, new Object[]{str}), PendingIntent.getActivity(context, 0, intent2, 0));
                notification.flags = 24;
                notification.defaults = 1;
                notification.deleteIntent = PendingIntent.getBroadcast(context, 0, intent3, 0);
                ((NotificationManager) context.getSystemService("notification")).notify(17301632, notification);
            }
        } else if (action.equals("android.bluetooth.device.action.CONNECTION_ACCESS_CANCEL")) {
            ((NotificationManager) context.getSystemService("notification")).cancel(17301632);
        }
    }

    private boolean checkUserChoice() {
        boolean processed = false;
        if (this.mRequestType != 2) {
            return false;
        }
        LocalBluetoothManager bluetoothManager = LocalBluetoothManager.getInstance(this.mContext);
        CachedBluetoothDeviceManager cachedDeviceManager = bluetoothManager.getCachedDeviceManager();
        CachedBluetoothDevice cachedDevice = cachedDeviceManager.findDevice(this.mDevice);
        if (cachedDevice == null) {
            cachedDevice = cachedDeviceManager.addDevice(bluetoothManager.getBluetoothAdapter(), bluetoothManager.getProfileManager(), this.mDevice);
        }
        int phonebookPermission = cachedDevice.getPhonebookPermissionChoice();
        if (phonebookPermission == 0) {
            return false;
        }
        String intentName = "android.bluetooth.device.action.CONNECTION_ACCESS_REPLY";
        if (phonebookPermission == 1) {
            sendIntentToReceiver(intentName, true, "android.bluetooth.device.extra.ALWAYS_ALLOWED", true);
            processed = true;
        } else if (phonebookPermission == 2) {
            sendIntentToReceiver(intentName, false, null, false);
            processed = true;
        } else {
            Log.e("BluetoothPermissionRequest", "Bad phonebookPermission: " + phonebookPermission);
        }
        return processed;
    }

    private void sendIntentToReceiver(String str, boolean z, String str2, boolean z2) {
        Intent intent = new Intent(str);
        if (!(this.mReturnPackage == null || this.mReturnClass == null)) {
            intent.setClassName(this.mReturnPackage, this.mReturnClass);
        }
        intent.putExtra("android.bluetooth.device.extra.CONNECTION_ACCESS_RESULT", z ? 1 : 2);
        if (str2 != null) {
            intent.putExtra(str2, z2);
        }
        intent.putExtra("android.bluetooth.device.extra.DEVICE", this.mDevice);
        this.mContext.sendBroadcast(intent, "android.permission.BLUETOOTH_ADMIN");
    }
}