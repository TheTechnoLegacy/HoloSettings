package com.jellybyn.settings;

import android.appwidget.AppWidgetProviderInfo;
import android.content.Context;
import android.os.Bundle;

public interface AppWidgetLoader$ItemConstructor<Item> {
    Item createItem(Context context, AppWidgetProviderInfo appWidgetProviderInfo, Bundle bundle);
}