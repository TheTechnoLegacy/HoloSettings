package com.jellybyn.settings.deviceinfo;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import com.google.android.collect.Lists;
import com.jellybyn.settings.deviceinfo.PercentageBarChart.Entry;
import java.util.Collections;
import java.util.List;

public class UsageBarPreference extends Preference {
    private PercentageBarChart mChart = null;
    private final List<Entry> mEntries = Lists.newArrayList();

    public UsageBarPreference(Context context) {
        super(context);
        setLayoutResource(2130968669);
    }

    public UsageBarPreference(Context context, AttributeSet attributeSet) {
        setLayoutResource(2130968669);
    }

    public UsageBarPreference(Context context, AttributeSet attributeSet, int i) {
        setLayoutResource(2130968669);
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        this.mChart = (PercentageBarChart) view.findViewById(2131230945);
        this.mChart.setEntries(this.mEntries);
    }

    public void addEntry(int i, float f, int i2) {
        this.mEntries.add(PercentageBarChart.createEntry(i, f, i2));
        Collections.sort(this.mEntries);
    }

    public void commit() {
        if (this.mChart != null) {
            this.mChart.invalidate();
        }
    }

    public void clear() {
        this.mEntries.clear();
    }
}