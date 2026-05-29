package com.jellybyn.settings.applications;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import com.jellybyn.settings.applications.ApplicationsState.SizeInfo;
import java.io.File;

public class ApplicationsState$AppEntry extends SizeInfo {
    final File apkFile;
    long externalSize;
    String externalSizeStr;
    Drawable icon;
    final long id;
    ApplicationInfo info;
    long internalSize;
    String internalSizeStr;
    String label;
    boolean mounted;
    String normalizedLabel;
    long size = -1;
    long sizeLoadStart;
    boolean sizeStale = true;
    String sizeStr;

    boolean ensureIconLocked(Context context, PackageManager packageManager) {
        if (this.icon == null) {
            if (this.apkFile.exists()) {
                this.icon = this.info.loadIcon(packageManager);
                return true;
            }
            this.mounted = false;
            this.icon = context.getResources().getDrawable(17302926);
        } else if (!this.mounted && this.apkFile.exists()) {
            this.mounted = true;
            this.icon = this.info.loadIcon(packageManager);
            return true;
        }
        return false;
    }

    ApplicationsState$AppEntry(Context context, ApplicationInfo applicationInfo, long j) {
        this.apkFile = new File(applicationInfo.sourceDir);
        this.id = j;
        this.info = applicationInfo;
        ensureLabel(context);
    }

    void ensureLabel(Context context) {
        if (this.label != null && this.mounted) {
            return;
        }
        if (this.apkFile.exists()) {
            this.mounted = true;
            CharSequence label = this.info.loadLabel(context.getPackageManager());
            this.label = label != null ? label.toString() : this.info.packageName;
            return;
        }
        this.mounted = false;
        this.label = this.info.packageName;
    }

    String getNormalizedLabel() {
        if (this.normalizedLabel != null) {
            return this.normalizedLabel;
        }
        this.normalizedLabel = ApplicationsState.normalize(this.label);
        return this.normalizedLabel;
    }
}