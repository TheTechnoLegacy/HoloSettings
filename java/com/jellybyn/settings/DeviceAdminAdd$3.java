package com.jellybyn.settings;

import android.app.ActivityManagerNative;
import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;

class DeviceAdminAdd$3 implements OnClickListener {
    final /* synthetic */ DeviceAdminAdd this$0;

    public void onClick(View view) {
        if (this.this$0.mAdding) {
            try {
                this.this$0.mDPM.setActiveAdmin(this.this$0.mDeviceAdmin.getComponent(), this.this$0.mRefreshing);
                this.this$0.setResult(-1);
            } catch (RuntimeException e) {
                Log.w("DeviceAdminAdd", "Exception trying to activate admin " + this.this$0.mDeviceAdmin.getComponent(), e);
                if (this.this$0.mDPM.isAdminActive(this.this$0.mDeviceAdmin.getComponent())) {
                    this.this$0.setResult(-1);
                }
            }
            this.this$0.finish();
            return;
        }
        try {
            ActivityManagerNative.getDefault().stopAppSwitches();
        } catch (RemoteException e2) {
        }
        this.this$0.mDPM.getRemoveWarning(this.this$0.mDeviceAdmin.getComponent(), new 1(this, this.this$0.mHandler));
    }

    DeviceAdminAdd$3(DeviceAdminAdd deviceAdminAdd) {
        this.this$0 = deviceAdminAdd;
    }
}