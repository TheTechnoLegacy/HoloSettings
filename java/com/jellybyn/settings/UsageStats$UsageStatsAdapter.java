package com.jellybyn.settings;

import android.content.pm.PackageManager.NameNotFoundException;
import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.android.internal.os.PkgUsageStats;
import com.jellybyn.settings.UsageStats.AppNameComparator;
import com.jellybyn.settings.UsageStats.AppViewHolder;
import com.jellybyn.settings.UsageStats.LaunchCountComparator;
import com.jellybyn.settings.UsageStats.UsageTimeComparator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

class UsageStats$UsageStatsAdapter extends BaseAdapter {
    private AppNameComparator mAppLabelComparator;
    private HashMap<String, CharSequence> mAppLabelMap = new HashMap();
    private int mDisplayOrder = 0;
    private LaunchCountComparator mLaunchCountComparator;
    private List<PkgUsageStats> mUsageStats = new ArrayList();
    private UsageTimeComparator mUsageTimeComparator;
    final /* synthetic */ UsageStats this$0;

    UsageStats$UsageStatsAdapter(UsageStats usageStats) {
        this.this$0 = usageStats;
        try {
            PkgUsageStats[] stats = UsageStats.access$000(usageStats).getAllPkgUsageStats();
            if (stats != null) {
                for (Object obj : stats) {
                    Object loadLabel;
                    this.mUsageStats.add(obj);
                    try {
                        loadLabel = UsageStats.access$100(usageStats).getApplicationInfo(obj.packageName, 0).loadLabel(UsageStats.access$100(usageStats));
                    } catch (NameNotFoundException e) {
                        loadLabel = obj.packageName;
                    }
                    this.mAppLabelMap.put(obj.packageName, loadLabel);
                }
                this.mLaunchCountComparator = new LaunchCountComparator();
                this.mUsageTimeComparator = new UsageTimeComparator();
                this.mAppLabelComparator = new AppNameComparator(this.mAppLabelMap);
                sortList();
            }
        } catch (RemoteException e2) {
            Log.e("UsageStatsActivity", "Failed initializing usage stats service");
        }
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        AppViewHolder holder;
        if (view == null) {
            view = UsageStats.access$200(this.this$0).inflate(2130968705, null);
            holder = new AppViewHolder();
            holder.pkgName = (TextView) view.findViewById(2131231071);
            holder.launchCount = (TextView) view.findViewById(2131231072);
            holder.usageTime = (TextView) view.findViewById(2131231073);
            view.setTag(holder);
        } else {
            holder = (AppViewHolder) view.getTag();
        }
        PkgUsageStats pkgStats = (PkgUsageStats) this.mUsageStats.get(i);
        if (pkgStats != null) {
            holder.pkgName.setText((CharSequence) this.mAppLabelMap.get(pkgStats.packageName));
            holder.launchCount.setText(String.valueOf(pkgStats.launchCount));
            holder.usageTime.setText(String.valueOf(pkgStats.usageTime) + " ms");
        } else {
            Log.w("UsageStatsActivity", "No usage stats info for package:" + i);
        }
        return view;
    }

    private void sortList() {
        if (this.mDisplayOrder == 0) {
            Collections.sort(this.mUsageStats, this.mUsageTimeComparator);
        } else if (this.mDisplayOrder == 1) {
            Collections.sort(this.mUsageStats, this.mLaunchCountComparator);
        } else if (this.mDisplayOrder == 2) {
            Collections.sort(this.mUsageStats, this.mAppLabelComparator);
        }
        notifyDataSetChanged();
    }

    void sortList(int i) {
        if (this.mDisplayOrder != i) {
            this.mDisplayOrder = i;
            sortList();
        }
    }

    public int getCount() {
        return this.mUsageStats.size();
    }

    public Object getItem(int i) {
        return this.mUsageStats.get(i);
    }

    public long getItemId(int i) {
        return (long) i;
    }
}