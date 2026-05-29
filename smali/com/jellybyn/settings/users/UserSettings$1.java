package com.jellybyn.settings.users;

import android.os.Handler;
import android.os.Message;

class UserSettings$1 extends Handler {
    final /* synthetic */ UserSettings this$0;

    public void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                UserSettings.access$000(this.this$0);
                return;
            case 2:
                UserSettings.access$100(this.this$0, message.arg1);
                return;
            case 3:
                UserSettings.access$200(this.this$0, message.arg1, true);
                return;
            default:
                return;
        }
    }

    UserSettings$1(UserSettings userSettings) {
        this.this$0 = userSettings;
    }
}