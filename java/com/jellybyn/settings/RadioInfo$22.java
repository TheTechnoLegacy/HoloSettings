package com.jellybyn.settings;

import android.os.Message;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;

class RadioInfo$22 implements OnItemSelectedListener {
    final /* synthetic */ RadioInfo this$0;

    public void onItemSelected(AdapterView adapterView, View view, int i, long j) {
        Message msg = RadioInfo.access$4300(this.this$0).obtainMessage(1001);
        if (i >= 0 && i <= RadioInfo.access$1600(this.this$0).length - 2) {
            RadioInfo.access$1800(this.this$0).setPreferredNetworkType(i, msg);
        }
    }

    RadioInfo$22(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }

    public void onNothingSelected(AdapterView adapterView) {
    }
}