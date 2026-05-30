package com.jellybyn.settings;

import android.app.ActionBar.LayoutParams;
import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.TextView;

public class DreamSettings extends SettingsPreferenceFragment {
    private static final String TAG = DreamSettings.class.getSimpleName();
    private DreamInfoAdapter mAdapter;
    private DreamBackend mBackend;
    private Context mContext;
    private MenuItem[] mMenuItemsWhenEnabled;
    private final PackageReceiver mPackageReceiver = new PackageReceiver(this, null);
    private boolean mRefreshing;
    private Switch mSwitch;

    private void refreshFromBackend() {
        logd("refreshFromBackend()", new Object[0]);
        this.mRefreshing = true;
        boolean dreamsEnabled = this.mBackend.isEnabled();
        if (this.mSwitch.isChecked() != dreamsEnabled) {
            this.mSwitch.setChecked(dreamsEnabled);
        }
        this.mAdapter.clear();
        if (dreamsEnabled) {
            this.mAdapter.addAll(this.mBackend.getDreamInfos());
        }
        if (this.mMenuItemsWhenEnabled != null) {
            for (MenuItem enabled : this.mMenuItemsWhenEnabled) {
                enabled.setEnabled(dreamsEnabled);
            }
        }
        this.mRefreshing = false;
    }

    public void onCreate(Bundle bundle) {
        logd("onCreate(%s)", bundle);
        super.onCreate(bundle);
        Activity activity = getActivity();
        this.mBackend = new DreamBackend(activity);
        this.mSwitch = new Switch(activity);
        this.mSwitch.setOnCheckedChangeListener(new 1(this));
        this.mSwitch.setPaddingRelative(0, 0, activity.getResources().getDimensionPixelSize(2131558402), 0);
        activity.getActionBar().setDisplayOptions(16, 16);
        activity.getActionBar().setCustomView(this.mSwitch, new LayoutParams(-2, -2, 8388629));
        setHasOptionsMenu(true);
    }

    public void onResume() {
        logd("onResume()", new Object[0]);
        super.onResume();
        refreshFromBackend();
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.intent.action.PACKAGE_ADDED");
        filter.addAction("android.intent.action.PACKAGE_CHANGED");
        filter.addAction("android.intent.action.PACKAGE_REMOVED");
        filter.addAction("android.intent.action.PACKAGE_REPLACED");
        filter.addDataScheme("package");
        this.mContext.registerReceiver(this.mPackageReceiver, filter);
    }

    public void onActivityCreated(Bundle bundle) {
        logd("onActivityCreated(%s)", bundle);
        super.onActivityCreated(bundle);
        ListView listView = getListView();
        listView.setItemsCanFocus(true);
        TextView emptyView = (TextView) getView().findViewById(16908292);
        emptyView.setText(2131428047);
        listView.setEmptyView(emptyView);
        this.mAdapter = new DreamInfoAdapter(this, this.mContext);
        listView.setAdapter(this.mAdapter);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        logd("onCreateOptionsMenu()", new Object[0]);
        boolean isEnabled = this.mBackend.isEnabled();
        MenuItem start = createMenuItem(menu, 2131428049, 2, isEnabled, new 2(this));
        MenuItem whenToDream = createMenuItem(menu, 2131428048, 1, isEnabled, new 3(this));
        super.onCreateOptionsMenu(menu, menuInflater);
        this.mMenuItemsWhenEnabled = new MenuItem[]{start, whenToDream};
    }

    private MenuItem createMenuItem(Menu menu, int i, int i2, boolean z, Runnable runnable) {
        MenuItem item = menu.add(i);
        item.setShowAsAction(i2);
        item.setEnabled(z);
        item.setOnMenuItemClickListener(new 4(this, runnable));
        return item;
    }

    public static CharSequence getSummaryTextWithDreamName(Context context) {
        DreamBackend backend = new DreamBackend(context);
        return !backend.isEnabled() ? context.getString(2131428046) : backend.getActiveDreamName();
    }

    private Dialog createWhenToDreamDialog() {
        int i = 2;
        CharSequence[] items = new CharSequence[]{this.mContext.getString(2131428045), this.mContext.getString(2131428044), this.mContext.getString(2131428043)};
        if (!(this.mBackend.isActivatedOnDock() && this.mBackend.isActivatedOnSleep())) {
            i = this.mBackend.isActivatedOnDock() ? 0 : this.mBackend.isActivatedOnSleep() ? 1 : -1;
        }
        return new Builder(this.mContext).setTitle(2131428048).setSingleChoiceItems(items, i, new 5(this)).create();
    }

    public void onAttach(Activity activity) {
        logd("onAttach(%s)", activity.getClass().getSimpleName());
        super.onAttach(activity);
        this.mContext = activity;
    }

    public Dialog onCreateDialog(int i) {
        logd("onCreateDialog(%s)", Integer.valueOf(i));
        return i == 1 ? createWhenToDreamDialog() : super.onCreateDialog(i);
    }

    public void onPause() {
        logd("onPause()", new Object[0]);
        super.onPause();
        this.mContext.unregisterReceiver(this.mPackageReceiver);
    }

    public void onDestroyView() {
        getActivity().getActionBar().setCustomView(null);
        super.onDestroyView();
    }

    private static void logd(String str, Object... objArr) {
    }

    public int getHelpResource() {
        return 2131429125;
    }
}