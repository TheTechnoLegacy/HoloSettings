package com.jellybyn.settings.net;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.net.INetworkStatsSession;
import android.net.NetworkStatsHistory;
import android.net.NetworkTemplate;
import android.os.Bundle;
import android.os.RemoteException;
import com.jellybyn.settings.DataUsageSummary.AppItem;

public class ChartDataLoader extends AsyncTaskLoader<ChartData> {
    private final Bundle mArgs;
    private final INetworkStatsSession mSession;

    private ChartData loadInBackground(NetworkTemplate networkTemplate, AppItem appItem, int i) throws RemoteException {
        ChartData data = new ChartData();
        data.network = this.mSession.getHistoryForNetwork(networkTemplate, i);
        if (appItem != null) {
            int size = appItem.uids.size();
            for (int i2 = 0; i2 < size; i2++) {
                int keyAt = appItem.uids.keyAt(i2);
                data.detailDefault = collectHistoryForUid(networkTemplate, keyAt, 0, data.detailDefault);
                data.detailForeground = collectHistoryForUid(networkTemplate, keyAt, 1, data.detailForeground);
            }
            if (size > 0) {
                data.detail = new NetworkStatsHistory(data.detailForeground.getBucketDuration());
                data.detail.recordEntireHistory(data.detailDefault);
                data.detail.recordEntireHistory(data.detailForeground);
            } else {
                data.detailDefault = new NetworkStatsHistory(3600000);
                data.detailForeground = new NetworkStatsHistory(3600000);
                data.detail = new NetworkStatsHistory(3600000);
            }
        }
        return data;
    }

    public ChartData loadInBackground() {
        try {
            return loadInBackground((NetworkTemplate) this.mArgs.getParcelable("template"), (AppItem) this.mArgs.getParcelable("app"), this.mArgs.getInt("fields"));
        } catch (RemoteException e) {
            throw new RuntimeException("problem reading network stats", e);
        }
    }

    public static Bundle buildArgs(NetworkTemplate networkTemplate, AppItem appItem, int i) {
        Bundle args = new Bundle();
        args.putParcelable("template", networkTemplate);
        args.putParcelable("app", appItem);
        args.putInt("fields", i);
        return args;
    }

    public ChartDataLoader(Context context, INetworkStatsSession iNetworkStatsSession, Bundle bundle) {
        super(context);
        this.mSession = iNetworkStatsSession;
        this.mArgs = bundle;
    }

    private NetworkStatsHistory collectHistoryForUid(NetworkTemplate networkTemplate, int i, int i2, NetworkStatsHistory networkStatsHistory) throws RemoteException {
        NetworkStatsHistory history = this.mSession.getHistoryForUid(networkTemplate, i, i2, 0, 10);
        if (networkStatsHistory == null) {
            return history;
        }
        networkStatsHistory.recordEntireHistory(history);
        return networkStatsHistory;
    }

    protected void onReset() {
        super.onReset();
        cancelLoad();
    }

    protected void onStartLoading() {
        super.onStartLoading();
        forceLoad();
    }

    protected void onStopLoading() {
        super.onStopLoading();
        cancelLoad();
    }

    public static Bundle buildArgs(NetworkTemplate networkTemplate, AppItem appItem) {
        return buildArgs(networkTemplate, appItem, 10);
    }
}