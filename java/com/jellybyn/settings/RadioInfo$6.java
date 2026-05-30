package com.jellybyn.settings;

import android.os.Handler;

class RadioInfo$6 extends Thread {
    final /* synthetic */ RadioInfo this$0;
    final /* synthetic */ Handler val$handler;
    final /* synthetic */ Runnable val$updatePingResults;

    public void run() {
        RadioInfo.access$3100(this.this$0);
        this.val$handler.post(this.val$updatePingResults);
    }

    RadioInfo$6(RadioInfo radioInfo, Handler handler, Runnable runnable) {
        this.this$0 = radioInfo;
        this.val$handler = handler;
        this.val$updatePingResults = runnable;
    }
}