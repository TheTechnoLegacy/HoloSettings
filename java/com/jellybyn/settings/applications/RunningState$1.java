package com.jellybyn.settings.applications;

import android.app.ActivityManager.RunningAppProcessInfo;
import com.jellybyn.settings.applications.RunningState.MergedItem;
import java.util.Comparator;

class RunningState$1 implements Comparator<MergedItem> {
    final /* synthetic */ RunningState this$0;

    public int compare(MergedItem mergedItem, MergedItem mergedItem2) {
        int i = 1;
        if (mergedItem.mUserId != mergedItem2.mUserId) {
            if (mergedItem.mUserId == this.this$0.mMyUserId) {
                return -1;
            }
            if (mergedItem2.mUserId == this.this$0.mMyUserId) {
                return 1;
            }
            return mergedItem.mUserId >= mergedItem2.mUserId ? 1 : -1;
        } else if (mergedItem.mProcess == mergedItem2.mProcess) {
            if (mergedItem.mLabel == mergedItem2.mLabel) {
                return 0;
            }
            return mergedItem.mLabel != null ? mergedItem.mLabel.compareTo(mergedItem2.mLabel) : -1;
        } else if (mergedItem.mProcess == null) {
            return -1;
        } else {
            if (mergedItem2.mProcess == null) {
                return 1;
            }
            RunningAppProcessInfo lhsInfo = mergedItem.mProcess.mRunningProcessInfo;
            RunningAppProcessInfo rhsInfo = mergedItem2.mProcess.mRunningProcessInfo;
            boolean lhsBg = lhsInfo.importance >= 400;
            if (lhsBg != (rhsInfo.importance >= 400)) {
                if (!lhsBg) {
                    i = -1;
                }
                return i;
            }
            boolean lhsA = (lhsInfo.flags & 4) != 0;
            if (lhsA != ((rhsInfo.flags & 4) != 0)) {
                return !lhsA ? 1 : -1;
            } else {
                if (lhsInfo.lru != rhsInfo.lru) {
                    return lhsInfo.lru >= rhsInfo.lru ? 1 : -1;
                } else {
                    if (mergedItem.mProcess.mLabel == mergedItem2.mProcess.mLabel) {
                        return 0;
                    }
                    if (mergedItem.mProcess.mLabel == null) {
                        return 1;
                    }
                    return mergedItem2.mProcess.mLabel != null ? mergedItem.mProcess.mLabel.compareTo(mergedItem2.mProcess.mLabel) : -1;
                }
            }
        }
    }

    RunningState$1(RunningState runningState) {
        this.this$0 = runningState;
    }
}