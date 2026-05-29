package com.jellybyn.settings.applications;

import android.content.pm.PackageManager;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.jellybyn.settings.applications.RunningProcessesView.ActiveItem;
import com.jellybyn.settings.applications.RunningState.BaseItem;
import com.jellybyn.settings.applications.RunningState.MergedItem;

public class RunningProcessesView$ViewHolder {
    public TextView description;
    public ImageView icon;
    public TextView name;
    public View rootView;
    public TextView size;
    public TextView uptime;

    public ActiveItem bind(RunningState runningState, BaseItem baseItem, StringBuilder stringBuilder) {
        ActiveItem activeItem;
        synchronized (runningState.mLock) {
            PackageManager packageManager = this.rootView.getContext().getPackageManager();
            if (baseItem.mPackageInfo == null && (baseItem instanceof MergedItem) && ((MergedItem) baseItem).mProcess != null) {
                ((MergedItem) baseItem).mProcess.ensureLabel(packageManager);
                baseItem.mPackageInfo = ((MergedItem) baseItem).mProcess.mPackageInfo;
                baseItem.mDisplayLabel = ((MergedItem) baseItem).mProcess.mDisplayLabel;
            }
            this.name.setText(baseItem.mDisplayLabel);
            activeItem = new ActiveItem();
            activeItem.mRootView = this.rootView;
            activeItem.mItem = baseItem;
            activeItem.mHolder = this;
            activeItem.mFirstRunTime = baseItem.mActiveSince;
            if (baseItem.mBackground) {
                this.description.setText(this.rootView.getContext().getText(2131428439));
            } else {
                this.description.setText(baseItem.mDescription);
            }
            baseItem.mCurSizeStr = null;
            this.icon.setImageDrawable(baseItem.loadIcon(this.rootView.getContext(), runningState));
            this.icon.setVisibility(0);
            activeItem.updateTime(this.rootView.getContext(), stringBuilder);
        }
        return activeItem;
    }

    public RunningProcessesView$ViewHolder(View view) {
        this.rootView = view;
        this.icon = (ImageView) view.findViewById(2131230756);
        this.name = (TextView) view.findViewById(2131230834);
        this.description = (TextView) view.findViewById(2131230835);
        this.size = (TextView) view.findViewById(2131231011);
        this.uptime = (TextView) view.findViewById(2131230748);
        view.setTag(this);
    }
}