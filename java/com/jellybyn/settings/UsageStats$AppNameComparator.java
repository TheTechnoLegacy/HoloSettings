package com.jellybyn.settings;

import com.android.internal.os.PkgUsageStats;
import java.util.Comparator;
import java.util.Map;

public class UsageStats$AppNameComparator implements Comparator<PkgUsageStats> {
    Map<String, CharSequence> mAppLabelList;

    UsageStats$AppNameComparator(Map<String, CharSequence> appList) {
        this.mAppLabelList = appList;
    }

    public final int compare(PkgUsageStats pkgUsageStats, PkgUsageStats pkgUsageStats2) {
        return ((CharSequence) this.mAppLabelList.get(pkgUsageStats.packageName)).toString().compareTo(((CharSequence) this.mAppLabelList.get(pkgUsageStats2.packageName)).toString());
    }
}