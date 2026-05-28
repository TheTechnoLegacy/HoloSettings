package com.jellybyn.settings.deviceinfo;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

class UsbSettings$1 extends BroadcastReceiver {
    final /* synthetic */ UsbSettings this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.hardware.usb.action.USB_STATE")) {
            UsbSettings.access$002(this.this$0, intent.getBooleanExtra("accessory", false));
            Log.e("UsbSettings", "UsbAccessoryMode " + UsbSettings.access$000(this.this$0));
        }
        UsbSettings.access$200(this.this$0, UsbSettings.access$100(this.this$0).getDefaultFunction());
    }

    UsbSettings$1(UsbSettings usbSettings) {
        this.this$0 = usbSettings;
    }
}