package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class SoundSettings$2 extends BroadcastReceiver {
    final /* synthetic */ SoundSettings this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.intent.action.DOCK_EVENT")) {
            SoundSettings.access$200(this.this$0, intent);
        }
    }

    SoundSettings$2(SoundSettings soundSettings) {
        this.this$0 = soundSettings;
    }
}