package com.jellybyn.settings;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.INotificationManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.service.notification.INotificationListener.Stub;
import android.service.notification.StatusBarNotification;
import android.util.Log;
import android.widget.ListView;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class NotificationStation extends SettingsPreferenceFragment {
    private static final String TAG = NotificationStation.class.getSimpleName();
    private NotificationHistoryAdapter mAdapter;
    private Context mContext;
    private Stub mListener = new 1(this);
    private INotificationManager mNoMan;
    private final Comparator<HistoricalNotificationInfo> mNotificationSorter = new 1(this);
    private final PackageReceiver mPackageReceiver = new PackageReceiver(this, null);
    private PackageManager mPm;
    private Runnable mRefreshListRunnable = new 1(this);

    private List<HistoricalNotificationInfo> loadNotifications() {
        int currentUserId = ActivityManager.getCurrentUser();
        try {
            StatusBarNotification[] activeNotifications = this.mNoMan.getActiveNotifications(this.mContext.getPackageName());
            List<HistoricalNotificationInfo> arrayList = new ArrayList(activeNotifications.length + this.mNoMan.getHistoricalNotifications(this.mContext.getPackageName(), 50).length);
            for (StatusBarNotification[] statusBarNotificationArr : new StatusBarNotification[][]{activeNotifications, r8}) {
                for (Context context : statusBarNotificationArr) {
                    HistoricalNotificationInfo historicalNotificationInfo = new HistoricalNotificationInfo(null);
                    historicalNotificationInfo.pkg = context.getPackageName();
                    historicalNotificationInfo.user = context.getUserId();
                    historicalNotificationInfo.icon = loadIconDrawable(historicalNotificationInfo.pkg, historicalNotificationInfo.user, context.getNotification().icon);
                    historicalNotificationInfo.pkgicon = loadPackageIconDrawable(historicalNotificationInfo.pkg, historicalNotificationInfo.user);
                    historicalNotificationInfo.pkgname = loadPackageName(historicalNotificationInfo.pkg);
                    if (context.getNotification().extras != null) {
                        historicalNotificationInfo.title = context.getNotification().extras.getString("android.title");
                        if (historicalNotificationInfo.title == null || "".equals(historicalNotificationInfo.title)) {
                            historicalNotificationInfo.title = context.getNotification().extras.getString("android.text");
                        }
                    }
                    if (historicalNotificationInfo.title == null || "".equals(historicalNotificationInfo.title)) {
                        historicalNotificationInfo.title = context.getNotification().tickerText;
                    }
                    if (historicalNotificationInfo.title == null || "".equals(historicalNotificationInfo.title)) {
                        historicalNotificationInfo.title = historicalNotificationInfo.pkgname;
                    }
                    historicalNotificationInfo.timestamp = context.getPostTime();
                    historicalNotificationInfo.priority = context.getNotification().priority;
                    logd("   [%d] %s: %s", Long.valueOf(historicalNotificationInfo.timestamp), historicalNotificationInfo.pkg, historicalNotificationInfo.title);
                    historicalNotificationInfo.active = statusBarNotificationArr == activeNotifications;
                    if (historicalNotificationInfo.user == -1 || historicalNotificationInfo.user == currentUserId) {
                        arrayList.add(historicalNotificationInfo);
                    }
                }
            }
            return arrayList;
        } catch (RemoteException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void onResume() {
        logd("onResume()", new Object[0]);
        super.onResume();
        refreshList();
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.intent.action.PACKAGE_ADDED");
        filter.addAction("android.intent.action.PACKAGE_CHANGED");
        filter.addAction("android.intent.action.PACKAGE_REMOVED");
        filter.addAction("android.intent.action.PACKAGE_REPLACED");
        filter.addDataScheme("package");
        this.mContext.registerReceiver(this.mPackageReceiver, filter);
    }

    private Resources getResourcesForUserPackage(String str, int i) {
        Resources r;
        if (str != null) {
            if (i == -1) {
                i = 0;
            }
            try {
                r = this.mPm.getResourcesForApplicationAsUser(str, i);
            } catch (NameNotFoundException e) {
                Log.e(TAG, "Icon package not found: " + str);
                return null;
            }
        }
        r = this.mContext.getResources();
        return r;
    }

    private Drawable loadIconDrawable(String str, int i, int i2) {
        Resources r = getResourcesForUserPackage(str, i);
        if (i2 == 0) {
            return null;
        }
        try {
            return r.getDrawable(i2);
        } catch (RuntimeException e) {
            Log.w(TAG, "Icon not found in " + (str != null ? Integer.valueOf(i2) : "<system>") + ": " + Integer.toHexString(i2));
            return null;
        }
    }

    public void onAttach(Activity activity) {
        logd("onAttach(%s)", activity.getClass().getSimpleName());
        super.onAttach(activity);
        this.mContext = activity;
        this.mPm = this.mContext.getPackageManager();
        this.mNoMan = INotificationManager.Stub.asInterface(ServiceManager.getService("notification"));
        try {
            this.mNoMan.registerListener(this.mListener, new ComponentName(this.mContext.getPackageName(), getClass().getCanonicalName()), ActivityManager.getCurrentUser());
        } catch (RemoteException e) {
        }
    }

    private void refreshList() {
        List<HistoricalNotificationInfo> infos = loadNotifications();
        if (infos != null) {
            logd("adding %d infos", Integer.valueOf(infos.size()));
            this.mAdapter.clear();
            this.mAdapter.addAll(infos);
            this.mAdapter.sort(this.mNotificationSorter);
        }
    }

    public void onActivityCreated(Bundle bundle) {
        logd("onActivityCreated(%s)", bundle);
        super.onActivityCreated(bundle);
        ListView listView = getListView();
        this.mAdapter = new NotificationHistoryAdapter(this, this.mContext);
        listView.setAdapter(this.mAdapter);
    }

    private Drawable loadPackageIconDrawable(String str, int i) {
        Drawable icon = null;
        try {
            return this.mPm.getApplicationIcon(str);
        } catch (NameNotFoundException e) {
            return icon;
        }
    }

    private CharSequence loadPackageName(String str) {
        try {
            ApplicationInfo applicationInfo = this.mPm.getApplicationInfo(str, 8192);
            return applicationInfo != null ? this.mPm.getApplicationLabel(applicationInfo) : str;
        } catch (NameNotFoundException e) {
            return str;
        }
    }

    private void startApplicationDetailsActivity(String str) {
        Intent intent = new Intent("jellybyn.settings.APPLICATION_DETAILS_SETTINGS", Uri.fromParts("package", str, null));
        intent.setComponent(intent.resolveActivity(this.mPm));
        startActivity(intent);
    }

    public void onCreate(Bundle bundle) {
        logd("onCreate(%s)", bundle);
        super.onCreate(bundle);
        Activity activity = getActivity();
    }

    public void onPause() {
        logd("onPause()", new Object[0]);
        super.onPause();
        this.mContext.unregisterReceiver(this.mPackageReceiver);
    }

    private static void logd(String str, Object... objArr) {
        String str2 = TAG;
        if (!(objArr == null || objArr.length == 0)) {
            str = String.format(str, objArr);
        }
        Log.d(str2, str);
    }

    public void onDestroyView() {
        super.onDestroyView();
    }
}