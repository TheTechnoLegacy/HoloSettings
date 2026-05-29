package com.jellybyn.settings.bluetooth;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

final class DockService$ServiceHandler extends Handler {
    final /* synthetic */ DockService this$0;

    private DockService$ServiceHandler(DockService dockService, Looper looper) {
        this.this$0 = dockService;
        super(looper);
    }

    public void handleMessage(Message message) {
        DockService.access$100(this.this$0, message);
    }
}