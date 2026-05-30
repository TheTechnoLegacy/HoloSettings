package com.jellybyn.settings;

import android.content.Intent;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;

class RadioInfo$7 implements OnMenuItemClickListener {
    final /* synthetic */ RadioInfo this$0;

    public boolean onMenuItemClick(MenuItem menuItem) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setClassName("com.android.phone", "com.android.phone.SimContacts");
        this.this$0.startActivity(intent);
        return true;
    }

    RadioInfo$7(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}