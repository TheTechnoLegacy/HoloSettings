package com.jellybyn.settings.bluetooth;

import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;

class DockService$4 implements OnDismissListener {
    final /* synthetic */ DockService this$0;

    public void onDismiss(DialogInterface dialogInterface) {
        if (DockService.access$500(this.this$0) == null) {
            DockEventReceiver.finishStartingService(this.this$0, DockService.access$600(this.this$0));
        }
        this.this$0.stopForeground(true);
    }

    DockService$4(DockService dockService) {
        this.this$0 = dockService;
    }
}