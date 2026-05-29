package com.jellybyn.settings.bluetooth;

import android.provider.Settings.Global;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;

class DockService$3 implements OnCheckedChangeListener {
    final /* synthetic */ DockService this$0;

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        if (DockService.access$400(this.this$0) != null) {
            LocalBluetoothPreferences.saveDockAutoConnectSetting(this.this$0, DockService.access$400(this.this$0).getAddress(), z);
        } else {
            Global.putInt(this.this$0.getContentResolver(), "dock_audio_media_enabled", z ? 1 : 0);
        }
    }

    DockService$3(DockService dockService) {
        this.this$0 = dockService;
    }
}