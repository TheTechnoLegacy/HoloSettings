package com.jellybyn.settings.quicklaunch;

import android.database.ContentObserver;
import android.os.Handler;

class QuickLaunchSettings$BookmarksObserver extends ContentObserver {
    final /* synthetic */ QuickLaunchSettings this$0;

    public QuickLaunchSettings$BookmarksObserver(QuickLaunchSettings quickLaunchSettings, Handler handler) {
        this.this$0 = quickLaunchSettings;
        super(handler);
    }

    public void onChange(boolean z) {
        super.onChange(z);
        QuickLaunchSettings.access$000(this.this$0);
    }
}