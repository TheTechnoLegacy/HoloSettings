package com.jellybyn.settings.widget;

import android.os.AsyncTask;
import com.jellybyn.settings.widget.SettingsAppWidgetProvider.BluetoothStateTracker;

class SettingsAppWidgetProvider$BluetoothStateTracker$1 extends AsyncTask<Void, Void, Void> {
    final /* synthetic */ BluetoothStateTracker this$0;
    final /* synthetic */ boolean val$desiredState;

    protected Void doInBackground(Void... voidArr) {
        SettingsAppWidgetProvider.access$800().setBluetoothEnabled(this.val$desiredState);
        return null;
    }

    SettingsAppWidgetProvider$BluetoothStateTracker$1(BluetoothStateTracker bluetoothStateTracker, boolean z) {
        this.this$0 = bluetoothStateTracker;
        this.val$desiredState = z;
    }
}