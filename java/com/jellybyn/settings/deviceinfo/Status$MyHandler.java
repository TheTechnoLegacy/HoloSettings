package com.jellybyn.settings.deviceinfo;

import android.os.Handler;
import android.os.Message;
import java.lang.ref.WeakReference;

class Status$MyHandler extends Handler {
    private WeakReference<Status> mStatus;

    public void handleMessage(Message message) {
        Status status = (Status) this.mStatus.get();
        if (status != null) {
            switch (message.what) {
                case 200:
                    status.updateSignalStrength();
                    return;
                case 300:
                    Status.access$100(status, Status.access$000(status).getServiceState());
                    return;
                case 500:
                    status.updateTimes();
                    sendEmptyMessageDelayed(500, 1000);
                    return;
                default:
                    return;
            }
        }
    }

    public Status$MyHandler(Status status) {
        this.mStatus = new WeakReference(status);
    }
}