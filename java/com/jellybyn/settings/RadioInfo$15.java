package com.jellybyn.settings;

import android.os.SystemProperties;
import android.view.View;
import android.view.View.OnClickListener;

class RadioInfo$15 implements OnClickListener {
    final /* synthetic */ RadioInfo this$0;

    public void onClick(View view) {
        boolean newValue = true;
        RadioInfo radioInfo = this.this$0;
        String str = "toggle %s: currently %s";
        Object[] objArr = new Object[2];
        objArr[0] = "persist.radio.imsallowmtsms";
        objArr[1] = RadioInfo.access$3700(this.this$0) ? "on" : "off";
        RadioInfo.access$1000(radioInfo, String.format(str, objArr));
        if (RadioInfo.access$3700(this.this$0)) {
            newValue = false;
        }
        SystemProperties.set("persist.radio.imsallowmtsms", newValue ? "1" : "0");
        RadioInfo.access$3800(this.this$0);
    }

    RadioInfo$15(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}