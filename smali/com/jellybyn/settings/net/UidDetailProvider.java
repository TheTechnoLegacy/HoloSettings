package com.jellybyn.settings.net;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.os.UserManager;
import android.text.TextUtils;
import android.util.SparseArray;
import com.jellybyn.settings.Utils;
import com.jellybyn.settings.users.UserUtils;

public class UidDetailProvider {
    private final Context mContext;
    private final SparseArray<UidDetail> mUidDetailCache = new SparseArray();

    private UidDetail buildUidDetail(int i) {
        Resources res = this.mContext.getResources();
        PackageManager pm = this.mContext.getPackageManager();
        UidDetail detail = new UidDetail();
        detail.label = pm.getNameForUid(i);
        detail.icon = pm.getDefaultActivityIcon();
        switch (i) {
            case -5:
                detail.label = res.getString(Utils.getTetheringLabel((ConnectivityManager) this.mContext.getSystemService("connectivity")));
                detail.icon = pm.getDefaultActivityIcon();
                break;
            case -4:
                detail.label = res.getString(UserManager.supportsMultipleUsers() ? 2131429003 : 2131429002);
                detail.icon = pm.getDefaultActivityIcon();
                break;
            case 1000:
                detail.label = res.getString(2131428689);
                detail.icon = pm.getDefaultActivityIcon();
                break;
            default:
                if (i <= -2000) {
                    UserManager userManager = (UserManager) this.mContext.getSystemService("user");
                    UserInfo userInfo = userManager.getUserInfo((-i) - 2000);
                    if (userInfo != null) {
                        detail.label = res.getString(2131428447, new Object[]{userInfo.name});
                        detail.icon = UserUtils.getUserIcon(userManager, userInfo, res);
                        break;
                    }
                }
                String[] packageNames = pm.getPackagesForUid(i);
                int length = packageNames != null ? packageNames.length : 0;
                if (length == 1) {
                    try {
                        ApplicationInfo applicationInfo = pm.getApplicationInfo(packageNames[0], 0);
                        detail.label = applicationInfo.loadLabel(pm).toString();
                        detail.icon = applicationInfo.loadIcon(pm);
                    } catch (NameNotFoundException e) {
                    }
                } else if (length > 1) {
                    detail.detailLabels = new CharSequence[length];
                    for (int i2 = 0; i2 < length; i2++) {
                        String str = packageNames[i2];
                        PackageInfo packageInfo = pm.getPackageInfo(str, 0);
                        ApplicationInfo applicationInfo2 = pm.getApplicationInfo(str, 0);
                        detail.detailLabels[i2] = applicationInfo2.loadLabel(pm).toString();
                        if (packageInfo.sharedUserLabel != 0) {
                            detail.label = pm.getText(str, packageInfo.sharedUserLabel, packageInfo.applicationInfo).toString();
                            detail.icon = applicationInfo2.loadIcon(pm);
                        }
                    }
                }
                if (TextUtils.isEmpty(detail.label)) {
                    detail.label = Integer.toString(i);
                    break;
                }
                break;
        }
        return detail;
    }

    public UidDetail getUidDetail(int i, boolean z) {
        UidDetail detail;
        synchronized (this.mUidDetailCache) {
            detail = (UidDetail) this.mUidDetailCache.get(i);
        }
        if (detail != null) {
            return detail;
        }
        if (!z) {
            return null;
        }
        detail = buildUidDetail(i);
        synchronized (this.mUidDetailCache) {
            this.mUidDetailCache.put(i, detail);
        }
        return detail;
    }

    public void clearCache() {
        synchronized (this.mUidDetailCache) {
            this.mUidDetailCache.clear();
        }
    }

    public UidDetailProvider(Context context) {
        this.mContext = context.getApplicationContext();
    }

    public static int buildKeyForUser(int i) {
        return -(i + 2000);
    }
}