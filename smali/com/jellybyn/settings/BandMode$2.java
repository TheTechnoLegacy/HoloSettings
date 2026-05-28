package com.jellybyn.settings;

import android.os.AsyncResult;
import android.os.Handler;
import android.os.Message;

class BandMode$2 extends Handler {
    final /* synthetic */ BandMode this$0;

    public void handleMessage(Message message) {
        switch (message.what) {
            case 100:
                BandMode.access$400(this.this$0, message.obj);
                return;
            case 200:
                AsyncResult ar = message.obj;
                this.this$0.getWindow().setFeatureInt(5, -2);
                if (!this.this$0.isFinishing()) {
                    BandMode.access$500(this.this$0, ar.exception);
                    return;
                }
                return;
            default:
                return;
        }
    }

    BandMode$2(BandMode bandMode) {
        this.this$0 = bandMode;
    }
}