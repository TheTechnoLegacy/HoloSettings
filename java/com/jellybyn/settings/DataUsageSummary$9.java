package com.jellybyn.settings;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import com.jellybyn.settings.DataUsageSummary.CycleChangeItem;
import com.jellybyn.settings.DataUsageSummary.CycleEditorFragment;
import com.jellybyn.settings.DataUsageSummary.CycleItem;

class DataUsageSummary$9 implements OnItemSelectedListener {
    final /* synthetic */ DataUsageSummary this$0;

    public void onItemSelected(AdapterView<?> parent, View view, int i, long j) {
        CycleItem cycle = (CycleItem) parent.getItemAtPosition(i);
        if (cycle instanceof CycleChangeItem) {
            CycleEditorFragment.show(this.this$0);
            DataUsageSummary.access$1300(this.this$0).setSelection(0);
            return;
        }
        DataUsageSummary.access$1400(this.this$0).setVisibleRange(cycle.start, cycle.end);
        DataUsageSummary.access$1500(this.this$0);
    }

    DataUsageSummary$9(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }

    public void onNothingSelected(AdapterView<?> adapterView) {
    }
}