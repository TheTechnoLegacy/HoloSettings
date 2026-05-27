package com.jellybyn.settings.applications;

import android.app.ActivityManager.RunningServiceInfo;
import android.content.pm.ServiceInfo;
import com.jellybyn.settings.applications.RunningState.BaseItem;
import com.jellybyn.settings.applications.RunningState.MergedItem;

class RunningState$ServiceItem extends BaseItem {
    MergedItem mMergedItem;
    RunningServiceInfo mRunningService;
    ServiceInfo mServiceInfo;
    boolean mShownAsStarted;

    public RunningState$ServiceItem(int i) {
        super(false, i);
    }
}