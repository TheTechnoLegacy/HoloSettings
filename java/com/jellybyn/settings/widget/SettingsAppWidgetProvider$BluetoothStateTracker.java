package com.jellybyn.settings.widget;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.jellybyn.settings.bluetooth.LocalBluetoothManager;
import com.jellybyn.settings.widget.SettingsAppWidgetProvider.StateTracker;

final class SettingsAppWidgetProvider$BluetoothStateTracker extends StateTracker {
    private static int bluetoothStateToFiveState(int i) {
        switch (i) {
            case 10:
                return 0;
            case 11:
                return 2;
            case 12:
                return 1;
            case 13:
                return 3;
            default:
                return 4;
        }
    }

    public int getActualState(Context context) {
        if (SettingsAppWidgetProvider.access$800() == null) {
            LocalBluetoothManager instance = LocalBluetoothManager.getInstance(context);
            if (instance == null) {
                return 4;
            }
            SettingsAppWidgetProvider.access$802(instance.getBluetoothAdapter());
        }
        return bluetoothStateToFiveState(SettingsAppWidgetProvider.access$800().getBluetoothState());
    }

    public void onActualStateChange(Context context, Intent intent) {
        if ("android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction())) {
            setCurrentState(context, bluetoothStateToFiveState(intent.getIntExtra("android.bluetooth.adapter.extra.STATE", -1)));
        }
    }

    protected void requestStateChange(Context context, boolean z) {
        if (SettingsAppWidgetProvider.access$800() == null) {
            Log.d("SettingsAppWidgetProvider", "No LocalBluetoothManager");
        } else {
            new 1(this, z).execute(new Void[0]);
        }
    }

    private SettingsAppWidgetProvider$BluetoothStateTracker() {
        super(null);
    }

    public int getButtonDescription() {
        return 2131428748;
    }

    public int getButtonId() {
        return 2131231110;
    }

    public int getButtonImageId(boolean z) {
        return z ? 2130837558 : 2130837557;
    }

    public int getContainerId() {
        return 2131231109;
    }

    public int getIndicatorId() {
        return 2131231111;
    }
}