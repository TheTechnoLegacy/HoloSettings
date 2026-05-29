package com.jellybyn.settings.users;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.UserHandle;
import android.os.UserManager;
import com.jellybyn.settings.Utils;

public class ProfileUpdateReceiver extends BroadcastReceiver {
    static void copyProfileName(Context context) {
        SharedPreferences prefs = context.getSharedPreferences("profile", 0);
        if (!prefs.contains("name_copied_once")) {
            int userId = UserHandle.myUserId();
            UserManager um = (UserManager) context.getSystemService("user");
            String profileName = Utils.getMeProfileName(context, false);
            if (profileName != null && profileName.length() > 0) {
                um.setUserName(userId, profileName);
                prefs.edit().putBoolean("name_copied_once", true).commit();
            }
        }
    }

    public void onReceive(Context context, Intent intent) {
        new 1(this, context).start();
    }
}