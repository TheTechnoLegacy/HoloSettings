package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;

class RadioInfo$CellInfoListRateHandler implements OnClickListener {
    int index = 0;
    int[] rates = new int[]{Integer.MAX_VALUE, 0, 1000};
    final /* synthetic */ RadioInfo this$0;

    public void onClick(View view) {
        this.index++;
        if (this.index >= this.rates.length) {
            this.index = 0;
        }
        RadioInfo.access$1800(this.this$0).setCellInfoListRate(this.rates[this.index]);
        RadioInfo.access$3400(this.this$0);
    }

    RadioInfo$CellInfoListRateHandler(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }

    public int getRate() {
        return this.rates[this.index];
    }
}