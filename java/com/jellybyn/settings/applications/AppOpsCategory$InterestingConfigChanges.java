package com.jellybyn.settings.applications;

import android.content.res.Configuration;
import android.content.res.Resources;

public class AppOpsCategory$InterestingConfigChanges {
    final Configuration mLastConfiguration = new Configuration();
    int mLastDensity;

    boolean applyNewConfig(Resources resources) {
        int configChanges = this.mLastConfiguration.updateFrom(resources.getConfiguration());
        if (!(this.mLastDensity != resources.getDisplayMetrics().densityDpi) && (configChanges & 772) == 0) {
            return false;
        }
        this.mLastDensity = resources.getDisplayMetrics().densityDpi;
        return true;
    }
}