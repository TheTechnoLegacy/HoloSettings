package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class DreamSettings$PackageReceiver extends BroadcastReceiver {
    final /* synthetic */ DreamSettings this$0;

    public void onReceive(Context context, Intent intent) {
        DreamSettings.access$400("PackageReceiver.onReceive", new Object[0]);
        DreamSettings.access$300(this.this$0);
    }

    private DreamSettings$PackageReceiver(DreamSettings dreamSettings) {
        this.this$0 = dreamSettings;
    }
}