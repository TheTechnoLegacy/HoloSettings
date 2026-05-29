package com.jellybyn.settings.wifi;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

class WifiSettings$Multimap<K, V> {
    private HashMap<K, List<V>> store;
    final /* synthetic */ WifiSettings this$0;

    void put(K key, V val) {
        List<V> curVals = (List) this.store.get(key);
        if (curVals == null) {
            curVals = new ArrayList(3);
            this.store.put(key, curVals);
        }
        curVals.add(val);
    }

    private WifiSettings$Multimap(WifiSettings wifiSettings) {
        this.this$0 = wifiSettings;
        this.store = new HashMap();
    }

    List<V> getAll(K key) {
        List<V> values = (List) this.store.get(key);
        return values != null ? values : Collections.emptyList();
    }
}