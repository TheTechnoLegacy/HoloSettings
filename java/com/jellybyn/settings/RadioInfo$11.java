package com.jellybyn.settings;

import android.content.Intent;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;

class RadioInfo$11 implements OnMenuItemClickListener {
    final /* synthetic */ RadioInfo this$0;

    public boolean onMenuItemClick(MenuItem menuItem) {
        Intent intent = new Intent();
        intent.setClass(this.this$0, BandMode.class);
        this.this$0.startActivity(intent);
        return true;
    }

    RadioInfo$11(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}