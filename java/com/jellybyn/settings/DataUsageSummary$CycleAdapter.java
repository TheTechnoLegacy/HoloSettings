package com.jellybyn.settings;

import android.content.Context;
import android.widget.ArrayAdapter;
import com.jellybyn.settings.DataUsageSummary.CycleChangeItem;
import com.jellybyn.settings.DataUsageSummary.CycleItem;

public class DataUsageSummary$CycleAdapter extends ArrayAdapter<CycleItem> {
    private final CycleChangeItem mChangeItem;
    private boolean mChangePossible = false;
    private boolean mChangeVisible = false;

    public int findNearestPosition(CycleItem cycleItem) {
        if (cycleItem != null) {
            for (int count = getCount() - 1; count >= 0; count--) {
                CycleItem cycleItem2 = (CycleItem) getItem(count);
                if (!(cycleItem2 instanceof CycleChangeItem) && cycleItem2.compareTo(cycleItem) >= 0) {
                    return count;
                }
            }
        }
        return 0;
    }

    public DataUsageSummary$CycleAdapter(Context context) {
        super(context, 17367048);
        setDropDownViewResource(17367049);
        this.mChangeItem = new CycleChangeItem(context);
    }

    private void updateChange() {
        remove(this.mChangeItem);
        if (this.mChangePossible && this.mChangeVisible) {
            add(this.mChangeItem);
        }
    }

    public void setChangePossible(boolean z) {
        this.mChangePossible = z;
        updateChange();
    }

    public void setChangeVisible(boolean z) {
        this.mChangeVisible = z;
        updateChange();
    }
}