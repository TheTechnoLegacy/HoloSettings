package com.jellybyn.settings.applications;

import android.view.LayoutInflater;
import android.view.View;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import com.jellybyn.settings.applications.ApplicationsState.AppEntry;

public class AppViewHolder {
    public ImageView appIcon;
    public TextView appName;
    public TextView appSize;
    public CheckBox checkBox;
    public TextView disabled;
    public AppEntry entry;
    public View rootView;

    public static AppViewHolder createOrRecycle(LayoutInflater layoutInflater, View view) {
        if (view != null) {
            return (AppViewHolder) view.getTag();
        }
        view = layoutInflater.inflate(2130968640, null);
        AppViewHolder appViewHolder = new AppViewHolder();
        appViewHolder.rootView = view;
        appViewHolder.appName = (TextView) view.findViewById(2131230736);
        appViewHolder.appIcon = (ImageView) view.findViewById(2131230735);
        appViewHolder.appSize = (TextView) view.findViewById(2131230897);
        appViewHolder.disabled = (TextView) view.findViewById(2131230898);
        appViewHolder.checkBox = (CheckBox) view.findViewById(2131230896);
        view.setTag(appViewHolder);
        return appViewHolder;
    }

    void updateSizeText(CharSequence charSequence, int i) {
        if (this.entry.sizeStr != null) {
            switch (i) {
                case 1:
                    this.appSize.setText(this.entry.internalSizeStr);
                    return;
                case 2:
                    this.appSize.setText(this.entry.externalSizeStr);
                    return;
                default:
                    this.appSize.setText(this.entry.sizeStr);
                    return;
            }
        } else if (this.entry.size == -2) {
            this.appSize.setText(charSequence);
        }
    }
}