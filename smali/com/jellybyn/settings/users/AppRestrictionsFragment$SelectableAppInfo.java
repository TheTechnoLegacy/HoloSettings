package com.jellybyn.settings.users;

import android.graphics.drawable.Drawable;

class AppRestrictionsFragment$SelectableAppInfo {
    CharSequence activityName;
    CharSequence appName;
    Drawable icon;
    AppRestrictionsFragment$SelectableAppInfo masterEntry;
    String packageName;

    AppRestrictionsFragment$SelectableAppInfo() {
    }

    public String toString() {
        return this.packageName + ": appName=" + this.appName + "; activityName=" + this.activityName + "; icon=" + this.icon + "; masterEntry=" + this.masterEntry;
    }
}