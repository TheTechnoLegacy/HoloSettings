package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;

class RadioInfo$17 implements OnClickListener {
    final /* synthetic */ RadioInfo this$0;

    public void onClick(View view) {
        RadioInfo.access$1800(this.this$0).disableDnsCheck(!RadioInfo.access$1800(this.this$0).isDnsCheckDisabled());
        RadioInfo.access$4100(this.this$0);
    }

    RadioInfo$17(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}