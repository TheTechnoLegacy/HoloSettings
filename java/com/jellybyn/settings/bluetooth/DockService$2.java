package com.jellybyn.settings.bluetooth;

import android.content.DialogInterface;
import android.content.DialogInterface.OnMultiChoiceClickListener;

class DockService$2 implements OnMultiChoiceClickListener {
    final /* synthetic */ DockService this$0;

    public void onClick(DialogInterface dialogInterface, int i, boolean z) {
        DockService.access$300(this.this$0)[i] = z;
    }

    DockService$2(DockService dockService) {
        this.this$0 = dockService;
    }
}