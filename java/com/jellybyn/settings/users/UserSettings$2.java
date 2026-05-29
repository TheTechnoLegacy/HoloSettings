package com.jellybyn.settings.users;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class UserSettings$2 extends BroadcastReceiver {
    final /* synthetic */ UserSettings this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.intent.action.USER_REMOVED")) {
            UserSettings.access$302(this.this$0, -1);
        } else if (intent.getAction().equals("android.intent.action.USER_INFO_CHANGED")) {
            int userHandle = intent.getIntExtra("android.intent.extra.user_handle", -1);
            if (userHandle != -1) {
                UserSettings.access$400(this.this$0).remove(userHandle);
            }
        }
        UserSettings.access$500(this.this$0).sendEmptyMessage(1);
    }

    UserSettings$2(UserSettings userSettings) {
        this.this$0 = userSettings;
    }
}