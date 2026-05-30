package com.jellybyn.settings;

import android.app.Activity;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.ServiceManager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ListView;
import android.widget.Spinner;
import com.android.internal.app.IUsageStats;
import com.android.internal.app.IUsageStats.Stub;

public class UsageStats extends Activity implements OnItemSelectedListener {
    private UsageStatsAdapter mAdapter;
    private LayoutInflater mInflater;
    private ListView mListView;
    private PackageManager mPm;
    private Spinner mTypeSpinner;
    private IUsageStats mUsageStatsService;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mUsageStatsService = Stub.asInterface(ServiceManager.getService("usagestats"));
        if (this.mUsageStatsService == null) {
            Log.e("UsageStatsActivity", "Failed to retrieve usagestats service");
            return;
        }
        this.mInflater = (LayoutInflater) getSystemService("layout_inflater");
        this.mPm = getPackageManager();
        setContentView(2130968704);
        this.mTypeSpinner = (Spinner) findViewById(2131231069);
        this.mTypeSpinner.setOnItemSelectedListener(this);
        this.mListView = (ListView) findViewById(2131231070);
        this.mAdapter = new UsageStatsAdapter(this);
        this.mListView.setAdapter(this.mAdapter);
    }

    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long j) {
        this.mAdapter.sortList(i);
    }

    public void onNothingSelected(AdapterView<?> adapterView) {
    }
}