package com.jellybyn.settings.wifi;

import android.app.Activity;
import android.os.Handler;
import android.os.Message;
import android.widget.Toast;

class WifiSettings$Scanner extends Handler {
    private int mRetry;
    final /* synthetic */ WifiSettings this$0;

    public void handleMessage(Message message) {
        if (WifiSettings.access$200(this.this$0).startScan()) {
            this.mRetry = 0;
        } else {
            int i = this.mRetry + 1;
            this.mRetry = i;
            if (i >= 3) {
                this.mRetry = 0;
                Activity activity = this.this$0.getActivity();
                if (activity != null) {
                    Toast.makeText(activity, 2131427809, 1).show();
                    return;
                }
                return;
            }
        }
        sendEmptyMessageDelayed(0, 10000);
    }

    void forceScan() {
        removeMessages(0);
        sendEmptyMessage(0);
    }

    void pause() {
        this.mRetry = 0;
        removeMessages(0);
    }

    void resume() {
        if (!hasMessages(0)) {
            sendEmptyMessage(0);
        }
    }

    private WifiSettings$Scanner(WifiSettings wifiSettings) {
        this.this$0 = wifiSettings;
        this.mRetry = 0;
    }
}