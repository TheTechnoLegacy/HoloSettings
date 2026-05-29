package com.jellybyn.settings.applications;

import android.content.pm.ApplicationInfo;
import com.jellybyn.settings.applications.ApplicationsState.AppFilter;

class ApplicationsState$6 implements AppFilter {
    final CanBeOnSdCardChecker mCanBeOnSdCardChecker = new CanBeOnSdCardChecker();

    ApplicationsState$6() {
    }

    public void init() {
        this.mCanBeOnSdCardChecker.init();
    }

    public boolean filterApp(ApplicationInfo applicationInfo) {
        return this.mCanBeOnSdCardChecker.check(applicationInfo);
    }
}