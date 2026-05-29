package com.jellybyn.settings.bluetooth;

import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.PowerManager;
import android.text.TextUtils;

public final class BluetoothPairingRequest extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (action.equals("android.bluetooth.device.action.PAIRING_REQUEST")) {
            BluetoothDevice bluetoothDevice = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            int intExtra = intent.getIntExtra("android.bluetooth.device.extra.PAIRING_VARIANT", Integer.MIN_VALUE);
            Intent intent2 = new Intent();
            intent2.setClass(context, BluetoothPairingDialog.class);
            intent2.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothDevice);
            intent2.putExtra("android.bluetooth.device.extra.PAIRING_VARIANT", intExtra);
            if (intExtra == 2 || intExtra == 4 || intExtra == 5) {
                intent2.putExtra("android.bluetooth.device.extra.PAIRING_KEY", intent.getIntExtra("android.bluetooth.device.extra.PAIRING_KEY", Integer.MIN_VALUE));
            }
            intent2.setAction("android.bluetooth.device.action.PAIRING_REQUEST");
            intent2.setFlags(268435456);
            PowerManager powerManager = (PowerManager) context.getSystemService("power");
            String address = bluetoothDevice != null ? bluetoothDevice.getAddress() : null;
            if (powerManager.isScreenOn() && LocalBluetoothPreferences.shouldShowDialogInForeground(context, address)) {
                context.startActivity(intent2);
                return;
            }
            Resources resources = context.getResources();
            Builder ticker = new Builder(context).setSmallIcon(17301632).setTicker(resources.getString(2131427453));
            PendingIntent activity = PendingIntent.getActivity(context, 0, intent2, 1073741824);
            String stringExtra = intent.getStringExtra("android.bluetooth.device.extra.NAME");
            action = TextUtils.isEmpty(stringExtra) ? bluetoothDevice != null ? bluetoothDevice.getAliasName() : context.getString(17039374) : stringExtra;
            ticker.setContentTitle(resources.getString(2131427454)).setContentText(resources.getString(2131427455, new Object[]{action})).setContentIntent(activity).setAutoCancel(true).setDefaults(1);
            ((NotificationManager) context.getSystemService("notification")).notify(17301632, ticker.getNotification());
        } else if (action.equals("android.bluetooth.device.action.PAIRING_CANCEL")) {
            ((NotificationManager) context.getSystemService("notification")).cancel(17301632);
        }
    }
}