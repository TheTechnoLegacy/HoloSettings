package com.jellybyn.settings.users;

import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.Switch;
import com.jellybyn.settings.users.AppRestrictionsFragment.AppRestrictionsPreference;

class AppRestrictionsFragment$AppRestrictionsPreference$1 implements OnCheckedChangeListener {
    final /* synthetic */ AppRestrictionsPreference this$0;
    final /* synthetic */ Switch val$switchView;

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        AppRestrictionsPreference.access$200(this.this$0).onClick(this.val$switchView);
    }

    AppRestrictionsFragment$AppRestrictionsPreference$1(AppRestrictionsPreference appRestrictionsPreference, Switch switchR) {
        this.this$0 = appRestrictionsPreference;
        this.val$switchView = switchR;
    }
}