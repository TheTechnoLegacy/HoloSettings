package com.jellybyn.settings.bluetooth;

import android.content.Context;
import android.content.SharedPreferences.Editor;

class LocalBluetoothPreferences$1 implements Runnable {
    final /* synthetic */ Context val$context;

    public void run() {
        Editor editor = LocalBluetoothPreferences.access$000(this.val$context).edit();
        editor.putLong("last_discovering_time", System.currentTimeMillis());
        editor.apply();
    }

    LocalBluetoothPreferences$1(Context context) {
        this.val$context = context;
    }
}