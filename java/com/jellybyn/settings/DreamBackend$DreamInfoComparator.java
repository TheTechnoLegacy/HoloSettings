package com.jellybyn.settings;

import android.content.ComponentName;
import com.jellybyn.settings.DreamBackend.DreamInfo;
import java.util.Comparator;

class DreamBackend$DreamInfoComparator implements Comparator<DreamInfo> {
    private final ComponentName mDefaultDream;

    private String sortKey(DreamInfo dreamInfo) {
        StringBuilder sb = new StringBuilder();
        sb.append(dreamInfo.componentName.equals(this.mDefaultDream) ? '0' : '1');
        sb.append(dreamInfo.caption);
        return sb.toString();
    }

    public DreamBackend$DreamInfoComparator(ComponentName componentName) {
        this.mDefaultDream = componentName;
    }

    public int compare(DreamInfo dreamInfo, DreamInfo dreamInfo2) {
        return sortKey(dreamInfo).compareTo(sortKey(dreamInfo2));
    }
}