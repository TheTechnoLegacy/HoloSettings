package com.jellybyn.settings;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import com.jellybyn.settings.AppPicker.MyApplicationInfo;
import com.jellybyn.settings.applications.AppViewHolder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AppPicker$AppListAdapter extends ArrayAdapter<MyApplicationInfo> {
    private final LayoutInflater mInflater;
    private final List<MyApplicationInfo> mPackageInfoList = new ArrayList();
    final /* synthetic */ AppPicker this$0;

    public AppPicker$AppListAdapter(AppPicker appPicker, Context context) {
        MyApplicationInfo info;
        this.this$0 = appPicker;
        super(context, 0);
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        List<ApplicationInfo> pkgs = context.getPackageManager().getInstalledApplications(0);
        for (int i = 0; i < pkgs.size(); i++) {
            ApplicationInfo applicationInfo = (ApplicationInfo) pkgs.get(i);
            if (!(applicationInfo.uid == 1000 || ((applicationInfo.flags & 2) == 0 && "user".equals(Build.TYPE)))) {
                info = new MyApplicationInfo(appPicker);
                info.info = applicationInfo;
                info.label = info.info.loadLabel(appPicker.getPackageManager()).toString();
                this.mPackageInfoList.add(info);
            }
        }
        Collections.sort(this.mPackageInfoList, AppPicker.access$000());
        info = new MyApplicationInfo(appPicker);
        info.label = context.getText(2131428903);
        this.mPackageInfoList.add(0, info);
        addAll(this.mPackageInfoList);
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        AppViewHolder holder = AppViewHolder.createOrRecycle(this.mInflater, view);
        view = holder.rootView;
        MyApplicationInfo info = (MyApplicationInfo) getItem(i);
        holder.appName.setText(info.label);
        if (info.info != null) {
            holder.appIcon.setImageDrawable(info.info.loadIcon(this.this$0.getPackageManager()));
            holder.appSize.setText(info.info.packageName);
        } else {
            holder.appIcon.setImageDrawable(null);
            holder.appSize.setText("");
        }
        holder.disabled.setVisibility(8);
        holder.checkBox.setVisibility(8);
        return view;
    }
}