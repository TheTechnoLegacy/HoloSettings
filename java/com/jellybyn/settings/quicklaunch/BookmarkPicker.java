package com.jellybyn.settings.quicklaunch;

import android.app.ListActivity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ResolveInfo.DisplayNameComparator;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.SimpleAdapter.ViewBinder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class BookmarkPicker extends ListActivity implements ViewBinder {
    private static final String[] sKeys = new String[]{"TITLE", "RESOLVE_INFO"};
    private static Intent sLaunchIntent;
    private static final int[] sResourceIds = new int[]{2131230757, 2131230756};
    private static Intent sShortcutIntent;
    private int mDisplayMode = 0;
    private SimpleAdapter mMyAdapter;
    private List<ResolveInfo> mResolveList;
    private Handler mUiHandler = new Handler();

    private void fillAdapterList(List<Map<String, ?>> list, List<ResolveInfo> resolveList) {
        list.clear();
        int resolveListSize = resolveList.size();
        for (int i = 0; i < resolveListSize; i++) {
            ResolveInfo resolveInfo = (ResolveInfo) resolveList.get(i);
            TreeMap treeMap = new TreeMap();
            treeMap.put("TITLE", getResolveInfoTitle(resolveInfo));
            treeMap.put("RESOLVE_INFO", resolveInfo);
            list.add(treeMap);
        }
    }

    protected void onListItemClick(ListView listView, View view, int i, long j) {
        if (i < this.mResolveList.size()) {
            ResolveInfo info = (ResolveInfo) this.mResolveList.get(i);
            switch (this.mDisplayMode) {
                case 0:
                    Intent intentForResolveInfo = getIntentForResolveInfo(info, "android.intent.action.MAIN");
                    intentForResolveInfo.addCategory("android.intent.category.LAUNCHER");
                    finish(intentForResolveInfo, getResolveInfoTitle(info));
                    return;
                case 1:
                    startShortcutActivity(info);
                    return;
                default:
                    return;
            }
        }
    }

    private void fillResolveList(List<ResolveInfo> list) {
        ensureIntents();
        PackageManager pm = getPackageManager();
        list.clear();
        if (this.mDisplayMode == 0) {
            list.addAll(pm.queryIntentActivities(sLaunchIntent, 0));
        } else if (this.mDisplayMode == 1) {
            list.addAll(pm.queryIntentActivities(sShortcutIntent, 0));
        }
    }

    protected void onActivityResult(int i, int i2, Intent intent) {
        if (i2 == -1) {
            switch (i) {
                case 1:
                    if (intent != null) {
                        finish((Intent) intent.getParcelableExtra("android.intent.extra.shortcut.INTENT"), intent.getStringExtra("android.intent.extra.shortcut.NAME"));
                        return;
                    }
                    return;
                default:
                    super.onActivityResult(i, i2, intent);
                    return;
            }
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 0:
                this.mDisplayMode = 0;
                break;
            case 1:
                this.mDisplayMode = 1;
                break;
            default:
                return false;
        }
        updateListAndAdapter();
        return true;
    }

    public boolean setViewValue(View view, Object obj, String str) {
        if (view.getId() != 2131230756) {
            return false;
        }
        Drawable loadIcon = ((ResolveInfo) obj).loadIcon(getPackageManager());
        if (loadIcon != null) {
            ((ImageView) view).setImageDrawable(loadIcon);
        }
        return true;
    }

    private void finish(Intent intent, String str) {
        intent.putExtras(getIntent());
        intent.putExtra("com.jellybyn.settings.quicklaunch.TITLE", str);
        setResult(-1, intent);
        finish();
    }

    private void ensureIntents() {
        if (sLaunchIntent == null) {
            sLaunchIntent = new Intent("android.intent.action.MAIN").addCategory("android.intent.category.LAUNCHER");
            sShortcutIntent = new Intent("android.intent.action.CREATE_SHORTCUT");
        }
    }

    private static Intent getIntentForResolveInfo(ResolveInfo resolveInfo, String str) {
        Intent intent = new Intent(str);
        ActivityInfo ai = resolveInfo.activityInfo;
        intent.setClassName(ai.packageName, ai.name);
        return intent;
    }

    public boolean onPrepareOptionsMenu(Menu menu) {
        boolean z = false;
        menu.findItem(0).setVisible(this.mDisplayMode != 0);
        MenuItem findItem = menu.findItem(1);
        if (this.mDisplayMode != 1) {
            z = true;
        }
        findItem.setVisible(z);
        return true;
    }

    private SimpleAdapter createResolveAdapter(List<Map<String, ?>> list) {
        SimpleAdapter adapter = new SimpleAdapter(this, list, 2130968596, sKeys, sResourceIds);
        adapter.setViewBinder(this);
        return adapter;
    }

    private String getResolveInfoTitle(ResolveInfo resolveInfo) {
        CharSequence label = resolveInfo.loadLabel(getPackageManager());
        if (label == null) {
            label = resolveInfo.activityInfo.name;
        }
        return label != null ? label.toString() : null;
    }

    private void startShortcutActivity(ResolveInfo resolveInfo) {
        startActivityForResult(getIntentForResolveInfo(resolveInfo, "android.intent.action.CREATE_SHORTCUT"), 1);
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        updateListAndAdapter();
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        menu.add(0, 0, 0, 2131428531).setIcon(17302302);
        menu.add(0, 1, 0, 2131428532).setIcon(17302325);
        return true;
    }

    private void updateAdapterToUseNewLists(final ArrayList<Map<String, ?>> newAdapterList, final ArrayList<ResolveInfo> newResolveList) {
        this.mUiHandler.post(new Runnable() {
            public void run() {
                BookmarkPicker.this.mMyAdapter = BookmarkPicker.this.createResolveAdapter(newAdapterList);
                BookmarkPicker.this.mResolveList = newResolveList;
                BookmarkPicker.this.setListAdapter(BookmarkPicker.this.mMyAdapter);
            }
        });
    }

    private void updateListAndAdapter() {
        new Thread("data updater") {
            public void run() {
                synchronized (BookmarkPicker.this) {
                    ArrayList arrayList = new ArrayList();
                    ArrayList arrayList2 = new ArrayList();
                    BookmarkPicker.this.fillResolveList(arrayList);
                    Collections.sort(arrayList, new DisplayNameComparator(BookmarkPicker.this.getPackageManager()));
                    BookmarkPicker.this.fillAdapterList(arrayList2, arrayList);
                    BookmarkPicker.this.updateAdapterToUseNewLists(arrayList2, arrayList);
                }
            }
        }.start();
    }
}