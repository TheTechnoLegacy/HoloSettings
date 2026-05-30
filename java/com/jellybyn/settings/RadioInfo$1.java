package com.jellybyn.settings;

import android.telephony.CellInfo;
import android.telephony.CellLocation;
import android.telephony.PhoneStateListener;
import java.util.List;

class RadioInfo$1 extends PhoneStateListener {
    final /* synthetic */ RadioInfo this$0;

    public void onDataConnectionStateChanged(int i) {
        RadioInfo.access$000(this.this$0);
        RadioInfo.access$100(this.this$0);
        RadioInfo.access$200(this.this$0);
        RadioInfo.access$300(this.this$0);
    }

    public void onCallForwardingIndicatorChanged(boolean z) {
        RadioInfo.access$802(this.this$0, z);
        RadioInfo.access$900(this.this$0);
    }

    public void onCellInfoChanged(List<CellInfo> arrayCi) {
        RadioInfo.access$1000(this.this$0, "onCellInfoChanged: arrayCi=" + arrayCi);
        RadioInfo.access$1100(this.this$0, arrayCi);
    }

    public void onMessageWaitingIndicatorChanged(boolean z) {
        RadioInfo.access$602(this.this$0, z);
        RadioInfo.access$700(this.this$0);
    }

    public void onCellLocationChanged(CellLocation cellLocation) {
        RadioInfo.access$500(this.this$0, cellLocation);
    }

    public void onDataActivity(int i) {
        RadioInfo.access$400(this.this$0);
    }

    RadioInfo$1(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}