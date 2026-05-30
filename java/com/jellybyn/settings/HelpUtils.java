package com.jellybyn.settings;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import android.util.Log;
import android.view.MenuItem;
import java.util.Locale;

public class HelpUtils {
    private static final String TAG = HelpUtils.class.getName();
    private static String sCachedVersionCode = null;

    public static boolean prepareHelpMenuItem(Context context, MenuItem menuItem, String str) {
        if (TextUtils.isEmpty(str)) {
            menuItem.setVisible(false);
            return false;
        }
        Intent intent = new Intent("android.intent.action.VIEW", uriWithAddedParameters(context, Uri.parse(str)));
        intent.setFlags(276824064);
        menuItem.setIntent(intent);
        menuItem.setShowAsAction(0);
        menuItem.setVisible(true);
        return true;
    }

    private static Uri uriWithAddedParameters(Context context, Uri uri) {
        Builder builder = uri.buildUpon();
        builder.appendQueryParameter("hl", Locale.getDefault().toString());
        if (sCachedVersionCode == null) {
            try {
                sCachedVersionCode = Integer.toString(context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode);
                builder.appendQueryParameter("version", sCachedVersionCode);
            } catch (NameNotFoundException e) {
                Log.wtf(TAG, "Invalid package name for context", e);
            }
        } else {
            builder.appendQueryParameter("version", sCachedVersionCode);
        }
        return builder.build();
    }

    private HelpUtils() {
    }
}