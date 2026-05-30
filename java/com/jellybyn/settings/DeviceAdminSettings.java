package com.jellybyn.settings;

import android.app.ListFragment;
import android.app.admin.DeviceAdminInfo;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.xmlpull.v1.XmlPullParserException;

public class DeviceAdminSettings extends ListFragment {
    final HashSet<ComponentName> mActiveAdmins = new HashSet();
    final ArrayList<DeviceAdminInfo> mAvailableAdmins = new ArrayList();
    DevicePolicyManager mDPM;
    String mDeviceOwnerPkg;

    void updateList() {
        int i;
        ResolveInfo resolveInfo;
        this.mActiveAdmins.clear();
        List<ComponentName> cur = this.mDPM.getActiveAdmins();
        if (cur != null) {
            for (i = 0; i < cur.size(); i++) {
                this.mActiveAdmins.add(cur.get(i));
            }
        }
        this.mAvailableAdmins.clear();
        List<ResolveInfo> avail = getActivity().getPackageManager().queryBroadcastReceivers(new Intent("android.app.action.DEVICE_ADMIN_ENABLED"), 32896);
        if (avail == null) {
            avail = Collections.emptyList();
        }
        Set<ComponentName> activeAdminsNotInAvail = new HashSet(this.mActiveAdmins);
        for (ResolveInfo resolveInfo2 : avail) {
            activeAdminsNotInAvail.remove(new ComponentName(resolveInfo2.activityInfo.packageName, resolveInfo2.activityInfo.name));
        }
        if (!activeAdminsNotInAvail.isEmpty()) {
            ArrayList arrayList = new ArrayList(avail);
            PackageManager packageManager = getActivity().getPackageManager();
            for (ComponentName component : activeAdminsNotInAvail) {
                List queryBroadcastReceivers = packageManager.queryBroadcastReceivers(new Intent().setComponent(component), 32896);
                if (queryBroadcastReceivers != null) {
                    arrayList.addAll(queryBroadcastReceivers);
                }
            }
            avail = arrayList;
        }
        i = 0;
        int count = avail.size();
        while (i < count) {
            resolveInfo2 = (ResolveInfo) avail.get(i);
            try {
                DeviceAdminInfo deviceAdminInfo = new DeviceAdminInfo(getActivity(), resolveInfo2);
                if (deviceAdminInfo.isVisible() || this.mActiveAdmins.contains(deviceAdminInfo.getComponent())) {
                    this.mAvailableAdmins.add(deviceAdminInfo);
                    i++;
                } else {
                    i++;
                }
            } catch (XmlPullParserException e) {
                Log.w("DeviceAdminSettings", "Skipping " + resolveInfo2.activityInfo, e);
            } catch (IOException e2) {
                Log.w("DeviceAdminSettings", "Skipping " + resolveInfo2.activityInfo, e2);
            }
        }
        getListView().setAdapter(new PolicyListAdapter(this));
    }

    public void onListItemClick(ListView listView, View view, int i, long j) {
        DeviceAdminInfo deviceAdminInfo = (DeviceAdminInfo) listView.getAdapter().getItem(i);
        Intent intent = new Intent();
        intent.setClass(getActivity(), DeviceAdminAdd.class);
        intent.putExtra("android.app.extra.DEVICE_ADMIN", deviceAdminInfo.getComponent());
        startActivity(intent);
    }

    public void onResume() {
        super.onResume();
        this.mDeviceOwnerPkg = this.mDPM.getDeviceOwner();
        if (!(this.mDeviceOwnerPkg == null || this.mDPM.isDeviceOwner(this.mDeviceOwnerPkg))) {
            this.mDeviceOwnerPkg = null;
        }
        updateList();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mDPM = (DevicePolicyManager) getActivity().getSystemService("device_policy");
        return layoutInflater.inflate(2130968623, viewGroup, false);
    }
}