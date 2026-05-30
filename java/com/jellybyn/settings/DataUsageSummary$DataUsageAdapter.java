package com.jellybyn.settings;

import android.app.ActivityManager;
import android.content.Context;
import android.net.NetworkStats;
import android.net.NetworkStats.Entry;
import android.os.UserHandle;
import android.text.format.Formatter;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.android.internal.util.Preconditions;
import com.google.android.collect.Lists;
import com.jellybyn.settings.DataUsageSummary.AppItem;
import com.jellybyn.settings.DataUsageSummary.UidDetailTask;
import com.jellybyn.settings.net.UidDetailProvider;
import java.util.ArrayList;
import java.util.Collections;

public class DataUsageSummary$DataUsageAdapter extends BaseAdapter {
    private final int mInsetSide;
    private ArrayList<AppItem> mItems = Lists.newArrayList();
    private long mLargest;
    private final UidDetailProvider mProvider;

    public void bindStats(NetworkStats networkStats, int[] iArr) {
        int i;
        AppItem appItem;
        this.mItems.clear();
        int currentUserId = ActivityManager.getCurrentUser();
        SparseArray<AppItem> knownItems = new SparseArray();
        Entry entry = null;
        int size = networkStats != null ? networkStats.size() : 0;
        for (int i2 = 0; i2 < size; i2++) {
            entry = networkStats.getValues(i2, entry);
            i = entry.uid;
            int buildKeyForUser = UserHandle.isApp(i) ? UserHandle.getUserId(i) == currentUserId ? i : UidDetailProvider.buildKeyForUser(UserHandle.getUserId(i)) : (i == -4 || i == -5) ? i : 1000;
            appItem = (AppItem) knownItems.get(buildKeyForUser);
            if (appItem == null) {
                appItem = new AppItem(buildKeyForUser);
                this.mItems.add(appItem);
                knownItems.put(appItem.key, appItem);
            }
            appItem.addUid(i);
            appItem.total += entry.rxBytes + entry.txBytes;
        }
        for (int i3 : iArr) {
            if (UserHandle.getUserId(i3) == currentUserId) {
                appItem = (AppItem) knownItems.get(i3);
                if (appItem == null) {
                    appItem = new AppItem(i3);
                    appItem.total = -1;
                    this.mItems.add(appItem);
                    knownItems.put(appItem.key, appItem);
                }
                appItem.restricted = true;
            }
        }
        Collections.sort(this.mItems);
        this.mLargest = this.mItems.size() > 0 ? ((AppItem) this.mItems.get(0)).total : 0;
        notifyDataSetChanged();
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        int i2 = 0;
        if (view == null) {
            view = LayoutInflater.from(viewGroup.getContext()).inflate(2130968617, viewGroup, false);
            if (this.mInsetSide > 0) {
                view.setPaddingRelative(this.mInsetSide, 0, this.mInsetSide, 0);
            }
        }
        Context context = viewGroup.getContext();
        TextView text1 = (TextView) view.findViewById(16908308);
        ProgressBar progress = (ProgressBar) view.findViewById(16908301);
        AppItem item = (AppItem) this.mItems.get(i);
        UidDetailTask.bindView(this.mProvider, item, view);
        if (!item.restricted || item.total > 0) {
            text1.setText(Formatter.formatFileSize(context, item.total));
            progress.setVisibility(0);
        } else {
            text1.setText(2131428963);
            progress.setVisibility(8);
        }
        if (this.mLargest != 0) {
            i2 = (int) ((item.total * 100) / this.mLargest);
        }
        progress.setProgress(i2);
        return view;
    }

    public DataUsageSummary$DataUsageAdapter(UidDetailProvider uidDetailProvider, int i) {
        this.mProvider = (UidDetailProvider) Preconditions.checkNotNull(uidDetailProvider);
        this.mInsetSide = i;
    }

    public int getCount() {
        return this.mItems.size();
    }

    public Object getItem(int i) {
        return this.mItems.get(i);
    }

    public long getItemId(int i) {
        return (long) ((AppItem) this.mItems.get(i)).key;
    }
}