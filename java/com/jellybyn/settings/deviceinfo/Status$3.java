package com.jellybyn.settings.deviceinfo;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.telephony.CellBroadcastMessage;

class Status$3 extends BroadcastReceiver {
    final /* synthetic */ Status this$0;

    public void onReceive(Context context, Intent intent) {
        if ("android.cellbroadcastreceiver.CB_AREA_INFO_RECEIVED".equals(intent.getAction())) {
            Bundle extras = intent.getExtras();
            if (extras != null) {
                CellBroadcastMessage cbMessage = (CellBroadcastMessage) extras.get("message");
                if (cbMessage != null && cbMessage.getServiceCategory() == 50) {
                    Status.access$600(this.this$0, cbMessage.getMessageBody());
                }
            }
        }
    }

    Status$3(Status status) {
        this.this$0 = status;
    }
}