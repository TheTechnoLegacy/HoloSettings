package com.jellybyn.settings.applications;

import android.app.ActivityManager.RunningAppProcessInfo;

class RunningState$AppProcessInfo {
    boolean hasForegroundServices;
    boolean hasServices;
    final RunningAppProcessInfo info;

    RunningState$AppProcessInfo(RunningAppProcessInfo runningAppProcessInfo) {
        this.info = runningAppProcessInfo;
    }
}