package com.jellybyn.settings.applications;

import com.jellybyn.settings.applications.AppOpsState.AppOpEntry;
import java.text.Collator;
import java.util.Comparator;

class AppOpsState$1 implements Comparator<AppOpEntry> {
    private final Collator sCollator = Collator.getInstance();

    public int compare(AppOpEntry appOpEntry, AppOpEntry appOpEntry2) {
        if (appOpEntry.getSwitchOrder() != appOpEntry2.getSwitchOrder()) {
            return appOpEntry.getSwitchOrder() < appOpEntry2.getSwitchOrder() ? -1 : 1;
        } else {
            if (appOpEntry.isRunning() != appOpEntry2.isRunning()) {
                return !appOpEntry.isRunning() ? 1 : -1;
            } else {
                if (appOpEntry.getTime() != appOpEntry2.getTime()) {
                    return appOpEntry.getTime() <= appOpEntry2.getTime() ? 1 : -1;
                } else {
                    return this.sCollator.compare(appOpEntry.getAppEntry().getLabel(), appOpEntry2.getAppEntry().getLabel());
                }
            }
        }
    }

    AppOpsState$1() {
    }
}