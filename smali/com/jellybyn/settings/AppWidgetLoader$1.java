package com.jellybyn.settings;

import java.text.Collator;
import java.util.Comparator;

class AppWidgetLoader$1 implements Comparator<Item> {
    Collator mCollator = Collator.getInstance();
    final /* synthetic */ AppWidgetLoader this$0;

    AppWidgetLoader$1(AppWidgetLoader appWidgetLoader) {
        this.this$0 = appWidgetLoader;
    }

    public int compare(Item lhs, Item rhs) {
        return this.mCollator.compare(lhs.getLabel(), rhs.getLabel());
    }
}