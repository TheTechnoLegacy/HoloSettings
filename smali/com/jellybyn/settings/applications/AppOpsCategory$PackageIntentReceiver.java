package com.jellybyn.settings.applications;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.jellybyn.settings.applications.AppOpsCategory.AppListLoader;

public class AppOpsCategory$PackageIntentReceiver extends BroadcastReceiver {
    final AppListLoader mLoader;

    public AppOpsCategory$PackageIntentReceiver(AppListLoader appListLoader) {
        this.mLoader = appListLoader;
        IntentFilter filter = new IntentFilter("android.intent.action.PACKAGE_ADDED");
        filter.addAction("android.intent.action.PACKAGE_REMOVED");
        filter.addAction("android.intent.action.PACKAGE_CHANGED");
        filter.addDataScheme("package");
        this.mLoader.getContext().registerReceiver(this, filter);
        IntentFilter sdFilter = new IntentFilter();
        sdFilter.addAction("android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE");
        sdFilter.addAction("android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE");
        this.mLoader.getContext().registerReceiver(this, sdFilter);
    }

    public void onReceive(Context context, Intent intent) {
        this.mLoader.onContentChanged();
    }
}