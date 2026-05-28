package com.jellybyn.settings.fuelgauge;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.drawable.Drawable;
import android.os.BatteryStats.Uid;
import android.os.Handler;
import com.jellybyn.settings.fuelgauge.PowerUsageDetail.DrainType;
import java.util.ArrayList;
import java.util.HashMap;

class BatterySipper implements Comparable<BatterySipper> {
    static final HashMap<String, UidToDetail> sUidCache = new HashMap();
    long cpuFgTime;
    long cpuTime;
    String defaultPackageName;
    DrainType drainType;
    long gpsTime;
    Drawable icon;
    int iconId;
    final Context mContext;
    final Handler mHandler;
    final ArrayList<BatterySipper> mRequestQueue;
    String name;
    double noCoveragePercent;
    double percent;
    long tcpBytesReceived;
    long tcpBytesSent;
    Uid uidObj;
    long usageTime;
    double value;
    double[] values;
    long wakeLockTime;
    long wifiRunningTime;

    void getNameIcon() {
        PackageManager pm = this.mContext.getPackageManager();
        int uid = this.uidObj.getUid();
        Drawable defaultActivityIcon = pm.getDefaultActivityIcon();
        String[] packages = pm.getPackagesForUid(uid);
        if (packages == null) {
            this.name = Integer.toString(uid);
            return;
        }
        String[] packageLabels = new String[packages.length];
        System.arraycopy(packages, 0, packageLabels, 0, packages.length);
        int i = 0;
        while (i < packageLabels.length) {
            if (packageLabels[i].equals(this.name)) {
                int preferredIndex = i;
            }
            try {
                ApplicationInfo applicationInfo = pm.getApplicationInfo(packageLabels[i], 0);
                CharSequence loadLabel = applicationInfo.loadLabel(pm);
                if (loadLabel != null) {
                    packageLabels[i] = loadLabel.toString();
                }
                if (applicationInfo.icon != 0) {
                    this.defaultPackageName = packages[i];
                    this.icon = applicationInfo.loadIcon(pm);
                    break;
                }
                i++;
            } catch (NameNotFoundException e) {
            }
        }
        if (this.icon == null) {
            this.icon = defaultActivityIcon;
        }
        if (packageLabels.length == 1) {
            this.name = packageLabels[0];
        } else {
            for (String pkgName : packages) {
                try {
                    PackageInfo packageInfo = pm.getPackageInfo(pkgName, 0);
                    if (packageInfo.sharedUserLabel != 0) {
                        CharSequence text = pm.getText(pkgName, packageInfo.sharedUserLabel, packageInfo.applicationInfo);
                        if (text != null) {
                            this.name = text.toString();
                            if (packageInfo.applicationInfo.icon != 0) {
                                this.defaultPackageName = pkgName;
                                this.icon = packageInfo.applicationInfo.loadIcon(pm);
                            }
                        }
                    } else {
                        continue;
                    }
                } catch (NameNotFoundException e2) {
                }
            }
        }
        String num = Integer.toString(this.uidObj.getUid());
        UidToDetail uidToDetail = new UidToDetail();
        uidToDetail.name = this.name;
        uidToDetail.icon = this.icon;
        uidToDetail.packageName = this.defaultPackageName;
        sUidCache.put(num, uidToDetail);
        this.mHandler.sendMessage(this.mHandler.obtainMessage(1, this));
    }

    void getQuickNameIconForUid(Uid uid) {
        int uid2 = uid.getUid();
        String uidString = Integer.toString(uid2);
        if (sUidCache.containsKey(uidString)) {
            UidToDetail uidToDetail = (UidToDetail) sUidCache.get(uidString);
            this.defaultPackageName = uidToDetail.packageName;
            this.name = uidToDetail.name;
            this.icon = uidToDetail.icon;
            return;
        }
        PackageManager pm = this.mContext.getPackageManager();
        String[] packages = pm.getPackagesForUid(uid2);
        this.icon = pm.getDefaultActivityIcon();
        if (packages == null) {
            if (uid2 == 0) {
                this.name = this.mContext.getResources().getString(2131428689);
            } else if ("mediaserver".equals(this.name)) {
                this.name = this.mContext.getResources().getString(2131428690);
            }
            this.iconId = 2130837595;
            this.icon = this.mContext.getResources().getDrawable(this.iconId);
            return;
        }
        synchronized (this.mRequestQueue) {
            this.mRequestQueue.add(this);
        }
    }

    BatterySipper(Context context, ArrayList<BatterySipper> requestQueue, Handler handler, String str, DrainType drainType, int i, Uid uid, double[] dArr) {
        this.mContext = context;
        this.mRequestQueue = requestQueue;
        this.mHandler = handler;
        this.values = dArr;
        this.name = str;
        this.drainType = drainType;
        if (i > 0) {
            this.icon = this.mContext.getResources().getDrawable(i);
        }
        if (dArr != null) {
            this.value = dArr[0];
        }
        if ((str == null || i == 0) && uid != null) {
            getQuickNameIconForUid(uid);
        }
        this.uidObj = uid;
    }

    public int compareTo(BatterySipper batterySipper) {
        return Double.compare(batterySipper.getSortValue(), getSortValue());
    }

    Drawable getIcon() {
        return this.icon;
    }

    double getSortValue() {
        return this.value;
    }
}