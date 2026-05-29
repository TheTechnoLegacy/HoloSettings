package com.jellybyn.settings.wifi;

import android.content.Context;
import android.net.NetworkInfo.DetailedState;

class Summary {
    static String get(Context context, String str, DetailedState detailedState) {
        String[] formats = context.getResources().getStringArray(str == null ? 2131165200 : 2131165201);
        int index = detailedState.ordinal();
        if (index >= formats.length || formats[index].length() == 0) {
            return null;
        }
        return String.format(formats[index], new Object[]{str});
    }

    Summary() {
    }

    static String get(Context context, DetailedState detailedState) {
        return get(context, null, detailedState);
    }
}