package com.jellybyn.settings.users;

class UserSettings$10 extends Thread {
    final /* synthetic */ UserSettings this$0;

    public void run() {
        synchronized (UserSettings.access$1600(this.this$0)) {
            UserSettings.access$700(this.this$0).removeUser(UserSettings.access$300(this.this$0));
            UserSettings.access$500(this.this$0).sendEmptyMessage(1);
        }
    }

    UserSettings$10(UserSettings userSettings) {
        this.this$0 = userSettings;
    }
}