package com.jellybyn.settings;

import java.util.Comparator;
import java.util.HashMap;

class ZonePicker$MyComparator implements Comparator<HashMap<?, ?>> {
    private String mSortingKey;

    public int compare(HashMap<?, ?> map1, HashMap<?, ?> map2) {
        Object obj = map1.get(this.mSortingKey);
        Object value2 = map2.get(this.mSortingKey);
        return !isComparable(obj) ? isComparable(value2) ? 1 : 0 : !isComparable(value2) ? -1 : ((Comparable) obj).compareTo(value2);
    }

    public ZonePicker$MyComparator(String str) {
        this.mSortingKey = str;
    }

    private boolean isComparable(Object obj) {
        return obj != null && (obj instanceof Comparable);
    }
}