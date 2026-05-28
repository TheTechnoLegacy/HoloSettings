package com.jellybyn.settings.fuelgauge;

import android.app.Fragment;
import android.os.Bundle;
import android.os.Parcel;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.android.internal.os.BatteryStatsImpl;

public class BatteryHistoryDetail extends Fragment {
    private BatteryStatsImpl mStats;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        byte[] data = getArguments().getByteArray("stats");
        Parcel parcel = Parcel.obtain();
        parcel.unmarshall(data, 0, data.length);
        parcel.setDataPosition(0);
        this.mStats = (BatteryStatsImpl) BatteryStatsImpl.CREATOR.createFromParcel(parcel);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = layoutInflater.inflate(2130968659, null);
        ((BatteryHistoryChart) view.findViewById(16842754)).setStats(this.mStats);
        return view;
    }
}