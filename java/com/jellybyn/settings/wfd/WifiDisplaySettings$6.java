package com.jellybyn.settings.wfd;

import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;

class WifiDisplaySettings$6 extends ContentObserver {
    final /* synthetic */ WifiDisplaySettings this$0;

    public void onChange(boolean z, Uri uri) {
        WifiDisplaySettings.access$500(this.this$0);
    }

    WifiDisplaySettings$6(WifiDisplaySettings wifiDisplaySettings, Handler handler) {
        this.this$0 = wifiDisplaySettings;
        super(handler);
    }
}