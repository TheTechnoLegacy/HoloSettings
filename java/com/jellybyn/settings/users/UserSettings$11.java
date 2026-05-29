package com.jellybyn.settings.users;

import android.content.pm.UserInfo;

class UserSettings$11 extends Thread {
    final /* synthetic */ UserSettings this$0;
    final /* synthetic */ int val$userType;

    public void run() {
        UserInfo user = this.val$userType == 1 ? UserSettings.access$1700(this.this$0) : UserSettings.access$1800(this.this$0);
        synchronized (UserSettings.access$1600(this.this$0)) {
            UserSettings.access$1902(this.this$0, false);
            if (this.val$userType == 1) {
                UserSettings.access$500(this.this$0).sendEmptyMessage(1);
                UserSettings.access$500(this.this$0).sendMessage(UserSettings.access$500(this.this$0).obtainMessage(2, user.id, user.serialNumber));
            } else {
                UserSettings.access$500(this.this$0).sendMessage(UserSettings.access$500(this.this$0).obtainMessage(3, user.id, user.serialNumber));
            }
        }
    }

    UserSettings$11(UserSettings userSettings, int i) {
        this.this$0 = userSettings;
        this.val$userType = i;
    }
}