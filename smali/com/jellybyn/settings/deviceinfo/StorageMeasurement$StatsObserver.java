package com.jellybyn.settings.deviceinfo;

import android.content.pm.IPackageStatsObserver.Stub;
import android.content.pm.PackageStats;
import android.os.Environment;
import android.os.Message;
import com.jellybyn.settings.deviceinfo.StorageMeasurement.MeasurementDetails;

class StorageMeasurement$StatsObserver extends Stub {
    private final int mCurrentUser;
    private final MeasurementDetails mDetails;
    private final Message mFinished;
    private final boolean mIsInternal;
    private int mRemaining;

    private void addStatsLocked(PackageStats packageStats) {
        MeasurementDetails measurementDetails;
        if (this.mIsInternal) {
            long j = packageStats.codeSize;
            long j2 = packageStats.dataSize;
            long j3 = packageStats.cacheSize;
            if (Environment.isExternalStorageEmulated()) {
                j += packageStats.externalCodeSize + packageStats.externalObbSize;
                j2 += packageStats.externalDataSize + packageStats.externalMediaSize;
                j3 += packageStats.externalCacheSize;
            }
            if (packageStats.userHandle == this.mCurrentUser) {
                measurementDetails = this.mDetails;
                measurementDetails.appsSize += j;
                measurementDetails = this.mDetails;
                measurementDetails.appsSize += j2;
            }
            StorageMeasurement.access$000(this.mDetails.usersSize, packageStats.userHandle, j2);
            measurementDetails = this.mDetails;
            measurementDetails.cacheSize += j3;
            return;
        }
        measurementDetails = this.mDetails;
        measurementDetails.appsSize += ((packageStats.externalCodeSize + packageStats.externalDataSize) + packageStats.externalMediaSize) + packageStats.externalObbSize;
        measurementDetails = this.mDetails;
        measurementDetails.cacheSize += packageStats.externalCacheSize;
    }

    public void onGetStatsCompleted(PackageStats packageStats, boolean z) {
        synchronized (this.mDetails) {
            if (z) {
                addStatsLocked(packageStats);
            }
            int i = this.mRemaining - 1;
            this.mRemaining = i;
            if (i == 0) {
                this.mFinished.sendToTarget();
            }
        }
    }

    public StorageMeasurement$StatsObserver(boolean z, MeasurementDetails measurementDetails, int i, Message message, int i2) {
        this.mIsInternal = z;
        this.mDetails = measurementDetails;
        this.mCurrentUser = i;
        this.mFinished = message;
        this.mRemaining = i2;
    }
}