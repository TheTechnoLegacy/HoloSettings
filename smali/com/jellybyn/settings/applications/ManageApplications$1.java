package com.jellybyn.settings.applications;

import android.app.ActivityManager;
import android.app.AppOpsManager;
import android.app.INotificationManager;
import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageManager;
import android.content.pm.PackageManager;
import android.net.NetworkPolicyManager;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.RemoteException;
import android.os.UserHandle;
import java.util.List;

class ManageApplications$1 extends AsyncTask<Void, Void, Void> {
    final /* synthetic */ ManageApplications this$0;
    final /* synthetic */ AppOpsManager val$aom;
    final /* synthetic */ Handler val$handler;
    final /* synthetic */ IPackageManager val$mIPm;
    final /* synthetic */ INotificationManager val$nm;
    final /* synthetic */ NetworkPolicyManager val$npm;
    final /* synthetic */ PackageManager val$pm;

    protected Void doInBackground(Void... voidArr) {
        List<ApplicationInfo> apps = this.val$pm.getInstalledApplications(512);
        for (int i = 0; i < apps.size(); i++) {
            ApplicationInfo app = (ApplicationInfo) apps.get(i);
            try {
                this.val$nm.setNotificationsEnabledForPackage(app.packageName, app.uid, true);
            } catch (RemoteException e) {
            }
            if (!app.enabled && this.val$pm.getApplicationEnabledSetting(app.packageName) == 3) {
                this.val$pm.setApplicationEnabledSetting(app.packageName, 0, 1);
            }
        }
        try {
            this.val$mIPm.resetPreferredActivities(UserHandle.myUserId());
        } catch (RemoteException e2) {
        }
        this.val$aom.resetAllModes();
        int[] uidsWithPolicy = this.val$npm.getUidsWithPolicy(1);
        int currentUser = ActivityManager.getCurrentUser();
        for (int i2 : uidsWithPolicy) {
            if (UserHandle.getUserId(i2) == currentUser) {
                this.val$npm.setUidPolicy(i2, 0);
            }
        }
        this.val$handler.post(new 1(this));
        return null;
    }

    ManageApplications$1(ManageApplications manageApplications, PackageManager packageManager, INotificationManager iNotificationManager, IPackageManager iPackageManager, AppOpsManager appOpsManager, NetworkPolicyManager networkPolicyManager, Handler handler) {
        this.this$0 = manageApplications;
        this.val$pm = packageManager;
        this.val$nm = iNotificationManager;
        this.val$mIPm = iPackageManager;
        this.val$aom = appOpsManager;
        this.val$npm = networkPolicyManager;
        this.val$handler = handler;
    }
}