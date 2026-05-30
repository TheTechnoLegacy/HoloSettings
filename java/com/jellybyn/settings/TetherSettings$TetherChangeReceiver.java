package com.jellybyn.settings;

import android.bluetooth.BluetoothPan;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import java.util.ArrayList;

class TetherSettings$TetherChangeReceiver extends BroadcastReceiver {
    final /* synthetic */ TetherSettings this$0;

    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (action.equals("android.net.conn.TETHER_STATE_CHANGED")) {
            ArrayList stringArrayListExtra = intent.getStringArrayListExtra("availableArray");
            ArrayList stringArrayListExtra2 = intent.getStringArrayListExtra("activeArray");
            ArrayList stringArrayListExtra3 = intent.getStringArrayListExtra("erroredArray");
            TetherSettings.access$100(this.this$0, (String[]) stringArrayListExtra.toArray(new String[stringArrayListExtra.size()]), (String[]) stringArrayListExtra2.toArray(new String[stringArrayListExtra2.size()]), (String[]) stringArrayListExtra3.toArray(new String[stringArrayListExtra3.size()]));
        } else if (action.equals("android.intent.action.MEDIA_SHARED")) {
            TetherSettings.access$202(this.this$0, true);
            TetherSettings.access$300(this.this$0);
        } else if (action.equals("android.intent.action.MEDIA_UNSHARED")) {
            TetherSettings.access$202(this.this$0, false);
            TetherSettings.access$300(this.this$0);
        } else if (action.equals("android.hardware.usb.action.USB_STATE")) {
            TetherSettings.access$402(this.this$0, intent.getBooleanExtra("connected", false));
            TetherSettings.access$300(this.this$0);
        } else if (action.equals("android.bluetooth.adapter.action.STATE_CHANGED")) {
            if (TetherSettings.access$500(this.this$0)) {
                switch (intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE)) {
                    case Integer.MIN_VALUE:
                    case 10:
                        TetherSettings.access$502(this.this$0, false);
                        break;
                    case 12:
                        BluetoothPan bluetoothPan = (BluetoothPan) TetherSettings.access$000(this.this$0).get();
                        if (bluetoothPan != null) {
                            bluetoothPan.setBluetoothTethering(true);
                            TetherSettings.access$502(this.this$0, false);
                            break;
                        }
                        break;
                }
            }
            TetherSettings.access$300(this.this$0);
        }
    }

    private TetherSettings$TetherChangeReceiver(TetherSettings tetherSettings) {
        this.this$0 = tetherSettings;
    }
}