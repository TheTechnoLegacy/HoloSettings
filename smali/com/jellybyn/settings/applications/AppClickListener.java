package com.jellybyn.settings.applications;

import android.view.View;
import android.widget.AdapterView;
import com.jellybyn.settings.applications.ManageApplications.TabInfo;

/* compiled from: ManageApplications */
interface AppClickListener {
    void onItemClick(TabInfo tabInfo, AdapterView<?> adapterView, View view, int i, long j);
}