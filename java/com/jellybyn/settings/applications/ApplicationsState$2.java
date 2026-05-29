package com.jellybyn.settings.applications;

import com.jellybyn.settings.applications.ApplicationsState.AppEntry;
import java.text.Collator;
import java.util.Comparator;

class ApplicationsState$2 implements Comparator<AppEntry> {
    private final Collator sCollator = Collator.getInstance();

    public int compare(AppEntry appEntry, AppEntry appEntry2) {
        if (appEntry.size < appEntry2.size) {
            return 1;
        }
        return appEntry.size > appEntry2.size ? -1 : this.sCollator.compare(appEntry.label, appEntry2.label);
    }

    ApplicationsState$2() {
    }
}