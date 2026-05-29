package com.jellybyn.settings.users;

import android.content.Intent;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import com.jellybyn.settings.users.AppRestrictionsFragment.RestrictionsResultReceiver;

class AppRestrictionsFragment$RestrictionsResultReceiver$1 implements OnPreferenceClickListener {
    final /* synthetic */ RestrictionsResultReceiver this$1;
    final /* synthetic */ Intent val$customIntent;

    public boolean onPreferenceClick(Preference preference) {
        this.this$1.this$0.startActivityForResult(this.val$customIntent, AppRestrictionsFragment.access$1300(this.this$1.this$0, this.this$1.preference));
        return false;
    }

    AppRestrictionsFragment$RestrictionsResultReceiver$1(RestrictionsResultReceiver restrictionsResultReceiver, Intent intent) {
        this.this$1 = restrictionsResultReceiver;
        this.val$customIntent = intent;
    }
}