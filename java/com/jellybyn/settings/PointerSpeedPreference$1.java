package com.jellybyn.settings;

import android.database.ContentObserver;
import android.os.Handler;

class PointerSpeedPreference$1 extends ContentObserver {
    final /* synthetic */ PointerSpeedPreference this$0;

    public void onChange(boolean z) {
        PointerSpeedPreference.access$000(this.this$0);
    }

    PointerSpeedPreference$1(PointerSpeedPreference pointerSpeedPreference, Handler handler) {
        this.this$0 = pointerSpeedPreference;
        super(handler);
    }
}