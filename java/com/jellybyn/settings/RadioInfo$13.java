package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;

class RadioInfo$13 implements OnClickListener {
    final /* synthetic */ RadioInfo this$0;

    public void onClick(View view) {
        RadioInfo.access$1800(this.this$0).setRadioPower(!RadioInfo.access$3300(this.this$0));
    }

    RadioInfo$13(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}