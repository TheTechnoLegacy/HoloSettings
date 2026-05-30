package com.jellybyn.settings;

import android.os.AsyncResult;
import android.os.Handler;
import android.os.Message;
import java.util.ArrayList;

class RadioInfo$2 extends Handler {
    final /* synthetic */ RadioInfo this$0;

    public void handleMessage(Message message) {
        AsyncResult ar;
        switch (message.what) {
            case 100:
                RadioInfo.access$1200(this.this$0);
                return;
            case 200:
                RadioInfo.access$1300(this.this$0);
                return;
            case 300:
                RadioInfo.access$1400(this.this$0);
                RadioInfo.access$1500(this.this$0);
                return;
            case 1000:
                ar = message.obj;
                if (ar.exception == null) {
                    int i = ((int[]) ar.result)[0];
                    if (i >= RadioInfo.access$1600(this.this$0).length) {
                        RadioInfo.access$1000(this.this$0, "EVENT_QUERY_PREFERRED_TYPE_DONE: unknown type=" + i);
                        i = RadioInfo.access$1600(this.this$0).length - 1;
                    }
                    RadioInfo.access$1700(this.this$0).setSelection(i, true);
                    return;
                }
                RadioInfo.access$1700(this.this$0).setSelection(RadioInfo.access$1600(this.this$0).length - 1, true);
                return;
            case 1001:
                if (message.obj.exception != null) {
                    RadioInfo.access$1800(this.this$0).getPreferredNetworkType(obtainMessage(1000));
                    return;
                }
                return;
            case 1002:
                ar = message.obj;
                if (ar.exception == null) {
                    RadioInfo.access$1900(this.this$0, (ArrayList) ar.result);
                    return;
                } else {
                    RadioInfo.access$2000(this.this$0).setText("unknown");
                    return;
                }
            case 1005:
                ar = message.obj;
                if (ar.exception != null) {
                    RadioInfo.access$2100(this.this$0).setText("refresh error");
                    return;
                } else {
                    RadioInfo.access$2100(this.this$0).setText((String) ar.result);
                    return;
                }
            case 1006:
                RadioInfo.access$2200(this.this$0).setEnabled(true);
                if (message.obj.exception != null) {
                    RadioInfo.access$2100(this.this$0).setText("update error");
                    return;
                }
                return;
            default:
                return;
        }
    }

    RadioInfo$2(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}