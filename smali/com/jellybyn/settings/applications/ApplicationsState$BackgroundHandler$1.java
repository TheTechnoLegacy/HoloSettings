package com.jellybyn.settings.applications;

import android.content.pm.IPackageStatsObserver.Stub;
import android.content.pm.PackageStats;
import com.jellybyn.settings.applications.ApplicationsState.AppEntry;
import com.jellybyn.settings.applications.ApplicationsState.BackgroundHandler;

class ApplicationsState$BackgroundHandler$1 extends Stub {
    final /* synthetic */ BackgroundHandler this$1;

    public void onGetStatsCompleted(PackageStats packageStats, boolean z) {
        boolean sizeChanged = false;
        synchronized (this.this$1.this$0.mEntriesMap) {
            AppEntry appEntry = (AppEntry) this.this$1.this$0.mEntriesMap.get(packageStats.packageName);
            if (appEntry != null) {
                synchronized (appEntry) {
                    appEntry.sizeStale = false;
                    appEntry.sizeLoadStart = 0;
                    long j = packageStats.externalCodeSize + packageStats.externalObbSize;
                    long j2 = packageStats.externalDataSize + packageStats.externalMediaSize;
                    long access$100 = (j + j2) + ApplicationsState.access$100(this.this$1.this$0, packageStats);
                    if (!(appEntry.size == access$100 && appEntry.cacheSize == packageStats.cacheSize && appEntry.codeSize == packageStats.codeSize && appEntry.dataSize == packageStats.dataSize && appEntry.externalCodeSize == j && appEntry.externalDataSize == j2 && appEntry.externalCacheSize == packageStats.externalCacheSize)) {
                        appEntry.size = access$100;
                        appEntry.cacheSize = packageStats.cacheSize;
                        appEntry.codeSize = packageStats.codeSize;
                        appEntry.dataSize = packageStats.dataSize;
                        appEntry.externalCodeSize = j;
                        appEntry.externalDataSize = j2;
                        appEntry.externalCacheSize = packageStats.externalCacheSize;
                        appEntry.sizeStr = ApplicationsState.access$200(this.this$1.this$0, appEntry.size);
                        appEntry.internalSize = ApplicationsState.access$100(this.this$1.this$0, packageStats);
                        appEntry.internalSizeStr = ApplicationsState.access$200(this.this$1.this$0, appEntry.internalSize);
                        appEntry.externalSize = ApplicationsState.access$300(this.this$1.this$0, packageStats);
                        appEntry.externalSizeStr = ApplicationsState.access$200(this.this$1.this$0, appEntry.externalSize);
                        sizeChanged = true;
                    }
                }
                if (sizeChanged) {
                    this.this$1.this$0.mMainHandler.sendMessage(this.this$1.this$0.mMainHandler.obtainMessage(4, packageStats.packageName));
                }
            }
            if (this.this$1.this$0.mCurComputingSizePkg == null || this.this$1.this$0.mCurComputingSizePkg.equals(packageStats.packageName)) {
                this.this$1.this$0.mCurComputingSizePkg = null;
                this.this$1.sendEmptyMessage(4);
            }
        }
    }

    ApplicationsState$BackgroundHandler$1(BackgroundHandler backgroundHandler) {
        this.this$1 = backgroundHandler;
    }
}