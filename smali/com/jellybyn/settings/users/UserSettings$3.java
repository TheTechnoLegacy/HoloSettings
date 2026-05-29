package com.jellybyn.settings.users;

import android.content.pm.UserInfo;
import android.os.AsyncTask;
import android.os.UserHandle;

class UserSettings$3 extends AsyncTask<Void, Void, String> {
    final /* synthetic */ UserSettings this$0;

    protected String doInBackground(Void... voidArr) {
        UserInfo user = UserSettings.access$700(this.this$0).getUserInfo(UserHandle.myUserId());
        if (user.iconPath == null || user.iconPath.equals("")) {
            UserSettings.access$800(this.this$0, user);
        }
        String profileName = UserSettings.access$900(this.this$0);
        return profileName == null ? user.name : profileName;
    }

    protected void onPostExecute(String str) {
        UserSettings.access$600(this.this$0, str);
    }

    UserSettings$3(UserSettings userSettings) {
        this.this$0 = userSettings;
    }
}