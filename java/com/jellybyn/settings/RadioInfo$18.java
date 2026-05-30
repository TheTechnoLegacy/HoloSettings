package com.jellybyn.settings;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;

class RadioInfo$18 implements OnClickListener {
    final /* synthetic */ RadioInfo this$0;

    public void onClick(View view) {
        try {
            this.this$0.startActivity(new Intent("com.jellybyn.settings.OEM_RADIO_INFO"));
        } catch (ActivityNotFoundException ex) {
            RadioInfo.access$1000(this.this$0, "OEM-specific Info/Settings Activity Not Found : " + ex);
        }
    }

    RadioInfo$18(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}