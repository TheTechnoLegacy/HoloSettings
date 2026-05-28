package com.jellybyn.settings;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ListView;
import java.util.Comparator;

public class AppPicker extends ListActivity {
    private static final Comparator<MyApplicationInfo> sDisplayNameComparator = new 1();
    private AppListAdapter mAdapter;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mAdapter = new AppListAdapter(this, this);
        if (this.mAdapter.getCount() <= 0) {
            finish();
        } else {
            setListAdapter(this.mAdapter);
        }
    }

    protected void onListItemClick(ListView listView, View view, int i, long j) {
        MyApplicationInfo app = (MyApplicationInfo) this.mAdapter.getItem(i);
        Intent intent = new Intent();
        if (app.info != null) {
            intent.setAction(app.info.packageName);
        }
        setResult(-1, intent);
        finish();
    }

    protected void onResume() {
        super.onResume();
    }

    protected void onStop() {
        super.onStop();
    }
}