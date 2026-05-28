package com.jellybyn.settings.deviceinfo;

import android.os.Handler;
import android.os.Message;

class StorageVolumePreferenceCategory$1 extends Handler {
    final /* synthetic */ StorageVolumePreferenceCategory this$0;

    public void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                long[] jArr = (long[]) message.obj;
                this.this$0.updateApproximate(jArr[0], jArr[1]);
                return;
            case 2:
                this.this$0.updateDetails(message.obj);
                return;
            default:
                return;
        }
    }

    StorageVolumePreferenceCategory$1(StorageVolumePreferenceCategory storageVolumePreferenceCategory) {
        this.this$0 = storageVolumePreferenceCategory;
    }
}