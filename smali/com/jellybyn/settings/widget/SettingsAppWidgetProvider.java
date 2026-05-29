package com.jellybyn.settings.widget;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.IPowerManager;
import android.os.IPowerManager.Stub;
import android.os.PowerManager;
import android.os.ServiceManager;
import android.provider.Settings.SettingNotFoundException;
import android.provider.Settings.System;
import android.util.Log;
import android.widget.RemoteViews;
import com.jellybyn.settings.bluetooth.LocalBluetoothAdapter;

public class SettingsAppWidgetProvider extends AppWidgetProvider {
    private static final int[] IND_DRAWABLE_MID = new int[]{2130837519, 2130837518, 2130837520};
    private static final int[] IND_DRAWABLE_OFF = new int[]{2130837522, 2130837521, 2130837523};
    private static final int[] IND_DRAWABLE_ON = new int[]{2130837525, 2130837524, 2130837526};
    static final ComponentName THIS_APPWIDGET = new ComponentName("com.jellybyn.settings", "com.jellybyn.settings.widget.SettingsAppWidgetProvider");
    private static final StateTracker sBluetoothState = new BluetoothStateTracker(null);
    private static final StateTracker sGpsState = new GpsStateTracker(null);
    private static LocalBluetoothAdapter sLocalBluetoothAdapter = null;
    private static SettingsObserver sSettingsObserver;
    private static final StateTracker sSyncState = new SyncStateTracker(null);
    private static final StateTracker sWifiState = new WifiStateTracker(null);

    private void toggleBrightness(Context context) {
        try {
            IPowerManager asInterface = Stub.asInterface(ServiceManager.getService("power"));
            if (asInterface != null) {
                PowerManager powerManager = (PowerManager) context.getSystemService("power");
                ContentResolver contentResolver = context.getContentResolver();
                int i = System.getInt(contentResolver, "screen_brightness");
                int i2 = 0;
                if (context.getResources().getBoolean(17891351)) {
                    i2 = System.getInt(contentResolver, "screen_brightness_mode");
                }
                if (i2 == 1) {
                    i = powerManager.getMinimumScreenBrightnessSetting();
                    i2 = 0;
                } else if (i < powerManager.getDefaultScreenBrightnessSetting()) {
                    i = powerManager.getDefaultScreenBrightnessSetting();
                } else if (i < powerManager.getMaximumScreenBrightnessSetting()) {
                    i = powerManager.getMaximumScreenBrightnessSetting();
                } else {
                    i2 = 1;
                    i = powerManager.getMinimumScreenBrightnessSetting();
                }
                if (context.getResources().getBoolean(17891351)) {
                    System.putInt(context.getContentResolver(), "screen_brightness_mode", i2);
                } else {
                    i2 = 0;
                }
                if (i2 == 0) {
                    asInterface.setTemporaryScreenBrightnessSettingOverride(i);
                    System.putInt(contentResolver, "screen_brightness", i);
                }
            }
        } catch (SettingNotFoundException e) {
            Log.d("SettingsAppWidgetProvider", "toggleBrightness: " + e);
        } catch (SettingNotFoundException e2) {
            Log.d("SettingsAppWidgetProvider", "toggleBrightness: " + e2);
        }
    }

    public void onReceive(Context context, Intent intent) {
        super.onReceive(context, intent);
        String action = intent.getAction();
        if ("android.net.wifi.WIFI_STATE_CHANGED".equals(action)) {
            sWifiState.onActualStateChange(context, intent);
        } else if ("android.bluetooth.adapter.action.STATE_CHANGED".equals(action)) {
            sBluetoothState.onActualStateChange(context, intent);
        } else if ("android.location.PROVIDERS_CHANGED".equals(action)) {
            sGpsState.onActualStateChange(context, intent);
        } else if (ContentResolver.ACTION_SYNC_CONN_STATUS_CHANGED.equals(action)) {
            sSyncState.onActualStateChange(context, intent);
        } else if (intent.hasCategory("android.intent.category.ALTERNATIVE")) {
            int buttonId = Integer.parseInt(intent.getData().getSchemeSpecificPart());
            if (buttonId == 0) {
                sWifiState.toggleState(context);
            } else if (buttonId == 1) {
                toggleBrightness(context);
            } else if (buttonId == 2) {
                sSyncState.toggleState(context);
            } else if (buttonId == 3) {
                sGpsState.toggleState(context);
            } else if (buttonId == 4) {
                sBluetoothState.toggleState(context);
            }
        } else {
            return;
        }
        updateWidget(context);
    }

    private static void updateButtons(RemoteViews remoteViews, Context context) {
        sWifiState.setImageViewResources(context, remoteViews);
        sBluetoothState.setImageViewResources(context, remoteViews);
        sGpsState.setImageViewResources(context, remoteViews);
        sSyncState.setImageViewResources(context, remoteViews);
        if (getBrightnessMode(context)) {
            remoteViews.setContentDescription(2131231118, context.getString(2131428751, new Object[]{context.getString(2131428752)}));
            remoteViews.setImageViewResource(2131231119, 2130837559);
            remoteViews.setImageViewResource(2131231120, 2130837526);
            return;
        }
        int brightness = getBrightness(context);
        PowerManager pm = (PowerManager) context.getSystemService("power");
        int half = (int) (((float) pm.getMaximumScreenBrightnessSetting()) * 0.3f);
        if (brightness > ((int) (((float) pm.getMaximumScreenBrightnessSetting()) * 0.8f))) {
            remoteViews.setContentDescription(2131231118, context.getString(2131428751, new Object[]{context.getString(2131428753)}));
            remoteViews.setImageViewResource(2131231119, 2130837560);
        } else if (brightness > half) {
            remoteViews.setContentDescription(2131231118, context.getString(2131428751, new Object[]{context.getString(2131428754)}));
            remoteViews.setImageViewResource(2131231119, 2130837561);
        } else {
            remoteViews.setContentDescription(2131231118, context.getString(2131428751, new Object[]{context.getString(2131428755)}));
            remoteViews.setImageViewResource(2131231119, 2130837562);
        }
        if (brightness > half) {
            remoteViews.setImageViewResource(2131231120, 2130837526);
        } else {
            remoteViews.setImageViewResource(2131231120, 2130837523);
        }
    }

    static RemoteViews buildUpdate(Context context) {
        RemoteViews views = new RemoteViews(context.getPackageName(), 2130968714);
        views.setOnClickPendingIntent(2131231106, getLaunchPendingIntent(context, 0));
        views.setOnClickPendingIntent(2131231118, getLaunchPendingIntent(context, 1));
        views.setOnClickPendingIntent(2131231115, getLaunchPendingIntent(context, 2));
        views.setOnClickPendingIntent(2131231112, getLaunchPendingIntent(context, 3));
        views.setOnClickPendingIntent(2131231109, getLaunchPendingIntent(context, 4));
        updateButtons(views, context);
        return views;
    }

    private static boolean getBrightnessMode(Context context) {
        try {
            return System.getInt(context.getContentResolver(), "screen_brightness_mode") == 1;
        } catch (Exception e) {
            Log.d("SettingsAppWidgetProvider", "getBrightnessMode: " + e);
            return false;
        }
    }

    private static PendingIntent getLaunchPendingIntent(Context context, int i) {
        Intent intent = new Intent();
        intent.setClass(context, SettingsAppWidgetProvider.class);
        intent.addCategory("android.intent.category.ALTERNATIVE");
        intent.setData(Uri.parse("custom:" + i));
        return PendingIntent.getBroadcast(context, 0, intent, 0);
    }

    public static void updateWidget(Context context) {
        AppWidgetManager.getInstance(context).updateAppWidget(THIS_APPWIDGET, buildUpdate(context));
        checkObserver(context);
    }

    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] iArr) {
        RemoteViews view = buildUpdate(context);
        for (int updateAppWidget : iArr) {
            appWidgetManager.updateAppWidget(updateAppWidget, view);
        }
    }

    private static void checkObserver(Context context) {
        if (sSettingsObserver == null) {
            sSettingsObserver = new SettingsObserver(new Handler(), context.getApplicationContext());
            sSettingsObserver.startObserving();
        }
    }

    private static int getBrightness(Context context) {
        try {
            return System.getInt(context.getContentResolver(), "screen_brightness");
        } catch (Exception e) {
            return 0;
        }
    }

    public void onDisabled(Context context) {
        if (sSettingsObserver != null) {
            sSettingsObserver.stopObserving();
            sSettingsObserver = null;
        }
    }

    public void onEnabled(Context context) {
        checkObserver(context);
    }
}