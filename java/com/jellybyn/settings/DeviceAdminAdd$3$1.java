package com.jellybyn.settings;

import android.app.ActivityManagerNative;
import android.os.Bundle;
import android.os.Handler;
import android.os.RemoteCallback;
import android.os.RemoteException;
import com.jellybyn.settings.DeviceAdminAdd.3;

class DeviceAdminAdd$3$1 extends RemoteCallback {
    final /* synthetic */ 3 this$1;

    protected void onResult(Bundle bundle) {
        CharSequence msg = bundle != null ? bundle.getCharSequence("android.app.extra.DISABLE_WARNING") : null;
        if (msg == null) {
            try {
                ActivityManagerNative.getDefault().resumeAppSwitches();
            } catch (RemoteException e) {
            }
            this.this$1.this$0.mDPM.removeActiveAdmin(this.this$1.this$0.mDeviceAdmin.getComponent());
            this.this$1.this$0.finish();
            return;
        }
        Bundle bundle2 = new Bundle();
        bundle2.putCharSequence("android.app.extra.DISABLE_WARNING", msg);
        this.this$1.this$0.showDialog(1, bundle2);
    }

    DeviceAdminAdd$3$1(3 3, Handler handler) {
        this.this$1 = 3;
        super(handler);
    }
}