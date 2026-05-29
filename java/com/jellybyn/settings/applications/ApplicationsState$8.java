package com.jellybyn.settings.applications;

import android.content.pm.ApplicationInfo;
import com.jellybyn.settings.applications.ApplicationsState.AppFilter;

class ApplicationsState$8 implements AppFilter {
    public boolean filterApp(ApplicationInfo applicationInfo) {
        return applicationInfo.enabled;
    }

    ApplicationsState$8() {
    }

    public void init() {
    }
}