package com.jellybyn.settings.bluetooth;

import android.app.Service;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.util.Log;

public final class DockEventReceiver extends BroadcastReceiver {
    private static WakeLock sStartingService;
    private static final Object sStartingServiceSync = new Object();

    public void onReceive(Context context, Intent intent) {
        if (intent != null) {
            int intExtra = intent.getIntExtra("android.intent.extra.DOCK_STATE", intent.getIntExtra("android.bluetooth.adapter.extra.STATE", -1234));
            BluetoothDevice bluetoothDevice = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            Intent intent2;
            if ("android.intent.action.DOCK_EVENT".equals(intent.getAction()) || "com.jellybyn.settings.bluetooth.action.DOCK_SHOW_UI".endsWith(intent.getAction())) {
                if (bluetoothDevice == null) {
                    if (!"com.jellybyn.settings.bluetooth.action.DOCK_SHOW_UI".endsWith(intent.getAction())) {
                        if (!(intExtra == 0 || intExtra == 3)) {
                            return;
                        }
                    }
                    return;
                }
                switch (intExtra) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                        intent2 = new Intent(intent);
                        intent2.setClass(context, DockService.class);
                        beginStartingService(context, intent2);
                        return;
                    default:
                        Log.e("DockEventReceiver", "Unknown state: " + intExtra);
                        return;
                }
            } else if ("android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED".equals(intent.getAction()) || "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED".equals(intent.getAction())) {
                intExtra = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 2);
                int intExtra2 = intent.getIntExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", 0);
                if (bluetoothDevice != null && intExtra == 0 && intExtra2 != 3) {
                    intent2 = new Intent(intent);
                    intent2.setClass(context, DockService.class);
                    beginStartingService(context, intent2);
                }
            } else if ("android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction()) && intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE) != 11) {
                intent2 = new Intent(intent);
                intent2.setClass(context, DockService.class);
                beginStartingService(context, intent2);
            }
        }
    }

    private static void beginStartingService(Context context, Intent intent) {
        synchronized (sStartingServiceSync) {
            if (sStartingService == null) {
                sStartingService = ((PowerManager) context.getSystemService("power")).newWakeLock(1, "StartingDockService");
            }
            sStartingService.acquire();
            if (context.startService(intent) == null) {
                Log.e("DockEventReceiver", "Can't start DockService");
            }
        }
    }

    public static void finishStartingService(Service service, int i) {
        synchronized (sStartingServiceSync) {
            if (sStartingService != null && service.stopSelfResult(i)) {
                Log.d("DockEventReceiver", "finishStartingService: stopping service");
                sStartingService.release();
            }
        }
    }
}