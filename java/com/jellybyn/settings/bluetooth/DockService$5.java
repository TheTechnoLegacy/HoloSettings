package com.jellybyn.settings.bluetooth;

import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.provider.Settings.Global;

class DockService$5 implements OnClickListener {
    final /* synthetic */ DockService this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        int i2 = 1;
        if (i != -1) {
            return;
        }
        if (DockService.access$400(this.this$0) != null) {
            if (!LocalBluetoothPreferences.hasDockAutoConnectSetting(this.this$0, DockService.access$400(this.this$0).getAddress())) {
                LocalBluetoothPreferences.saveDockAutoConnectSetting(this.this$0, DockService.access$400(this.this$0).getAddress(), true);
            }
            DockService.access$700(this.this$0, DockService.access$400(this.this$0), DockService.access$600(this.this$0));
        } else if (DockService.access$800(this.this$0) != null) {
            ContentResolver contentResolver = this.this$0.getContentResolver();
            String str = "dock_audio_media_enabled";
            if (!DockService.access$800(this.this$0).isChecked()) {
                i2 = 0;
            }
            Global.putInt(contentResolver, str, i2);
        }
    }

    DockService$5(DockService dockService) {
        this.this$0 = dockService;
    }
}