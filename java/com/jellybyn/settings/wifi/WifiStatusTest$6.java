package com.jellybyn.settings.wifi;

import android.os.Handler;

class WifiStatusTest$6 extends Thread {
    final /* synthetic */ WifiStatusTest this$0;
    final /* synthetic */ Handler val$handler;
    final /* synthetic */ Runnable val$updatePingResults;

    public void run() {
        WifiStatusTest.access$2400(this.this$0);
        this.val$handler.post(this.val$updatePingResults);
    }

    WifiStatusTest$6(WifiStatusTest wifiStatusTest, Handler handler, Runnable runnable) {
        this.this$0 = wifiStatusTest;
        this.val$handler = handler;
        this.val$updatePingResults = runnable;
    }
}