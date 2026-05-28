package com.jellybyn.settings;

import android.os.Handler;
import android.os.Message;

class BatteryInfo$1 extends Handler {
    final /* synthetic */ BatteryInfo this$0;

    public void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                BatteryInfo.access$000(this.this$0);
                sendEmptyMessageDelayed(1, 1000);
                return;
            default:
                return;
        }
    }

    BatteryInfo$1(BatteryInfo batteryInfo) {
        this.this$0 = batteryInfo;
    }
}