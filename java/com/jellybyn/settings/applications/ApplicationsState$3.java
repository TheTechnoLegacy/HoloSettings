package com.jellybyn.settings.applications;

import com.jellybyn.settings.applications.ApplicationsState.AppEntry;
import java.text.Collator;
import java.util.Comparator;

class ApplicationsState$3 implements Comparator<AppEntry> {
    private final Collator sCollator = Collator.getInstance();

    public int compare(AppEntry appEntry, AppEntry appEntry2) {
        if (appEntry.internalSize < appEntry2.internalSize) {
            return 1;
        }
        return appEntry.internalSize > appEntry2.internalSize ? -1 : this.sCollator.compare(appEntry.label, appEntry2.label);
    }

    ApplicationsState$3() {
    }
}