package com.jellybyn.settings;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.Loader;
import android.net.NetworkStats;
import android.os.Bundle;
import android.widget.TextView;
import com.jellybyn.settings.net.SummaryForAllUidLoader;

class DataUsageSummary$11 implements LoaderCallbacks<NetworkStats> {
    final /* synthetic */ DataUsageSummary this$0;

    private void updateEmptyVisible() {
        int i = 0;
        boolean isEmpty = DataUsageSummary.access$2100(this.this$0).isEmpty() && !DataUsageSummary.access$2200(this.this$0);
        TextView access$2300 = DataUsageSummary.access$2300(this.this$0);
        if (!isEmpty) {
            i = 8;
        }
        access$2300.setVisibility(i);
    }

    public void onLoadFinished(Loader<NetworkStats> loader, NetworkStats networkStats) {
        DataUsageSummary.access$2100(this.this$0).bindStats(networkStats, DataUsageSummary.access$2000(this.this$0).getUidsWithPolicy(1));
        updateEmptyVisible();
    }

    public void onLoaderReset(Loader<NetworkStats> loader) {
        DataUsageSummary.access$2100(this.this$0).bindStats(null, new int[0]);
        updateEmptyVisible();
    }

    DataUsageSummary$11(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }

    public Loader<NetworkStats> onCreateLoader(int i, Bundle bundle) {
        return new SummaryForAllUidLoader(this.this$0.getActivity(), DataUsageSummary.access$1600(this.this$0), bundle);
    }
}