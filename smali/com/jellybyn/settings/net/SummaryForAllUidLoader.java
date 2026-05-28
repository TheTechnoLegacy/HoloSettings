package com.jellybyn.settings.net;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.net.INetworkStatsSession;
import android.net.NetworkStats;
import android.net.NetworkTemplate;
import android.os.Bundle;
import android.os.RemoteException;

public class SummaryForAllUidLoader extends AsyncTaskLoader<NetworkStats> {
    private final Bundle mArgs;
    private final INetworkStatsSession mSession;

    public NetworkStats loadInBackground() {
        try {
            return this.mSession.getSummaryForAllUid((NetworkTemplate) this.mArgs.getParcelable("template"), this.mArgs.getLong("start"), this.mArgs.getLong("end"), false);
        } catch (RemoteException e) {
            return null;
        }
    }

    public static Bundle buildArgs(NetworkTemplate networkTemplate, long j, long j2) {
        Bundle args = new Bundle();
        args.putParcelable("template", networkTemplate);
        args.putLong("start", j);
        args.putLong("end", j2);
        return args;
    }

    public SummaryForAllUidLoader(Context context, INetworkStatsSession iNetworkStatsSession, Bundle bundle) {
        super(context);
        this.mSession = iNetworkStatsSession;
        this.mArgs = bundle;
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
}