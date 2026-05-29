package com.jellybyn.settings.bluetooth;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class RequestPermissionActivity$1 extends BroadcastReceiver {
    final /* synthetic */ RequestPermissionActivity this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent != null && RequestPermissionActivity.access$000(this.this$0) && "android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction()) && intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE) == 12 && RequestPermissionActivity.access$100(this.this$0)) {
            RequestPermissionActivity.access$200(this.this$0);
        }
    }

    RequestPermissionActivity$1(RequestPermissionActivity requestPermissionActivity) {
        this.this$0 = requestPermissionActivity;
    }
}