package com.jellybyn.settings.applications;

import android.content.Context;
import android.os.SystemClock;
import android.text.format.DateUtils;
import android.view.View;
import android.widget.TextView;
import com.jellybyn.settings.applications.RunningProcessesView.ViewHolder;
import com.jellybyn.settings.applications.RunningState.BaseItem;
import com.jellybyn.settings.applications.RunningState.MergedItem;
import com.jellybyn.settings.applications.RunningState.ServiceItem;

public class RunningProcessesView$ActiveItem {
    long mFirstRunTime;
    ViewHolder mHolder;
    BaseItem mItem;
    View mRootView;
    boolean mSetBackground;

    void updateTime(Context context, StringBuilder stringBuilder) {
        TextView uptimeView = null;
        if (this.mItem instanceof ServiceItem) {
            uptimeView = this.mHolder.size;
        } else {
            String str = this.mItem.mSizeStr != null ? this.mItem.mSizeStr : "";
            if (!str.equals(this.mItem.mCurSizeStr)) {
                this.mItem.mCurSizeStr = str;
                this.mHolder.size.setText(str);
            }
            if (this.mItem.mBackground) {
                if (!this.mSetBackground) {
                    this.mSetBackground = true;
                    this.mHolder.uptime.setText("");
                }
            } else if (this.mItem instanceof MergedItem) {
                uptimeView = this.mHolder.uptime;
            }
        }
        if (uptimeView != null) {
            this.mSetBackground = false;
            if (this.mFirstRunTime >= 0) {
                uptimeView.setText(DateUtils.formatElapsedTime(stringBuilder, (SystemClock.elapsedRealtime() - this.mFirstRunTime) / 1000));
                return;
            }
            boolean isService = false;
            if (this.mItem instanceof MergedItem) {
                isService = ((MergedItem) this.mItem).mServices.size() > 0;
            }
            if (isService) {
                uptimeView.setText(context.getResources().getText(2131428438));
            } else {
                uptimeView.setText("");
            }
        }
    }
}