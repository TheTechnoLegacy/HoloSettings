package com.jellybyn.settings.applications;

import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ActivityManager.RunningServiceInfo;
import android.app.ActivityThread;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.RemoteException;
import android.os.UserHandle;
import android.text.format.Formatter;
import android.util.Log;
import android.util.SparseArray;
import com.jellybyn.settings.applications.RunningState.BaseItem;
import com.jellybyn.settings.applications.RunningState.MergedItem;
import com.jellybyn.settings.applications.RunningState.ServiceItem;
import java.util.ArrayList;
import java.util.HashMap;

class RunningState$ProcessItem extends BaseItem {
    long mActiveSince;
    RunningState$ProcessItem mClient;
    final SparseArray<RunningState$ProcessItem> mDependentProcesses = new SparseArray();
    boolean mInteresting;
    boolean mIsStarted;
    boolean mIsSystem;
    int mLastNumDependentProcesses;
    MergedItem mMergedItem;
    int mPid;
    final String mProcessName;
    RunningAppProcessInfo mRunningProcessInfo;
    int mRunningSeq;
    final HashMap<ComponentName, ServiceItem> mServices = new HashMap();
    final int mUid;

    boolean updateService(Context context, RunningServiceInfo runningServiceInfo) {
        PackageManager pm = context.getPackageManager();
        boolean changed = false;
        ServiceItem si = (ServiceItem) this.mServices.get(runningServiceInfo.service);
        if (si == null) {
            changed = true;
            si = new ServiceItem(this.mUserId);
            si.mRunningService = runningServiceInfo;
            try {
                si.mServiceInfo = ActivityThread.getPackageManager().getServiceInfo(runningServiceInfo.service, 8192, UserHandle.getUserId(runningServiceInfo.uid));
                if (si.mServiceInfo == null) {
                    Log.d("RunningService", "getServiceInfo returned null for: " + runningServiceInfo.service);
                    return false;
                }
            } catch (RemoteException e) {
            }
            si.mDisplayLabel = RunningState.makeLabel(pm, si.mRunningService.service.getClassName(), si.mServiceInfo);
            this.mLabel = this.mDisplayLabel != null ? this.mDisplayLabel.toString() : null;
            si.mPackageInfo = si.mServiceInfo.applicationInfo;
            this.mServices.put(runningServiceInfo.service, si);
        }
        si.mCurSeq = this.mCurSeq;
        si.mRunningService = runningServiceInfo;
        long activeSince = runningServiceInfo.restarting == 0 ? runningServiceInfo.activeSince : -1;
        if (si.mActiveSince != activeSince) {
            si.mActiveSince = activeSince;
            changed = true;
        }
        if (runningServiceInfo.clientPackage == null || runningServiceInfo.clientLabel == 0) {
            if (!si.mShownAsStarted) {
                si.mShownAsStarted = true;
                changed = true;
            }
            si.mDescription = context.getResources().getString(2131428441);
        } else {
            if (si.mShownAsStarted) {
                si.mShownAsStarted = false;
                changed = true;
            }
            try {
                String string = pm.getResourcesForApplication(runningServiceInfo.clientPackage).getString(runningServiceInfo.clientLabel);
                si.mDescription = context.getResources().getString(2131428442, new Object[]{string});
            } catch (NameNotFoundException e2) {
                si.mDescription = null;
            }
        }
        return changed;
    }

    void ensureLabel(PackageManager packageManager) {
        if (this.mLabel == null) {
            ApplicationInfo applicationInfo;
            try {
                applicationInfo = packageManager.getApplicationInfo(this.mProcessName, 8192);
                if (applicationInfo.uid == this.mUid) {
                    this.mDisplayLabel = applicationInfo.loadLabel(packageManager);
                    this.mLabel = this.mDisplayLabel.toString();
                    this.mPackageInfo = applicationInfo;
                    return;
                }
            } catch (NameNotFoundException e) {
            }
            String[] pkgs = packageManager.getPackagesForUid(this.mUid);
            if (pkgs.length == 1) {
                try {
                    applicationInfo = packageManager.getApplicationInfo(pkgs[0], 8192);
                    this.mDisplayLabel = applicationInfo.loadLabel(packageManager);
                    this.mLabel = this.mDisplayLabel.toString();
                    this.mPackageInfo = applicationInfo;
                    return;
                } catch (NameNotFoundException e2) {
                }
            }
            for (String str : pkgs) {
                try {
                    PackageInfo packageInfo = packageManager.getPackageInfo(str, 0);
                    if (packageInfo.sharedUserLabel != 0) {
                        CharSequence text = packageManager.getText(str, packageInfo.sharedUserLabel, packageInfo.applicationInfo);
                        if (text != null) {
                            this.mDisplayLabel = text;
                            this.mLabel = text.toString();
                            this.mPackageInfo = packageInfo.applicationInfo;
                            return;
                        }
                    } else {
                        continue;
                    }
                } catch (NameNotFoundException e3) {
                }
            }
            if (this.mServices.size() > 0) {
                this.mPackageInfo = ((ServiceItem) this.mServices.values().iterator().next()).mServiceInfo.applicationInfo;
                this.mDisplayLabel = this.mPackageInfo.loadLabel(packageManager);
                this.mLabel = this.mDisplayLabel.toString();
                return;
            }
            try {
                applicationInfo = packageManager.getApplicationInfo(pkgs[0], 8192);
                this.mDisplayLabel = applicationInfo.loadLabel(packageManager);
                this.mLabel = this.mDisplayLabel.toString();
                this.mPackageInfo = applicationInfo;
            } catch (NameNotFoundException e4) {
            }
        }
    }

    boolean buildDependencyChain(Context context, PackageManager packageManager, int i) {
        int NP = this.mDependentProcesses.size();
        boolean changed = false;
        for (int i2 = 0; i2 < NP; i2++) {
            RunningState$ProcessItem runningState$ProcessItem = (RunningState$ProcessItem) this.mDependentProcesses.valueAt(i2);
            if (runningState$ProcessItem.mClient != this) {
                changed = true;
                runningState$ProcessItem.mClient = this;
            }
            runningState$ProcessItem.mCurSeq = i;
            runningState$ProcessItem.ensureLabel(packageManager);
            changed |= runningState$ProcessItem.buildDependencyChain(context, packageManager, i);
        }
        if (this.mLastNumDependentProcesses == this.mDependentProcesses.size()) {
            return changed;
        }
        this.mLastNumDependentProcesses = this.mDependentProcesses.size();
        return true;
    }

    void addDependentProcesses(ArrayList<BaseItem> dest, ArrayList<RunningState$ProcessItem> destProc) {
        int NP = this.mDependentProcesses.size();
        for (int i = 0; i < NP; i++) {
            RunningState$ProcessItem runningState$ProcessItem = (RunningState$ProcessItem) this.mDependentProcesses.valueAt(i);
            runningState$ProcessItem.addDependentProcesses(dest, destProc);
            dest.add(runningState$ProcessItem);
            if (runningState$ProcessItem.mPid > 0) {
                destProc.add(runningState$ProcessItem);
            }
        }
    }

    public RunningState$ProcessItem(Context context, int i, String str) {
        super(true, UserHandle.getUserId(i));
        this.mDescription = context.getResources().getString(2131428446, new Object[]{str});
        this.mUid = i;
        this.mProcessName = str;
    }

    boolean updateSize(Context context, long j, int i) {
        this.mSize = 1024 * j;
        if (this.mCurSeq == i) {
            String formatShortFileSize = Formatter.formatShortFileSize(context, this.mSize);
            if (!formatShortFileSize.equals(this.mSizeStr)) {
                this.mSizeStr = formatShortFileSize;
            }
        }
        return false;
    }
}