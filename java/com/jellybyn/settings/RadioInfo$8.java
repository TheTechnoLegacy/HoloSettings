package com.jellybyn.settings;

import android.content.Intent;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;

class RadioInfo$8 implements OnMenuItemClickListener {
    final /* synthetic */ RadioInfo this$0;

    public boolean onMenuItemClick(MenuItem menuItem) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setClassName("com.android.phone", "com.android.phone.FdnList");
        this.this$0.startActivity(intent);
        return true;
    }

    RadioInfo$8(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}