package com.jellybyn.settings.applications;

import android.content.Context;
import android.content.pm.PackageItemInfo;
import android.graphics.drawable.Drawable;

class RunningState$BaseItem {
    long mActiveSince;
    boolean mBackground;
    int mCurSeq;
    String mCurSizeStr;
    String mDescription;
    CharSequence mDisplayLabel;
    final boolean mIsProcess;
    String mLabel;
    boolean mNeedDivider;
    PackageItemInfo mPackageInfo;
    long mSize;
    String mSizeStr;
    final int mUserId;

    public RunningState$BaseItem(boolean z, int i) {
        this.mIsProcess = z;
        this.mUserId = i;
    }

    public Drawable loadIcon(Context context, RunningState runningState) {
        return this.mPackageInfo != null ? this.mPackageInfo.loadIcon(runningState.mPm) : null;
    }
}