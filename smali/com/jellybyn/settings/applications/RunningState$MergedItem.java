package com.jellybyn.settings.applications;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.format.Formatter;
import com.jellybyn.settings.applications.RunningState.BaseItem;
import com.jellybyn.settings.applications.RunningState.ProcessItem;
import com.jellybyn.settings.applications.RunningState.ServiceItem;
import com.jellybyn.settings.applications.RunningState.UserState;
import java.util.ArrayList;

class RunningState$MergedItem extends BaseItem {
    final ArrayList<RunningState$MergedItem> mChildren = new ArrayList();
    private int mLastNumProcesses = -1;
    private int mLastNumServices = -1;
    final ArrayList<ProcessItem> mOtherProcesses = new ArrayList();
    ProcessItem mProcess;
    final ArrayList<ServiceItem> mServices = new ArrayList();
    UserState mUser;

    boolean update(Context context, boolean z) {
        this.mBackground = z;
        int i;
        if (this.mUser != null) {
            this.mPackageInfo = ((RunningState$MergedItem) this.mChildren.get(0)).mProcess.mPackageInfo;
            this.mLabel = this.mUser != null ? this.mUser.mLabel : null;
            this.mDisplayLabel = this.mLabel;
            int i2 = 0;
            int i3 = 0;
            this.mActiveSince = -1;
            for (i = 0; i < this.mChildren.size(); i++) {
                RunningState$MergedItem runningState$MergedItem = (RunningState$MergedItem) this.mChildren.get(i);
                i2 += runningState$MergedItem.mLastNumProcesses;
                i3 += runningState$MergedItem.mLastNumServices;
                if (runningState$MergedItem.mActiveSince >= 0 && this.mActiveSince < runningState$MergedItem.mActiveSince) {
                    this.mActiveSince = runningState$MergedItem.mActiveSince;
                }
            }
            if (!this.mBackground) {
                setDescription(context, i2, i3);
            }
        } else {
            this.mPackageInfo = this.mProcess.mPackageInfo;
            this.mDisplayLabel = this.mProcess.mDisplayLabel;
            this.mLabel = this.mProcess.mLabel;
            if (!this.mBackground) {
                setDescription(context, (this.mProcess.mPid > 0 ? 1 : 0) + this.mOtherProcesses.size(), this.mServices.size());
            }
            this.mActiveSince = -1;
            for (i = 0; i < this.mServices.size(); i++) {
                ServiceItem serviceItem = (ServiceItem) this.mServices.get(i);
                if (serviceItem.mActiveSince >= 0 && this.mActiveSince < serviceItem.mActiveSince) {
                    this.mActiveSince = serviceItem.mActiveSince;
                }
            }
        }
        return false;
    }

    boolean updateSize(Context context) {
        int i;
        if (this.mUser != null) {
            this.mSize = 0;
            for (i = 0; i < this.mChildren.size(); i++) {
                RunningState$MergedItem runningState$MergedItem = (RunningState$MergedItem) this.mChildren.get(i);
                runningState$MergedItem.updateSize(context);
                this.mSize += runningState$MergedItem.mSize;
            }
        } else {
            this.mSize = this.mProcess.mSize;
            for (i = 0; i < this.mOtherProcesses.size(); i++) {
                this.mSize += ((ProcessItem) this.mOtherProcesses.get(i)).mSize;
            }
        }
        String sizeStr = Formatter.formatShortFileSize(context, this.mSize);
        if (!sizeStr.equals(this.mSizeStr)) {
            this.mSizeStr = sizeStr;
        }
        return false;
    }

    private void setDescription(Context context, int i, int i2) {
        if (this.mLastNumProcesses != i || this.mLastNumServices != i2) {
            this.mLastNumProcesses = i;
            this.mLastNumServices = i2;
            int resid = 2131428449;
            if (i != 1) {
                resid = i2 != 1 ? 2131428452 : 2131428451;
            } else if (i2 != 1) {
                resid = 2131428450;
            }
            this.mDescription = context.getResources().getString(resid, new Object[]{Integer.valueOf(i), Integer.valueOf(i2)});
        }
    }

    RunningState$MergedItem(int i) {
        super(false, i);
    }

    public Drawable loadIcon(Context context, RunningState runningState) {
        if (this.mUser == null) {
            return super.loadIcon(context, runningState);
        }
        return this.mUser.mIcon != null ? this.mUser.mIcon.getConstantState().newDrawable() : context.getResources().getDrawable(17302308);
    }
}