package com.jellybyn.settings.users;

import com.jellybyn.settings.users.AppRestrictionsFragment.SelectableAppInfo;
import java.util.Comparator;

class AppRestrictionsFragment$AppLabelComparator implements Comparator<SelectableAppInfo> {
    final /* synthetic */ AppRestrictionsFragment this$0;

    public int compare(SelectableAppInfo selectableAppInfo, SelectableAppInfo selectableAppInfo2) {
        return selectableAppInfo.activityName.toString().toLowerCase().compareTo(selectableAppInfo2.activityName.toString().toLowerCase());
    }

    private AppRestrictionsFragment$AppLabelComparator(AppRestrictionsFragment appRestrictionsFragment) {
        this.this$0 = appRestrictionsFragment;
    }
}