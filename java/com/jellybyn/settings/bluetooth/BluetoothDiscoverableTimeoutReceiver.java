package com.jellybyn.settings.bluetooth;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class BluetoothDiscoverableTimeoutReceiver extends BroadcastReceiver {
    static void setDiscoverableAlarm(Context context, long j) {
        Log.d("BluetoothDiscoverableTimeoutReceiver", "setDiscoverableAlarm(): alarmTime = " + j);
        Intent intent = new Intent("android.bluetooth.intent.DISCOVERABLE_TIMEOUT");
        intent.setClass(context, BluetoothDiscoverableTimeoutReceiver.class);
        PendingIntent broadcast = PendingIntent.getBroadcast(context, 0, intent, 0);
        AlarmManager alarmManager = (AlarmManager) context.getSystemService("alarm");
        if (broadcast != null) {
            alarmManager.cancel(broadcast);
            Log.d("BluetoothDiscoverableTimeoutReceiver", "setDiscoverableAlarm(): cancel prev alarm");
        }
        alarmManager.set(0, j, PendingIntent.getBroadcast(context, 0, intent, 0));
    }

    static void cancelDiscoverableAlarm(Context context) {
        Log.d("BluetoothDiscoverableTimeoutReceiver", "cancelDiscoverableAlarm(): Enter");
        Intent intent = new Intent("android.bluetooth.intent.DISCOVERABLE_TIMEOUT");
        intent.setClass(context, BluetoothDiscoverableTimeoutReceiver.class);
        PendingIntent broadcast = PendingIntent.getBroadcast(context, 0, intent, 536870912);
        if (broadcast != null) {
            ((AlarmManager) context.getSystemService("alarm")).cancel(broadcast);
        }
    }

    public void onReceive(Context context, Intent intent) {
        LocalBluetoothAdapter localBluetoothAdapter = LocalBluetoothAdapter.getInstance();
        if (localBluetoothAdapter == null || localBluetoothAdapter.getState() != 12) {
            Log.e("BluetoothDiscoverableTimeoutReceiver", "localBluetoothAdapter is NULL!!");
            return;
        }
        Log.d("BluetoothDiscoverableTimeoutReceiver", "Disable discoverable...");
        localBluetoothAdapter.setScanMode(21);
    }
}