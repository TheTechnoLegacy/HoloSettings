package com.jellybyn.settings;

import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AppWidgetLoader<Item extends LabelledItem> {
    private AppWidgetManager mAppWidgetManager;
    private Context mContext;
    ItemConstructor<Item> mItemConstructor;

    void putCustomAppWidgets(List<Item> items, Intent intent) {
        ArrayList<Bundle> customExtras = null;
        ArrayList<AppWidgetProviderInfo> customInfo = intent.getParcelableArrayListExtra("customInfo");
        if (customInfo == null || customInfo.size() == 0) {
            Log.i("AppWidgetAdapter", "EXTRA_CUSTOM_INFO not present.");
        } else {
            int i;
            Parcelable p;
            int customInfoSize = customInfo.size();
            for (i = 0; i < customInfoSize; i++) {
                p = (Parcelable) customInfo.get(i);
                if (p == null || !(p instanceof AppWidgetProviderInfo)) {
                    customInfo = null;
                    Log.e("AppWidgetAdapter", "error using EXTRA_CUSTOM_INFO index=" + i);
                    break;
                }
            }
            customExtras = intent.getParcelableArrayListExtra("customExtras");
            if (customExtras == null) {
                customInfo = null;
                Log.e("AppWidgetAdapter", "EXTRA_CUSTOM_INFO without EXTRA_CUSTOM_EXTRAS");
            } else {
                int customExtrasSize = customExtras.size();
                if (customInfoSize != customExtrasSize) {
                    customInfo = null;
                    customExtras = null;
                    Log.e("AppWidgetAdapter", "list size mismatch: EXTRA_CUSTOM_INFO: " + customInfoSize + " EXTRA_CUSTOM_EXTRAS: " + customExtrasSize);
                } else {
                    for (i = 0; i < customExtrasSize; i++) {
                        p = (Parcelable) customExtras.get(i);
                        if (p == null || !(p instanceof Bundle)) {
                            customInfo = null;
                            customExtras = null;
                            Log.e("AppWidgetAdapter", "error using EXTRA_CUSTOM_EXTRAS index=" + i);
                            break;
                        }
                    }
                }
            }
        }
        putAppWidgetItems(customInfo, customExtras, items, 0, true);
    }

    protected List<Item> getItems(Intent intent) {
        boolean sortCustomAppWidgets = intent.getBooleanExtra("customSort", true);
        List<Item> items = new ArrayList();
        putInstalledAppWidgets(items, intent.getIntExtra("categoryFilter", 1));
        if (sortCustomAppWidgets) {
            putCustomAppWidgets(items, intent);
        }
        Collections.sort(items, new 1(this));
        if (!sortCustomAppWidgets) {
            ArrayList arrayList = new ArrayList();
            putCustomAppWidgets(arrayList, intent);
            items.addAll(arrayList);
        }
        return items;
    }

    void putAppWidgetItems(List<AppWidgetProviderInfo> appWidgets, List<Bundle> customExtras, List<Item> items, int i, boolean z) {
        if (appWidgets != null) {
            int size = appWidgets.size();
            for (int i2 = 0; i2 < size; i2++) {
                AppWidgetProviderInfo info = (AppWidgetProviderInfo) appWidgets.get(i2);
                if (z || (info.widgetCategory & i) != 0) {
                    items.add((LabelledItem) this.mItemConstructor.createItem(this.mContext, info, customExtras != null ? (Bundle) customExtras.get(i2) : null));
                }
            }
        }
    }

    public AppWidgetLoader(Context context, AppWidgetManager appWidgetManager, ItemConstructor<Item> itemConstructor) {
        this.mContext = context;
        this.mAppWidgetManager = appWidgetManager;
        this.mItemConstructor = itemConstructor;
    }

    void putInstalledAppWidgets(List<Item> items, int i) {
        putAppWidgetItems(this.mAppWidgetManager.getInstalledProviders(i), null, items, i, false);
    }
}