package com.jellybyn.settings.nfc;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class NfcEnabler$1 extends BroadcastReceiver {
    final /* synthetic */ NfcEnabler this$0;

    public void onReceive(Context context, Intent intent) {
        if ("android.nfc.action.ADAPTER_STATE_CHANGED".equals(intent.getAction())) {
            NfcEnabler.access$000(this.this$0, intent.getIntExtra("android.nfc.extra.ADAPTER_STATE", 1));
        }
    }

    NfcEnabler$1(NfcEnabler nfcEnabler) {
        this.this$0 = nfcEnabler;
    }
}