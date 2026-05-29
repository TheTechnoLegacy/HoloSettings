package com.jellybyn.settings.users;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class AppRestrictionsFragment$1 extends BroadcastReceiver {
    final /* synthetic */ AppRestrictionsFragment this$0;

    public void onReceive(Context context, Intent intent) {
        if (AppRestrictionsFragment.access$000(this.this$0)) {
            AppRestrictionsFragment.access$100(this.this$0);
        }
    }

    AppRestrictionsFragment$1(AppRestrictionsFragment appRestrictionsFragment) {
        this.this$0 = appRestrictionsFragment;
    }
}