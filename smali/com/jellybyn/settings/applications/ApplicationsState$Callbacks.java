package com.jellybyn.settings.applications;

import com.jellybyn.settings.applications.ApplicationsState.AppEntry;
import java.util.ArrayList;

public interface ApplicationsState$Callbacks {
    void onAllSizesComputed();

    void onPackageIconChanged();

    void onPackageListChanged();

    void onPackageSizeChanged(String str);

    void onRebuildComplete(ArrayList<AppEntry> arrayList);

    void onRunningStateChanged(boolean z);
}