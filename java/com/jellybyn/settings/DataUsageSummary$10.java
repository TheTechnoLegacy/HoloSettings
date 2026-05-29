package com.jellybyn.settings;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.Loader;
import android.os.Bundle;
import com.jellybyn.settings.net.ChartData;
import com.jellybyn.settings.net.ChartDataLoader;

class DataUsageSummary$10 implements LoaderCallbacks<ChartData> {
    final /* synthetic */ DataUsageSummary this$0;

    public void onLoadFinished(Loader<ChartData> loader, ChartData chartData) {
        DataUsageSummary.access$1702(this.this$0, chartData);
        DataUsageSummary.access$1400(this.this$0).bindNetworkStats(DataUsageSummary.access$1700(this.this$0).network);
        DataUsageSummary.access$1400(this.this$0).bindDetailNetworkStats(DataUsageSummary.access$1700(this.this$0).detail);
        DataUsageSummary.access$600(this.this$0, true);
        DataUsageSummary.access$1800(this.this$0);
        if (DataUsageSummary.access$1700(this.this$0).detail != null) {
            DataUsageSummary.access$1900(this.this$0).smoothScrollToPosition(0);
        }
    }

    public void onLoaderReset(Loader<ChartData> loader) {
        DataUsageSummary.access$1702(this.this$0, null);
        DataUsageSummary.access$1400(this.this$0).bindNetworkStats(null);
        DataUsageSummary.access$1400(this.this$0).bindDetailNetworkStats(null);
    }

    DataUsageSummary$10(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }

    public Loader<ChartData> onCreateLoader(int i, Bundle bundle) {
        return new ChartDataLoader(this.this$0.getActivity(), DataUsageSummary.access$1600(this.this$0), bundle);
    }
}