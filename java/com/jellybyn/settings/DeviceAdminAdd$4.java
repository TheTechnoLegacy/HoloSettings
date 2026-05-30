package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class DeviceAdminAdd$4 implements OnClickListener {
    final /* synthetic */ DeviceAdminAdd this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.this$0.mDPM.removeActiveAdmin(this.this$0.mDeviceAdmin.getComponent());
        this.this$0.finish();
    }

    DeviceAdminAdd$4(DeviceAdminAdd deviceAdminAdd) {
        this.this$0 = deviceAdminAdd;
    }
}