package com.jellybyn.settings;

import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;

class RadioInfo$10 implements OnMenuItemClickListener {
    final /* synthetic */ RadioInfo this$0;

    public boolean onMenuItemClick(MenuItem menuItem) {
        RadioInfo.access$1800(this.this$0).getDataCallList(null);
        return true;
    }

    RadioInfo$10(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}