package com.jellybyn.settings.applications;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

class ApplicationsState$PackageIntentReceiver extends BroadcastReceiver {
    final /* synthetic */ ApplicationsState this$0;

    public void onReceive(Context context, Intent intent) {
        String actionStr = intent.getAction();
        if ("android.intent.action.PACKAGE_ADDED".equals(actionStr)) {
            this.this$0.addPackage(intent.getData().getEncodedSchemeSpecificPart());
        } else if ("android.intent.action.PACKAGE_REMOVED".equals(actionStr)) {
            this.this$0.removePackage(intent.getData().getEncodedSchemeSpecificPart());
        } else if ("android.intent.action.PACKAGE_CHANGED".equals(actionStr)) {
            this.this$0.invalidatePackage(intent.getData().getEncodedSchemeSpecificPart());
        } else if ("android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE".equals(actionStr) || "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE".equals(actionStr)) {
            String[] pkgList = intent.getStringArrayExtra("android.intent.extra.changed_package_list");
            if (pkgList != null && pkgList.length != 0 && "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE".equals(actionStr)) {
                for (String pkgName : pkgList) {
                    this.this$0.invalidatePackage(pkgName);
                }
            }
        }
    }

    void registerReceiver() {
        IntentFilter filter = new IntentFilter("android.intent.action.PACKAGE_ADDED");
        filter.addAction("android.intent.action.PACKAGE_REMOVED");
        filter.addAction("android.intent.action.PACKAGE_CHANGED");
        filter.addDataScheme("package");
        this.this$0.mContext.registerReceiver(this, filter);
        IntentFilter sdFilter = new IntentFilter();
        sdFilter.addAction("android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE");
        sdFilter.addAction("android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE");
        this.this$0.mContext.registerReceiver(this, sdFilter);
    }

    void unregisterReceiver() {
        this.this$0.mContext.unregisterReceiver(this);
    }

    private ApplicationsState$PackageIntentReceiver(ApplicationsState applicationsState) {
        this.this$0 = applicationsState;
    }
}