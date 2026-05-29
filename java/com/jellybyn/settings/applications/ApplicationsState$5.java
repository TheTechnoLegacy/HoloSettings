package com.jellybyn.settings.applications;

import android.content.pm.ApplicationInfo;
import com.jellybyn.settings.applications.ApplicationsState.AppFilter;

class ApplicationsState$5 implements AppFilter {
    public boolean filterApp(ApplicationInfo applicationInfo) {
        return (applicationInfo.flags & 128) != 0 || (applicationInfo.flags & 1) == 0;
    }

    ApplicationsState$5() {
    }

    public void init() {
    }
}