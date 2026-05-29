package com.jellybyn.settings;

import android.database.ContentObserver;
import android.os.Handler;

class AirplaneModeEnabler$2 extends ContentObserver {
    final /* synthetic */ AirplaneModeEnabler this$0;

    public void onChange(boolean z) {
        AirplaneModeEnabler.access$000(this.this$0);
    }

    AirplaneModeEnabler$2(AirplaneModeEnabler airplaneModeEnabler, Handler handler) {
        this.this$0 = airplaneModeEnabler;
        super(handler);
    }
}