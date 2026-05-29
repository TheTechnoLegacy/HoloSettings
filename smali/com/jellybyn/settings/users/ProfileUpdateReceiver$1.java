package com.jellybyn.settings.users;

import android.content.Context;
import com.jellybyn.settings.Utils;

class ProfileUpdateReceiver$1 extends Thread {
    final /* synthetic */ ProfileUpdateReceiver this$0;
    final /* synthetic */ Context val$context;

    public void run() {
        Utils.copyMeProfilePhoto(this.val$context, null);
        ProfileUpdateReceiver.copyProfileName(this.val$context);
    }

    ProfileUpdateReceiver$1(ProfileUpdateReceiver profileUpdateReceiver, Context context) {
        this.this$0 = profileUpdateReceiver;
        this.val$context = context;
    }
}