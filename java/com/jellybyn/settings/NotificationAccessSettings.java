package com.jellybyn.settings;

import android.app.ActivityManager;
import android.app.ListFragment;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageItemInfo.DisplayNameComparator;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.provider.Settings.Secure;
import android.util.Slog;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

public class NotificationAccessSettings extends ListFragment {
    static final String TAG = NotificationAccessSettings.class.getSimpleName();
    private final Uri ENABLED_NOTIFICATION_LISTENERS_URI = Secure.getUriFor("enabled_notification_listeners");
    private ContentResolver mCR;
    private final HashSet<ComponentName> mEnabledListeners = new HashSet();
    private ListenerListAdapter mList;
    private PackageManager mPM;
    private final BroadcastReceiver mPackageReceiver = new 2(this);
    private final ContentObserver mSettingsObserver = new 1(this, new Handler());

    private static int getListeners(ArrayAdapter<ServiceInfo> adapter, PackageManager packageManager) {
        int listeners = 0;
        if (adapter != null) {
            adapter.clear();
        }
        List<ResolveInfo> installedServices = packageManager.queryIntentServicesAsUser(new Intent("android.service.notification.NotificationListenerService"), 132, ActivityManager.getCurrentUser());
        int count = installedServices.size();
        for (int i = 0; i < count; i++) {
            ServiceInfo serviceInfo = ((ResolveInfo) installedServices.get(i)).serviceInfo;
            if ("android.permission.BIND_NOTIFICATION_LISTENER_SERVICE".equals(serviceInfo.permission)) {
                if (adapter != null) {
                    adapter.add(serviceInfo);
                }
                listeners++;
            } else {
                Slog.w(TAG, "Skipping notification listener service " + serviceInfo.packageName + "/" + serviceInfo.name + ": it does not require the permission " + "android.permission.BIND_NOTIFICATION_LISTENER_SERVICE");
            }
        }
        return listeners;
    }

    public void onResume() {
        super.onResume();
        updateList();
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.intent.action.PACKAGE_ADDED");
        filter.addAction("android.intent.action.PACKAGE_CHANGED");
        filter.addAction("android.intent.action.PACKAGE_REMOVED");
        filter.addAction("android.intent.action.PACKAGE_REPLACED");
        filter.addDataScheme("package");
        getActivity().registerReceiver(this.mPackageReceiver, filter);
        this.mCR.registerContentObserver(this.ENABLED_NOTIFICATION_LISTENERS_URI, false, this.mSettingsObserver);
    }

    void loadEnabledListeners() {
        this.mEnabledListeners.clear();
        String flat = Secure.getString(this.mCR, "enabled_notification_listeners");
        if (flat != null && !"".equals(flat)) {
            String[] split = flat.split(":");
            for (String unflattenFromString : split) {
                ComponentName unflattenFromString2 = ComponentName.unflattenFromString(unflattenFromString);
                if (unflattenFromString2 != null) {
                    this.mEnabledListeners.add(unflattenFromString2);
                }
            }
        }
    }

    void saveEnabledListeners() {
        StringBuilder sb = null;
        Iterator i$ = this.mEnabledListeners.iterator();
        while (i$.hasNext()) {
            ComponentName componentName = (ComponentName) i$.next();
            if (sb == null) {
                sb = new StringBuilder();
            } else {
                sb.append(':');
            }
            sb.append(componentName.flattenToString());
        }
        Secure.putString(this.mCR, "enabled_notification_listeners", sb != null ? sb.toString() : "");
    }

    public void onListItemClick(ListView listView, View view, int i, long j) {
        ServiceInfo info = (ServiceInfo) this.mList.getItem(i);
        ComponentName cn = new ComponentName(info.packageName, info.name);
        if (this.mEnabledListeners.contains(cn)) {
            this.mEnabledListeners.remove(cn);
            saveEnabledListeners();
            return;
        }
        new 2(this).setListenerInfo(cn, info.loadLabel(this.mPM).toString()).show(getFragmentManager(), "dialog");
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mPM = getActivity().getPackageManager();
        this.mCR = getActivity().getContentResolver();
        this.mList = new ListenerListAdapter(this, getActivity());
    }

    void updateList() {
        loadEnabledListeners();
        getListeners(this.mList, this.mPM);
        this.mList.sort(new DisplayNameComparator(this.mPM));
        getListView().setAdapter(this.mList);
    }

    public void onPause() {
        super.onPause();
        getActivity().unregisterReceiver(this.mPackageReceiver);
        this.mCR.unregisterContentObserver(this.mSettingsObserver);
    }

    boolean isListenerEnabled(ServiceInfo serviceInfo) {
        return this.mEnabledListeners.contains(new ComponentName(serviceInfo.packageName, serviceInfo.name));
    }

    static int getListenersCount(PackageManager packageManager) {
        return getListeners(null, packageManager);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(2130968647, viewGroup, false);
    }
}