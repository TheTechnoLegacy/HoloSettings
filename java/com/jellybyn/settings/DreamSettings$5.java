package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class DreamSettings$5 implements OnClickListener {
    final /* synthetic */ DreamSettings this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        boolean z = false;
        DreamBackend access$200 = DreamSettings.access$200(this.this$0);
        boolean z2 = i == 0 || i == 2;
        access$200.setActivatedOnDock(z2);
        DreamBackend access$2002 = DreamSettings.access$200(this.this$0);
        if (i == 1 || i == 2) {
            z = true;
        }
        access$2002.setActivatedOnSleep(z);
    }

    DreamSettings$5(DreamSettings dreamSettings) {
        this.this$0 = dreamSettings;
    }
}