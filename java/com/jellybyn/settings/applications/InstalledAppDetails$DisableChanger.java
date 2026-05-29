package com.jellybyn.settings.applications;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import java.lang.ref.WeakReference;

class InstalledAppDetails$DisableChanger extends AsyncTask<Object, Object, Object> {
    final WeakReference<InstalledAppDetails> mActivity;
    final ApplicationInfo mInfo;
    final PackageManager mPm;
    final int mState;

    InstalledAppDetails$DisableChanger(InstalledAppDetails installedAppDetails, ApplicationInfo applicationInfo, int i) {
        this.mPm = InstalledAppDetails.access$1400(installedAppDetails);
        this.mActivity = new WeakReference(installedAppDetails);
        this.mInfo = applicationInfo;
        this.mState = i;
    }

    protected Object doInBackground(Object... objArr) {
        this.mPm.setApplicationEnabledSetting(this.mInfo.packageName, this.mState, 0);
        return null;
    }
}