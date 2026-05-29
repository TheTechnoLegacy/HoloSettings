package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.Intent.ShortcutIconResource;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.content.pm.ResolveInfo.DisplayNameComparator;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController.AlertParams;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ActivityPicker extends AlertActivity implements OnCancelListener, OnClickListener {
    private PickAdapter mAdapter;
    private Intent mBaseIntent;

    protected List<Item> getItems() {
        PackageManager packageManager = getPackageManager();
        List<Item> items = new ArrayList();
        Intent intent = getIntent();
        ArrayList<String> labels = intent.getStringArrayListExtra("android.intent.extra.shortcut.NAME");
        ArrayList<ShortcutIconResource> icons = intent.getParcelableArrayListExtra("android.intent.extra.shortcut.ICON_RESOURCE");
        if (!(labels == null || icons == null || labels.size() != icons.size())) {
            for (int i = 0; i < labels.size(); i++) {
                String label = (String) labels.get(i);
                Drawable icon = null;
                try {
                    ShortcutIconResource shortcutIconResource = (ShortcutIconResource) icons.get(i);
                    Resources resourcesForApplication = packageManager.getResourcesForApplication(shortcutIconResource.packageName);
                    icon = resourcesForApplication.getDrawable(resourcesForApplication.getIdentifier(shortcutIconResource.resourceName, null, null));
                } catch (NameNotFoundException e) {
                }
                items.add(new Item(this, label, icon));
            }
        }
        if (this.mBaseIntent != null) {
            putIntentItems(this.mBaseIntent, items);
        }
        return items;
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        Parcelable parcelableExtra = intent.getParcelableExtra("android.intent.extra.INTENT");
        if (parcelableExtra instanceof Intent) {
            this.mBaseIntent = (Intent) parcelableExtra;
        } else {
            this.mBaseIntent = new Intent("android.intent.action.MAIN", null);
            this.mBaseIntent.addCategory("android.intent.category.DEFAULT");
        }
        AlertParams params = this.mAlertParams;
        params.mOnClickListener = this;
        params.mOnCancelListener = this;
        if (intent.hasExtra("android.intent.extra.TITLE")) {
            params.mTitle = intent.getStringExtra("android.intent.extra.TITLE");
        } else {
            params.mTitle = getTitle();
        }
        this.mAdapter = new PickAdapter(this, getItems());
        params.mAdapter = this.mAdapter;
        setupAlert();
    }

    protected void putIntentItems(Intent intent, List<Item> items) {
        PackageManager packageManager = getPackageManager();
        List<ResolveInfo> list = packageManager.queryIntentActivities(intent, 0);
        Collections.sort(list, new DisplayNameComparator(packageManager));
        int listSize = list.size();
        for (int i = 0; i < listSize; i++) {
            items.add(new Item(this, packageManager, (ResolveInfo) list.get(i)));
        }
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        setResult(-1, getIntentForPosition(i));
        finish();
    }

    public void onCancel(DialogInterface dialogInterface) {
        setResult(0);
        finish();
    }

    protected Intent getIntentForPosition(int i) {
        return ((Item) this.mAdapter.getItem(i)).getIntent(this.mBaseIntent);
    }
}