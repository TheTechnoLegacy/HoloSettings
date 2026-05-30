package com.jellybyn.settings;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import java.util.List;

public class WallpaperTypeSettings extends SettingsPreferenceFragment {
    private void populateWallpaperTypes() {
        Intent intent = new Intent("android.intent.action.SET_WALLPAPER");
        PackageManager pm = getPackageManager();
        List<ResolveInfo> rList = pm.queryIntentActivities(intent, 65536);
        PreferenceScreen parent = getPreferenceScreen();
        parent.setOrderingAsAdded(false);
        for (ResolveInfo resolveInfo : rList) {
            Preference preference = new Preference(getActivity());
            Intent intent2 = new Intent(intent);
            intent2.setComponent(new ComponentName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name));
            preference.setIntent(intent2);
            CharSequence loadLabel = resolveInfo.loadLabel(pm);
            if (loadLabel == null) {
                loadLabel = resolveInfo.activityInfo.packageName;
            }
            preference.setTitle(loadLabel);
            parent.addPreference(preference);
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034162);
        populateWallpaperTypes();
    }
}