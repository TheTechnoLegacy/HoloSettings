package com.jellybyn.settings.deviceinfo;

import android.util.SparseLongArray;
import com.google.android.collect.Maps;
import java.util.HashMap;

public class StorageMeasurement$MeasurementDetails {
    public long appsSize;
    public long availSize;
    public long cacheSize;
    public HashMap<String, Long> mediaSize = Maps.newHashMap();
    public long miscSize;
    public long totalSize;
    public SparseLongArray usersSize = new SparseLongArray();
}