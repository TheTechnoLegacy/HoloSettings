package com.jellybyn.settings.applications;

import android.content.pm.ApplicationInfo;

public interface ApplicationsState$AppFilter {
    boolean filterApp(ApplicationInfo applicationInfo);

    void init();
}