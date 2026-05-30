package com.jellybyn.settings;

import com.android.internal.os.PkgUsageStats;
import java.util.Comparator;

public class UsageStats$LaunchCountComparator implements Comparator<PkgUsageStats> {
    public final int compare(PkgUsageStats pkgUsageStats, PkgUsageStats pkgUsageStats2) {
        return pkgUsageStats2.launchCount - pkgUsageStats.launchCount;
    }
}