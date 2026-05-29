package com.jellybyn.settings.bluetooth;

import android.app.QueuedWork;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

final class LocalBluetoothPreferences {
    static boolean shouldShowDialogInForeground(Context context, String str) {
        LocalBluetoothManager manager = LocalBluetoothManager.getInstance(context);
        if (manager == null) {
            return false;
        }
        if (manager.isForegroundActivity()) {
            return true;
        }
        if ((context.getResources().getConfiguration().uiMode & 5) == 5) {
            return false;
        }
        long currentTimeMillis = System.currentTimeMillis();
        SharedPreferences sharedPreferences = getSharedPreferences(context);
        if (60000 + sharedPreferences.getLong("discoverable_end_timestamp", 0) > currentTimeMillis) {
            return true;
        }
        LocalBluetoothAdapter adapter = manager.getBluetoothAdapter();
        if (adapter != null && adapter.isDiscovering()) {
            return true;
        }
        if (sharedPreferences.getLong("last_discovering_time", 0) + 60000 > currentTimeMillis) {
            return true;
        }
        return str != null && str.equals(sharedPreferences.getString("last_selected_device", null)) && 60000 + sharedPreferences.getLong("last_selected_device_time", 0) > currentTimeMillis;
    }

    static void persistSelectedDeviceInPicker(Context context, String str) {
        Editor editor = getSharedPreferences(context).edit();
        editor.putString("last_selected_device", str);
        editor.putLong("last_selected_device_time", System.currentTimeMillis());
        editor.apply();
    }

    static void persistDiscoverableEndTimestamp(Context context, long j) {
        Editor editor = getSharedPreferences(context).edit();
        editor.putLong("discoverable_end_timestamp", j);
        editor.apply();
    }

    static void removeDockAutoConnectSetting(Context context, String str) {
        Editor editor = getSharedPreferences(context).edit();
        editor.remove("auto_connect_to_dock" + str);
        editor.apply();
    }

    static void saveDockAutoConnectSetting(Context context, String str, boolean z) {
        Editor editor = getSharedPreferences(context).edit();
        editor.putBoolean("auto_connect_to_dock" + str, z);
        editor.apply();
    }

    private LocalBluetoothPreferences() {
    }

    static void persistDiscoveringTimestamp(Context context) {
        QueuedWork.singleThreadExecutor().submit(new 1(context));
    }

    static long getDiscoverableEndTimestamp(Context context) {
        return getSharedPreferences(context).getLong("discoverable_end_timestamp", 0);
    }

    static boolean getDockAutoConnectSetting(Context context, String str) {
        return getSharedPreferences(context).getBoolean("auto_connect_to_dock" + str, false);
    }

    private static SharedPreferences getSharedPreferences(Context context) {
        return context.getSharedPreferences("bluetooth_settings", 0);
    }

    static boolean hasDockAutoConnectSetting(Context context, String str) {
        return getSharedPreferences(context).contains("auto_connect_to_dock" + str);
    }
}