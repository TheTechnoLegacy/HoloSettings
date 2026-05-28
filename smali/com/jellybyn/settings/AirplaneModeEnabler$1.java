package com.jellybyn.settings;

import android.os.Handler;
import android.os.Message;

class AirplaneModeEnabler$1 extends Handler {
    final /* synthetic */ AirplaneModeEnabler this$0;

    public void handleMessage(Message message) {
        switch (message.what) {
            case 3:
                AirplaneModeEnabler.access$000(this.this$0);
                return;
            default:
                return;
        }
    }

    AirplaneModeEnabler$1(AirplaneModeEnabler airplaneModeEnabler) {
        this.this$0 = airplaneModeEnabler;
    }
}