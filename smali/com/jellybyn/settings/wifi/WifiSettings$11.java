package com.jellybyn.settings.wifi;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class WifiSettings$11 implements OnClickListener {
    final /* synthetic */ WifiSettings this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.this$0.getActivity().setResult(1);
        this.this$0.getActivity().finish();
    }

    WifiSettings$11(WifiSettings wifiSettings) {
        this.this$0 = wifiSettings;
    }
}