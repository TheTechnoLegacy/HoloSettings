package com.jellybyn.settings.users;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.SharedPreferences;

class UserSettings$5 implements OnClickListener {
    final /* synthetic */ UserSettings this$0;
    final /* synthetic */ boolean val$longMessageDisplayed;
    final /* synthetic */ SharedPreferences val$preferences;
    final /* synthetic */ int val$userType;

    public void onClick(DialogInterface dialogInterface, int i) {
        UserSettings.access$1100(this.this$0, this.val$userType);
        if (!this.val$longMessageDisplayed) {
            this.val$preferences.edit().putBoolean("key_add_user_long_message_displayed", true).apply();
        }
    }

    UserSettings$5(UserSettings userSettings, int i, boolean z, SharedPreferences sharedPreferences) {
        this.this$0 = userSettings;
        this.val$userType = i;
        this.val$longMessageDisplayed = z;
        this.val$preferences = sharedPreferences;
    }
}