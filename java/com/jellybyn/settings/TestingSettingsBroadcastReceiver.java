package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class TestingSettingsBroadcastReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.provider.Telephony.SECRET_CODE")) {
            Intent intent2 = new Intent("android.intent.action.MAIN");
            intent2.setClass(context, TestingSettings.class);
            intent2.setFlags(268435456);
            context.startActivity(intent2);
        }
    }
}