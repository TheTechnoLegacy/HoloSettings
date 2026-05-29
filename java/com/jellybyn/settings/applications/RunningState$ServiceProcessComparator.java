package com.jellybyn.settings.applications;

import com.jellybyn.settings.applications.RunningState.ProcessItem;
import java.util.Comparator;

class RunningState$ServiceProcessComparator implements Comparator<ProcessItem> {
    final /* synthetic */ RunningState this$0;

    public int compare(ProcessItem processItem, ProcessItem processItem2) {
        int i = 1;
        if (processItem.mUserId != processItem2.mUserId) {
            if (processItem.mUserId == this.this$0.mMyUserId) {
                return -1;
            }
            if (processItem2.mUserId == this.this$0.mMyUserId) {
                return 1;
            }
            return processItem.mUserId >= processItem2.mUserId ? 1 : -1;
        } else if (processItem.mIsStarted != processItem2.mIsStarted) {
            return !processItem.mIsStarted ? 1 : -1;
        } else {
            if (processItem.mIsSystem != processItem2.mIsSystem) {
                if (!processItem.mIsSystem) {
                    i = -1;
                }
                return i;
            } else if (processItem.mActiveSince != processItem2.mActiveSince) {
                return processItem.mActiveSince <= processItem2.mActiveSince ? 1 : -1;
            } else {
                return 0;
            }
        }
    }

    RunningState$ServiceProcessComparator(RunningState runningState) {
        this.this$0 = runningState;
    }
}