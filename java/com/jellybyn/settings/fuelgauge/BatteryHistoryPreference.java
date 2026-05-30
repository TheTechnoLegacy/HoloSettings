package com.jellybyn.settings.fuelgauge;

import android.content.Context;
import android.os.BatteryStats;
import android.preference.Preference;
import android.view.View;

public class BatteryHistoryPreference extends Preference {
    private BatteryStats mStats;

    public BatteryHistoryPreference(Context context, BatteryStats batteryStats) {
        super(context);
        setLayoutResource(2130968659);
        this.mStats = batteryStats;
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        ((BatteryHistoryChart) view.findViewById(16842754)).setStats(this.mStats);
    }
}