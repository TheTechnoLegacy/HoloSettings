package com.jellybyn.settings.fuelgauge;

import android.content.Context;

public class Utils {
    public static String formatElapsedTime(Context context, double d) {
        StringBuilder sb = new StringBuilder();
        int seconds = (int) Math.floor(d / 1000.0d);
        int days = 0;
        int hours = 0;
        int minutes = 0;
        if (seconds > 86400) {
            days = seconds / 86400;
            seconds -= days * 86400;
        }
        if (seconds > 3600) {
            hours = seconds / 3600;
            seconds -= hours * 3600;
        }
        if (seconds > 60) {
            minutes = seconds / 60;
            seconds -= minutes * 60;
        }
        if (days > 0) {
            sb.append(context.getString(2131428580, new Object[]{Integer.valueOf(days), Integer.valueOf(hours), Integer.valueOf(minutes), Integer.valueOf(seconds)}));
        } else if (hours > 0) {
            sb.append(context.getString(2131428581, new Object[]{Integer.valueOf(hours), Integer.valueOf(minutes), Integer.valueOf(seconds)}));
        } else if (minutes > 0) {
            sb.append(context.getString(2131428582, new Object[]{Integer.valueOf(minutes), Integer.valueOf(seconds)}));
        } else {
            sb.append(context.getString(2131428583, new Object[]{Integer.valueOf(seconds)}));
        }
        return sb.toString();
    }
}