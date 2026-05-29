package com.jellybyn.settings.applications;

import android.app.AppOpsManager;
import android.app.AppOpsManager.OpEntry;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.graphics.drawable.Drawable;
import android.util.SparseArray;
import com.jellybyn.settings.applications.AppOpsState.AppOpEntry;
import java.io.File;

public class AppOpsState$AppEntry {
    private final File mApkFile;
    private Drawable mIcon;
    private final ApplicationInfo mInfo;
    private String mLabel;
    private boolean mMounted;
    private final SparseArray<AppOpEntry> mOpSwitches = new SparseArray();
    private final SparseArray<OpEntry> mOps = new SparseArray();
    private final AppOpsState mState;

    public Drawable getIcon() {
        if (this.mIcon == null) {
            if (this.mApkFile.exists()) {
                this.mIcon = this.mInfo.loadIcon(this.mState.mPm);
                return this.mIcon;
            }
            this.mMounted = false;
        } else if (this.mMounted) {
            return this.mIcon;
        } else {
            if (this.mApkFile.exists()) {
                this.mMounted = true;
                this.mIcon = this.mInfo.loadIcon(this.mState.mPm);
                return this.mIcon;
            }
        }
        return this.mState.mContext.getResources().getDrawable(17301651);
    }

    void loadLabel(Context context) {
        if (this.mLabel != null && this.mMounted) {
            return;
        }
        if (this.mApkFile.exists()) {
            this.mMounted = true;
            CharSequence label = this.mInfo.loadLabel(context.getPackageManager());
            this.mLabel = label != null ? label.toString() : this.mInfo.packageName;
            return;
        }
        this.mMounted = false;
        this.mLabel = this.mInfo.packageName;
    }

    public AppOpsState$AppEntry(AppOpsState appOpsState, ApplicationInfo applicationInfo) {
        this.mState = appOpsState;
        this.mInfo = applicationInfo;
        this.mApkFile = new File(applicationInfo.sourceDir);
    }

    public void addOp(AppOpEntry appOpEntry, OpEntry opEntry) {
        this.mOps.put(opEntry.getOp(), opEntry);
        this.mOpSwitches.put(AppOpsManager.opToSwitch(opEntry.getOp()), appOpEntry);
    }

    public ApplicationInfo getApplicationInfo() {
        return this.mInfo;
    }

    public String getLabel() {
        return this.mLabel;
    }

    public AppOpEntry getOpSwitch(int i) {
        return (AppOpEntry) this.mOpSwitches.get(AppOpsManager.opToSwitch(i));
    }

    public boolean hasOp(int i) {
        return this.mOps.indexOfKey(i) >= 0;
    }

    public String toString() {
        return this.mLabel;
    }
}