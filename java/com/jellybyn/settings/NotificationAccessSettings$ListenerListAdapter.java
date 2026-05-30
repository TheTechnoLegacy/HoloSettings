package com.jellybyn.settings;

import android.content.Context;
import android.content.pm.ServiceInfo;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import com.jellybyn.settings.NotificationAccessSettings.ViewHolder;

class NotificationAccessSettings$ListenerListAdapter extends ArrayAdapter<ServiceInfo> {
    final LayoutInflater mInflater;
    final /* synthetic */ NotificationAccessSettings this$0;

    public View newView(ViewGroup viewGroup) {
        View v = this.mInflater.inflate(2130968649, viewGroup, false);
        ViewHolder h = new ViewHolder();
        h.icon = (ImageView) v.findViewById(2131230756);
        h.name = (TextView) v.findViewById(2131230834);
        h.checkbox = (CheckBox) v.findViewById(2131230836);
        h.description = (TextView) v.findViewById(2131230835);
        v.setTag(h);
        return v;
    }

    public void bindView(View view, int i) {
        ViewHolder vh = (ViewHolder) view.getTag();
        ServiceInfo info = (ServiceInfo) getItem(i);
        vh.icon.setImageDrawable(info.loadIcon(NotificationAccessSettings.access$100(this.this$0)));
        vh.name.setText(info.loadLabel(NotificationAccessSettings.access$100(this.this$0)));
        vh.description.setVisibility(8);
        vh.checkbox.setChecked(this.this$0.isListenerEnabled(info));
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        View v = view == null ? newView(viewGroup) : view;
        bindView(v, i);
        return v;
    }

    NotificationAccessSettings$ListenerListAdapter(NotificationAccessSettings notificationAccessSettings, Context context) {
        this.this$0 = notificationAccessSettings;
        super(context, 0, 0);
        this.mInflater = (LayoutInflater) notificationAccessSettings.getActivity().getSystemService("layout_inflater");
    }

    public long getItemId(int i) {
        return (long) i;
    }

    public boolean hasStableIds() {
        return true;
    }
}