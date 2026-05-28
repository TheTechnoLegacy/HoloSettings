package com.jellybyn.settings.deviceinfo;

import android.telephony.PhoneStateListener;

class Status$2 extends PhoneStateListener {
    final /* synthetic */ Status this$0;

    public void onDataConnectionStateChanged(int i) {
        Status.access$400(this.this$0);
        Status.access$500(this.this$0);
    }

    Status$2(Status status) {
        this.this$0 = status;
    }
}