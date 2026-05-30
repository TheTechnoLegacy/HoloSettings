package com.jellybyn.settings;

import android.os.Handler;

class RadioInfo$5 extends Thread {
    final /* synthetic */ RadioInfo this$0;
    final /* synthetic */ Handler val$handler;
    final /* synthetic */ Runnable val$updatePingResults;

    public void run() {
        RadioInfo.access$3000(this.this$0);
        this.val$handler.post(this.val$updatePingResults);
    }

    RadioInfo$5(RadioInfo radioInfo, Handler handler, Runnable runnable) {
        this.this$0 = radioInfo;
        this.val$handler = handler;
        this.val$updatePingResults = runnable;
    }
}