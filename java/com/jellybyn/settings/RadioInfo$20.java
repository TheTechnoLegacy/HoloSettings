package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;

class RadioInfo$20 implements OnClickListener {
    final /* synthetic */ RadioInfo this$0;

    public void onClick(View view) {
        RadioInfo.access$2200(this.this$0).setEnabled(false);
        RadioInfo.access$1800(this.this$0).setSmscAddress(RadioInfo.access$2100(this.this$0).getText().toString(), RadioInfo.access$4300(this.this$0).obtainMessage(1006));
    }

    RadioInfo$20(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}