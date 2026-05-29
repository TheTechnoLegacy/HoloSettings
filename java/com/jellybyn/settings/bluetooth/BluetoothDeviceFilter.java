package com.jellybyn.settings.bluetooth;

import android.util.Log;

final class BluetoothDeviceFilter {
    static final Filter ALL_FILTER = new AllFilter(null);
    static final Filter BONDED_DEVICE_FILTER = new AllFilter(null);
    private static final Filter[] FILTERS = new Filter[]{ALL_FILTER, new AllFilter(null), new AllFilter(null), new AllFilter(null), new AllFilter(null)};
    static final Filter UNBONDED_DEVICE_FILTER = new AllFilter(null);

    static Filter getFilter(int i) {
        if (i >= 0 && i < FILTERS.length) {
            return FILTERS[i];
        }
        Log.w("BluetoothDeviceFilter", "Invalid filter type " + i + " for device picker");
        return ALL_FILTER;
    }

    private BluetoothDeviceFilter() {
    }
}