package com.jellybyn.settings.applications;

import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageManager;
import android.content.pm.IPackageManager.Stub;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;

/* compiled from: ManageApplications */
final class CanBeOnSdCardChecker {
    int mInstallLocation;
    final IPackageManager mPm = Stub.asInterface(ServiceManager.getService("package"));

    boolean check(ApplicationInfo applicationInfo) {
        if ((applicationInfo.flags & 262144) != 0) {
            return true;
        }
        if ((applicationInfo.flags & 1) != 0) {
            return false;
        }
        if (applicationInfo.installLocation == 2 || applicationInfo.installLocation == 0) {
            return true;
        }
        return applicationInfo.installLocation == -1 && this.mInstallLocation == 2;
    }

    void init() {
        try {
            this.mInstallLocation = this.mPm.getInstallLocation();
        } catch (RemoteException e) {
            Log.e("CanBeOnSdCardChecker", "Is Package Manager running?");
        }
    }

    CanBeOnSdCardChecker() {
    }
}