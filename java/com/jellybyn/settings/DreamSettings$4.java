package com.jellybyn.settings;

import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;

class DreamSettings$4 implements OnMenuItemClickListener {
    final /* synthetic */ DreamSettings this$0;
    final /* synthetic */ Runnable val$onClick;

    public boolean onMenuItemClick(MenuItem menuItem) {
        this.val$onClick.run();
        return true;
    }

    DreamSettings$4(DreamSettings dreamSettings, Runnable runnable) {
        this.this$0 = dreamSettings;
        this.val$onClick = runnable;
    }
}