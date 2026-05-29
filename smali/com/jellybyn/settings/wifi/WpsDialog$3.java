package com.jellybyn.settings.wifi;

import java.util.TimerTask;

class WpsDialog$3 extends TimerTask {
    final /* synthetic */ WpsDialog this$0;

    public void run() {
        WpsDialog.access$400(this.this$0).post(new 1(this));
    }

    WpsDialog$3(WpsDialog wpsDialog) {
        this.this$0 = wpsDialog;
    }
}