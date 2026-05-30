package com.jellybyn.settings;

import android.content.Intent;
import android.net.Uri;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;

class RadioInfo$9 implements OnMenuItemClickListener {
    final /* synthetic */ RadioInfo this$0;

    public boolean onMenuItemClick(MenuItem menuItem) {
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("content://icc/sdn"));
        intent.setClassName("com.android.phone", "com.android.phone.ADNList");
        this.this$0.startActivity(intent);
        return true;
    }

    RadioInfo$9(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}