package com.jellybyn.settings.applications;

import com.jellybyn.settings.applications.ApplicationsState.AppEntry;
import java.text.Collator;
import java.util.Comparator;

class ApplicationsState$4 implements Comparator<AppEntry> {
    private final Collator sCollator = Collator.getInstance();

    public int compare(AppEntry appEntry, AppEntry appEntry2) {
        if (appEntry.externalSize < appEntry2.externalSize) {
            return 1;
        }
        return appEntry.externalSize > appEntry2.externalSize ? -1 : this.sCollator.compare(appEntry.label, appEntry2.label);
    }

    ApplicationsState$4() {
    }
}