package com.jellybyn.settings.applications;

import android.content.Context;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.jellybyn.settings.applications.AppOpsState.AppOpEntry;
import java.util.List;

public class AppOpsCategory$AppListAdapter extends BaseAdapter {
    private final LayoutInflater mInflater;
    List<AppOpEntry> mList;
    private final Resources mResources;
    private final AppOpsState mState;

    public View getView(int i, View view, ViewGroup viewGroup) {
        View view2 = view == null ? this.mInflater.inflate(2130968584, viewGroup, false) : view;
        AppOpEntry item = getItem(i);
        ((ImageView) view2.findViewById(2131230735)).setImageDrawable(item.getAppEntry().getIcon());
        ((TextView) view2.findViewById(2131230736)).setText(item.getAppEntry().getLabel());
        ((TextView) view2.findViewById(2131230732)).setText(item.getSummaryText(this.mState));
        ((TextView) view2.findViewById(2131230733)).setText(item.getTimeText(this.mResources, false));
        return view2;
    }

    public AppOpsCategory$AppListAdapter(Context context, AppOpsState appOpsState) {
        this.mResources = context.getResources();
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        this.mState = appOpsState;
    }

    public void setData(List<AppOpEntry> data) {
        this.mList = data;
        notifyDataSetChanged();
    }

    public int getCount() {
        return this.mList != null ? this.mList.size() : 0;
    }

    public AppOpEntry getItem(int i) {
        return (AppOpEntry) this.mList.get(i);
    }

    public long getItemId(int i) {
        return (long) i;
    }
}