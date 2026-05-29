package com.jellybyn.settings.applications;

import android.content.AsyncTaskLoader;
import android.content.Context;
import com.jellybyn.settings.applications.AppOpsCategory.InterestingConfigChanges;
import com.jellybyn.settings.applications.AppOpsCategory.PackageIntentReceiver;
import com.jellybyn.settings.applications.AppOpsState.AppOpEntry;
import com.jellybyn.settings.applications.AppOpsState.OpsTemplate;
import java.util.List;

public class AppOpsCategory$AppListLoader extends AsyncTaskLoader<List<AppOpEntry>> {
    List<AppOpEntry> mApps;
    final InterestingConfigChanges mLastConfig = new InterestingConfigChanges();
    PackageIntentReceiver mPackageObserver;
    final AppOpsState mState;
    final OpsTemplate mTemplate;

    public void deliverResult(List<AppOpEntry> apps) {
        if (isReset() && apps != null) {
            onReleaseResources(apps);
        }
        List<AppOpEntry> oldApps = apps;
        this.mApps = apps;
        if (isStarted()) {
            super.deliverResult((Object) apps);
        }
        if (oldApps != null) {
            onReleaseResources(oldApps);
        }
    }

    protected void onReset() {
        super.onReset();
        onStopLoading();
        if (this.mApps != null) {
            onReleaseResources(this.mApps);
            this.mApps = null;
        }
        if (this.mPackageObserver != null) {
            getContext().unregisterReceiver(this.mPackageObserver);
            this.mPackageObserver = null;
        }
    }

    protected void onStartLoading() {
        onContentChanged();
        if (this.mApps != null) {
            deliverResult(this.mApps);
        }
        if (this.mPackageObserver == null) {
            this.mPackageObserver = new PackageIntentReceiver(this);
        }
        boolean configChange = this.mLastConfig.applyNewConfig(getContext().getResources());
        if (takeContentChanged() || this.mApps == null || configChange) {
            forceLoad();
        }
    }

    public AppOpsCategory$AppListLoader(Context context, AppOpsState appOpsState, OpsTemplate opsTemplate) {
        super(context);
        this.mState = appOpsState;
        this.mTemplate = opsTemplate;
    }

    public void onCanceled(List<AppOpEntry> apps) {
        super.onCanceled(apps);
        onReleaseResources(apps);
    }

    protected void onStopLoading() {
        cancelLoad();
    }

    public Object loadInBackground() {
        return this.mState.buildState(this.mTemplate);
    }

    protected void onReleaseResources(List<AppOpEntry> list) {
    }
}