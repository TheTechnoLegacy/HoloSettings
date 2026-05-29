package com.jellybyn.settings;

import android.content.Context;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.jellybyn.settings.DataUsageSummary.AppDetailsFragment;
import com.jellybyn.settings.DataUsageSummary.AppItem;

class DataUsageSummary$8 implements OnItemClickListener {
    final /* synthetic */ DataUsageSummary this$0;

    public void onItemClick(AdapterView<?> parent, View view, int i, long j) {
        Context context = view.getContext();
        AppItem app = (AppItem) parent.getItemAtPosition(i);
        if (DataUsageSummary.access$1200(this.this$0) != null && app != null) {
            AppDetailsFragment.show(this.this$0, app, DataUsageSummary.access$1200(this.this$0).getUidDetail(app.key, true).label);
        }
    }

    DataUsageSummary$8(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }
}