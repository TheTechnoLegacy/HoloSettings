package com.jellybyn.settings;

import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;

class CryptKeeper$2 implements OnClickListener {
    final /* synthetic */ CryptKeeper this$0;

    public void onClick(View view) {
        this.this$0.sendBroadcast(new Intent("android.intent.action.MASTER_CLEAR"));
    }

    CryptKeeper$2(CryptKeeper cryptKeeper) {
        this.this$0 = cryptKeeper;
    }
}