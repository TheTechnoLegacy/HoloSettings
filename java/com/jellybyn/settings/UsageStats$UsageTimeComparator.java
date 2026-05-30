package com.jellybyn.settings;

import com.android.internal.os.PkgUsageStats;
import java.util.Comparator;

public class UsageStats$UsageTimeComparator implements Comparator<PkgUsageStats> {
    public final int compare(PkgUsageStats pkgUsageStats, PkgUsageStats pkgUsageStats2) {
        long ret = pkgUsageStats.usageTime - pkgUsageStats2.usageTime;
        if (ret == 0) {
            return 0;
        }
        return ret < 0 ? 1 : -1;
    }
}