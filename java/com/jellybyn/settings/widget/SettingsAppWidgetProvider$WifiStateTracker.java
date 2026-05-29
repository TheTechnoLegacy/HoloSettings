package com.jellybyn.settings.widget;

import android.content.Context;
import android.content.Intent;
import android.net.wifi.WifiManager;
import android.util.Log;
import com.jellybyn.settings.widget.SettingsAppWidgetProvider.StateTracker;

final class SettingsAppWidgetProvider$WifiStateTracker extends StateTracker {
    private static int wifiStateToFiveState(int i) {
        switch (i) {
            case 0:
                return 3;
            case 1:
                return 0;
            case 2:
                return 2;
            case 3:
                return 1;
            default:
                return 4;
        }
    }

    protected void requestStateChange(Context context, boolean z) {
        WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
        if (wifiManager == null) {
            Log.d("SettingsAppWidgetProvider", "No wifiManager.");
        } else {
            new 1(this, wifiManager, z).execute(new Void[0]);
        }
    }

    public int getActualState(Context context) {
        WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
        return wifiManager != null ? wifiStateToFiveState(wifiManager.getWifiState()) : 4;
    }

    public void onActualStateChange(Context context, Intent intent) {
        if ("android.net.wifi.WIFI_STATE_CHANGED".equals(intent.getAction())) {
            setCurrentState(context, wifiStateToFiveState(intent.getIntExtra("wifi_state", -1)));
        }
    }

    private SettingsAppWidgetProvider$WifiStateTracker() {
        super(null);
    }

    public int getButtonDescription() {
        return 2131428747;
    }

    public int getButtonId() {
        return 2131231107;
    }

    public int getButtonImageId(boolean z) {
        return z ? 2130837568 : 2130837567;
    }

    public int getContainerId() {
        return 2131231106;
    }

    public int getIndicatorId() {
        return 2131231108;
    }

    public int getPosition() {
        return 0;
    }
}