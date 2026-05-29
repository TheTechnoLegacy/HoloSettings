package com.jellybyn.settings.applications;

import com.jellybyn.settings.applications.ApplicationsState.AppEntry;
import java.text.Collator;
import java.util.Comparator;

class ApplicationsState$1 implements Comparator<AppEntry> {
    private final Collator sCollator = Collator.getInstance();

    public int compare(AppEntry appEntry, AppEntry appEntry2) {
        boolean normal1 = appEntry.info.enabled && (appEntry.info.flags & 8388608) != 0;
        boolean normal2 = appEntry2.info.enabled && (appEntry2.info.flags & 8388608) != 0;
        if (normal1 != normal2) {
            return normal1 ? -1 : 1;
        } else {
            return this.sCollator.compare(appEntry.label, appEntry2.label);
        }
    }

    ApplicationsState$1() {
    }
}