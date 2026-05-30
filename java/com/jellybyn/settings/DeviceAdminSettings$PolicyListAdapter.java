package com.jellybyn.settings;

import android.app.Activity;
import android.app.admin.DeviceAdminInfo;
import android.content.res.Resources.NotFoundException;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import com.jellybyn.settings.DeviceAdminSettings.ViewHolder;

class DeviceAdminSettings$PolicyListAdapter extends BaseAdapter {
    final LayoutInflater mInflater;
    final /* synthetic */ DeviceAdminSettings this$0;

    public void bindView(View view, int i) {
        boolean z = true;
        Activity activity = this.this$0.getActivity();
        ViewHolder vh = (ViewHolder) view.getTag();
        DeviceAdminInfo item = (DeviceAdminInfo) this.this$0.mAvailableAdmins.get(i);
        vh.icon.setImageDrawable(item.loadIcon(activity.getPackageManager()));
        vh.name.setText(item.loadLabel(activity.getPackageManager()));
        vh.checkbox.setChecked(this.this$0.mActiveAdmins.contains(item.getComponent()));
        boolean activeOwner = vh.checkbox.isChecked() && item.getPackageName().equals(this.this$0.mDeviceOwnerPkg);
        try {
            vh.description.setText(item.loadDescription(activity.getPackageManager()));
        } catch (NotFoundException e) {
        }
        vh.checkbox.setEnabled(!activeOwner);
        vh.name.setEnabled(!activeOwner);
        vh.description.setEnabled(!activeOwner);
        ImageView imageView = vh.icon;
        if (activeOwner) {
            z = false;
        }
        imageView.setEnabled(z);
    }

    public View newView(ViewGroup viewGroup) {
        View v = this.mInflater.inflate(2130968622, viewGroup, false);
        ViewHolder h = new ViewHolder();
        h.icon = (ImageView) v.findViewById(2131230756);
        h.name = (TextView) v.findViewById(2131230834);
        h.checkbox = (CheckBox) v.findViewById(2131230836);
        h.description = (TextView) v.findViewById(2131230835);
        v.setTag(h);
        return v;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        View v = view == null ? newView(viewGroup) : view;
        bindView(v, i);
        return v;
    }

    public boolean isEnabled(int i) {
        DeviceAdminInfo info = (DeviceAdminInfo) this.this$0.mAvailableAdmins.get(i);
        return (this.this$0.mActiveAdmins.contains(info.getComponent()) && info.getPackageName().equals(this.this$0.mDeviceOwnerPkg)) ? false : true;
    }

    DeviceAdminSettings$PolicyListAdapter(DeviceAdminSettings deviceAdminSettings) {
        this.this$0 = deviceAdminSettings;
        this.mInflater = (LayoutInflater) deviceAdminSettings.getActivity().getSystemService("layout_inflater");
    }

    public boolean areAllItemsEnabled() {
        return false;
    }

    public int getCount() {
        return this.this$0.mAvailableAdmins.size();
    }

    public Object getItem(int i) {
        return this.this$0.mAvailableAdmins.get(i);
    }

    public long getItemId(int i) {
        return (long) i;
    }

    public boolean hasStableIds() {
        return true;
    }
}