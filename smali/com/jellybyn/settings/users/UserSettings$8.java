package com.jellybyn.settings.users;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class UserSettings$8 implements OnClickListener {
    final /* synthetic */ UserSettings this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        UserSettings.access$1400(this.this$0, i == 0 ? 1 : 2);
    }

    UserSettings$8(UserSettings userSettings) {
        this.this$0 = userSettings;
    }
}