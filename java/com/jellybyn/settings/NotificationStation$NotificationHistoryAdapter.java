package com.jellybyn.settings;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.DateTimeView;
import android.widget.ImageView;
import android.widget.TextView;
import com.jellybyn.settings.NotificationStation.HistoricalNotificationInfo;

class NotificationStation$NotificationHistoryAdapter extends ArrayAdapter<HistoricalNotificationInfo> {
    private final LayoutInflater mInflater;
    final /* synthetic */ NotificationStation this$0;

    public View getView(int i, View view, ViewGroup viewGroup) {
        HistoricalNotificationInfo info = (HistoricalNotificationInfo) getItem(i);
        NotificationStation.access$500("getView(%s/%s)", new Object[]{info.pkg, info.title});
        View row = view != null ? view : createRow(viewGroup);
        row.setTag(info);
        if (info.icon != null) {
            ((ImageView) row.findViewById(16908294)).setImageDrawable(info.icon);
        }
        if (info.pkgicon != null) {
            ((ImageView) row.findViewById(2131230910)).setImageDrawable(info.pkgicon);
        }
        ((DateTimeView) row.findViewById(2131230911)).setTime(info.timestamp);
        ((TextView) row.findViewById(16908310)).setText(info.title);
        ((TextView) row.findViewById(2131230913)).setText(info.pkgname);
        row.findViewById(2131230912).setVisibility(8);
        row.setAlpha(info.active ? 1.0f : 0.5f);
        row.setOnClickListener(new 1(this, info));
        return row;
    }

    public NotificationStation$NotificationHistoryAdapter(NotificationStation notificationStation, Context context) {
        this.this$0 = notificationStation;
        super(context, 0);
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
    }

    private View createRow(ViewGroup viewGroup) {
        return this.mInflater.inflate(2130968650, viewGroup, false);
    }
}