package com.jellybyn.settings;

import android.os.Handler;
import android.os.Message;

class CryptKeeper$1 extends Handler {
    final /* synthetic */ CryptKeeper this$0;

    public void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                CryptKeeper.access$700(this.this$0);
                return;
            case 2:
                CryptKeeper.access$200(this.this$0);
                return;
            case 3:
                CryptKeeper.access$800(this.this$0);
                return;
            default:
                return;
        }
    }

    CryptKeeper$1(CryptKeeper cryptKeeper) {
        this.this$0 = cryptKeeper;
    }
}