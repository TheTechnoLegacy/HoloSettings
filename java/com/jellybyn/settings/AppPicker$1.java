package com.jellybyn.settings;

import com.jellybyn.settings.AppPicker.MyApplicationInfo;
import java.text.Collator;
import java.util.Comparator;

class AppPicker$1 implements Comparator<MyApplicationInfo> {
    private final Collator collator = Collator.getInstance();

    AppPicker$1() {
    }

    public final int compare(MyApplicationInfo myApplicationInfo, MyApplicationInfo myApplicationInfo2) {
        return this.collator.compare(myApplicationInfo.label, myApplicationInfo2.label);
    }
}