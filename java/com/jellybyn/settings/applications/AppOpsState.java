package com.jellybyn.settings.applications;

import android.app.AppOpsManager;
import android.app.AppOpsManager.OpEntry;
import android.app.AppOpsManager.PackageOps;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.util.Log;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

public class AppOpsState {
    public static final OpsTemplate[] ALL_TEMPLATES = new OpsTemplate[]{LOCATION_TEMPLATE, PERSONAL_TEMPLATE, MESSAGING_TEMPLATE, DEVICE_TEMPLATE};
    public static final Comparator<AppOpEntry> APP_OP_COMPARATOR = new 1();
    public static final OpsTemplate DEVICE_TEMPLATE = new OpsTemplate(new int[]{3, 11, 25, 13, 23, 24, 26, 27, 28}, new boolean[]{false, false, true, true, true, true, true, true, true});
    public static final OpsTemplate LOCATION_TEMPLATE = new OpsTemplate(new int[]{0, 1, 2, 10, 12}, new boolean[]{true, true, false, false, false});
    public static final OpsTemplate MESSAGING_TEMPLATE = new OpsTemplate(new int[]{14, 16, 17, 18, 19, 15, 20, 21, 22}, new boolean[]{true, true, true, true, true, true, true, true, true});
    public static final OpsTemplate PERSONAL_TEMPLATE = new OpsTemplate(new int[]{4, 5, 6, 7, 8, 9, 29, 30}, new boolean[]{true, true, true, true, true, true, false, false});
    final AppOpsManager mAppOps;
    final Context mContext;
    final CharSequence[] mOpLabels;
    final CharSequence[] mOpSummaries;
    final PackageManager mPm;

    public List<AppOpEntry> buildState(OpsTemplate opsTemplate, int i, String str) {
        int i2;
        PackageOps packageOps;
        AppEntry appEntry;
        int i3;
        OpEntry opEntry;
        List<PackageInfo> apps;
        Context context = this.mContext;
        HashMap<String, AppEntry> appEntries = new HashMap();
        List<AppOpEntry> entries = new ArrayList();
        ArrayList<String> perms = new ArrayList();
        ArrayList<Integer> permOps = new ArrayList();
        int[] opToOrder = new int[31];
        for (i2 = 0; i2 < opsTemplate.ops.length; i2++) {
            if (opsTemplate.showPerms[i2]) {
                String opToPermission = AppOpsManager.opToPermission(opsTemplate.ops[i2]);
                if (!(opToPermission == null || perms.contains(opToPermission))) {
                    perms.add(opToPermission);
                    permOps.add(Integer.valueOf(opsTemplate.ops[i2]));
                    opToOrder[opsTemplate.ops[i2]] = i2;
                }
            }
        }
        List<PackageOps> pkgs = str != null ? this.mAppOps.getOpsForPackage(i, str, opsTemplate.ops) : this.mAppOps.getPackagesForOps(opsTemplate.ops);
        if (pkgs != null) {
            for (i2 = 0; i2 < pkgs.size(); i2++) {
                packageOps = (PackageOps) pkgs.get(i2);
                appEntry = getAppEntry(context, appEntries, packageOps.getPackageName(), null);
                if (appEntry != null) {
                    for (i3 = 0; i3 < packageOps.getOps().size(); i3++) {
                        opEntry = (OpEntry) packageOps.getOps().get(i3);
                        addOp(entries, packageOps, appEntry, opEntry, str == null, str == null ? 0 : opToOrder[opEntry.getOp()]);
                    }
                }
            }
        }
        if (str != null) {
            apps = new ArrayList();
            try {
                apps.add(this.mPm.getPackageInfo(str, 4096));
            } catch (NameNotFoundException e) {
            }
        } else {
            String[] strArr = new String[perms.size()];
            perms.toArray(strArr);
            apps = this.mPm.getPackagesHoldingPermissions(strArr, 0);
        }
        for (i2 = 0; i2 < apps.size(); i2++) {
            PackageInfo packageInfo = (PackageInfo) apps.get(i2);
            appEntry = getAppEntry(context, appEntries, packageInfo.packageName, packageInfo.applicationInfo);
            if (appEntry != null) {
                ArrayList arrayList = null;
                packageOps = null;
                if (packageInfo.requestedPermissions != null) {
                    i3 = 0;
                    while (i3 < packageInfo.requestedPermissions.length && (packageInfo.requestedPermissionsFlags == null || (packageInfo.requestedPermissionsFlags[i3] & 2) != 0)) {
                        int i4 = 0;
                        while (i4 < perms.size()) {
                            if (((String) perms.get(i4)).equals(packageInfo.requestedPermissions[i3]) && !appEntry.hasOp(((Integer) permOps.get(i4)).intValue())) {
                                if (arrayList == null) {
                                    arrayList = new ArrayList();
                                    packageOps = new PackageOps(packageInfo.packageName, packageInfo.applicationInfo.uid, arrayList);
                                }
                                opEntry = new OpEntry(((Integer) permOps.get(i4)).intValue(), 0, 0, 0, 0);
                                arrayList.add(opEntry);
                                addOp(entries, packageOps, appEntry, opEntry, str == null, str == null ? 0 : opToOrder[opEntry.getOp()]);
                            }
                            i4++;
                        }
                        i3++;
                    }
                }
            }
        }
        Collections.sort(entries, APP_OP_COMPARATOR);
        return entries;
    }

    private void addOp(List<AppOpEntry> entries, PackageOps packageOps, AppEntry appEntry, OpEntry opEntry, boolean z, int i) {
        if (z && entries.size() > 0) {
            AppOpEntry appOpEntry = (AppOpEntry) entries.get(entries.size() - 1);
            if (appOpEntry.getAppEntry() == appEntry) {
                if ((appOpEntry.getTime() != 0 ? 1 : null) == (opEntry.getTime() != 0 ? 1 : null)) {
                    appOpEntry.addOp(opEntry);
                    return;
                }
            }
        }
        AppOpEntry entry = appEntry.getOpSwitch(opEntry.getOp());
        if (entry != null) {
            entry.addOp(opEntry);
        } else {
            entries.add(new AppOpEntry(packageOps, opEntry, appEntry, i));
        }
    }

    private AppEntry getAppEntry(Context context, HashMap<String, AppEntry> appEntries, String str, ApplicationInfo applicationInfo) {
        AppEntry appEntry = (AppEntry) appEntries.get(str);
        if (appEntry == null) {
            if (applicationInfo == null) {
                try {
                    applicationInfo = this.mPm.getApplicationInfo(str, 8704);
                } catch (NameNotFoundException e) {
                    Log.w("AppOpsState", "Unable to find info for package " + str);
                    return null;
                }
            }
            appEntry = new AppEntry(this, applicationInfo);
            appEntry.loadLabel(context);
            appEntries.put(str, appEntry);
        }
        return appEntry;
    }

    public AppOpsState(Context context) {
        this.mContext = context;
        this.mAppOps = (AppOpsManager) context.getSystemService("appops");
        this.mPm = context.getPackageManager();
        this.mOpSummaries = context.getResources().getTextArray(2131165236);
        this.mOpLabels = context.getResources().getTextArray(2131165237);
    }

    public List<AppOpEntry> buildState(OpsTemplate opsTemplate) {
        return buildState(opsTemplate, 0, null);
    }
}