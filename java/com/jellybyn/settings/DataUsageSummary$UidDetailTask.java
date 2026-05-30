package com.jellybyn.settings;

import android.os.AsyncTask;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.internal.util.Preconditions;
import com.jellybyn.settings.DataUsageSummary.AppItem;
import com.jellybyn.settings.net.UidDetail;
import com.jellybyn.settings.net.UidDetailProvider;

class DataUsageSummary$UidDetailTask extends AsyncTask<Void, Void, UidDetail> {
    private final AppItem mItem;
    private final UidDetailProvider mProvider;
    private final View mTarget;

    private static void bindView(UidDetail uidDetail, View view) {
        ImageView icon = (ImageView) view.findViewById(16908294);
        TextView title = (TextView) view.findViewById(16908310);
        if (uidDetail != null) {
            icon.setImageDrawable(uidDetail.icon);
            title.setText(uidDetail.label);
            return;
        }
        icon.setImageDrawable(null);
        title.setText(null);
    }

    public static void bindView(UidDetailProvider uidDetailProvider, AppItem appItem, View view) {
        DataUsageSummary$UidDetailTask existing = (DataUsageSummary$UidDetailTask) view.getTag();
        if (existing != null) {
            existing.cancel(false);
        }
        UidDetail cachedDetail = uidDetailProvider.getUidDetail(appItem.key, false);
        if (cachedDetail != null) {
            bindView(cachedDetail, view);
        } else {
            view.setTag(new DataUsageSummary$UidDetailTask(uidDetailProvider, appItem, view).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]));
        }
    }

    private DataUsageSummary$UidDetailTask(UidDetailProvider uidDetailProvider, AppItem appItem, View view) {
        this.mProvider = (UidDetailProvider) Preconditions.checkNotNull(uidDetailProvider);
        this.mItem = (AppItem) Preconditions.checkNotNull(appItem);
        this.mTarget = (View) Preconditions.checkNotNull(view);
    }

    protected void onPostExecute(UidDetail uidDetail) {
        bindView(uidDetail, this.mTarget);
    }

    protected void onPreExecute() {
        bindView(null, this.mTarget);
    }

    protected UidDetail doInBackground(Void... voidArr) {
        return this.mProvider.getUidDetail(this.mItem.key, true);
    }
}