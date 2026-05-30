package com.jellybyn.settings;

import android.net.ConnectivityManager;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;

class RadioInfo$12 implements OnMenuItemClickListener {
    final /* synthetic */ RadioInfo this$0;

    public boolean onMenuItemClick(MenuItem menuItem) {
        ConnectivityManager cm = (ConnectivityManager) this.this$0.getSystemService("connectivity");
        switch (RadioInfo.access$3200(this.this$0).getDataState()) {
            case 0:
                cm.setMobileDataEnabled(true);
                break;
            case 2:
                cm.setMobileDataEnabled(false);
                break;
        }
        return true;
    }

    RadioInfo$12(RadioInfo radioInfo) {
        this.this$0 = radioInfo;
    }
}