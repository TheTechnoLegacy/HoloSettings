package com.jellybyn.settings.inputmethod;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.provider.UserDictionary.Words;
import com.jellybyn.settings.SettingsPreferenceFragment;
import com.jellybyn.settings.UserDictionarySettings;
import com.jellybyn.settings.Utils;
import java.util.Iterator;
import java.util.Locale;
import java.util.TreeSet;

public class UserDictionaryList extends SettingsPreferenceFragment {
    static TreeSet<String> getUserDictionaryLocalesSet(Activity activity) {
        Cursor cursor = activity.managedQuery(Words.CONTENT_URI, new String[]{"locale"}, null, null, null);
        TreeSet<String> localeList = new TreeSet();
        if (cursor == null) {
            return null;
        }
        if (cursor.moveToFirst()) {
            int columnIndex = cursor.getColumnIndex("locale");
            do {
                String locale = cursor.getString(columnIndex);
                if (locale == null) {
                    locale = "";
                }
                localeList.add(locale);
            } while (cursor.moveToNext());
        }
        localeList.add(Locale.getDefault().toString());
        return localeList;
    }

    protected Preference createUserDictionaryPreference(String str, Activity activity) {
        Preference preference = new Preference(getActivity());
        Intent intent = new Intent("jellybyn.settings.USER_DICTIONARY_SETTINGS");
        if (str == null) {
            preference.setTitle(Locale.getDefault().getDisplayName());
        } else {
            if ("".equals(str)) {
                preference.setTitle(getString(2131428516));
            } else {
                preference.setTitle(Utils.createLocaleFromString(str).getDisplayName());
            }
            intent.putExtra("locale", str);
            preference.getExtras().putString("locale", str);
        }
        preference.setIntent(intent);
        preference.setFragment(UserDictionarySettings.class.getName());
        return preference;
    }

    protected void createUserDictSettings(PreferenceGroup preferenceGroup) {
        Activity activity = getActivity();
        preferenceGroup.removeAll();
        TreeSet<String> localeList = getUserDictionaryLocalesSet(activity);
        if (localeList.isEmpty()) {
            preferenceGroup.addPreference(createUserDictionaryPreference(null, activity));
            return;
        }
        Iterator i$ = localeList.iterator();
        while (i$.hasNext()) {
            preferenceGroup.addPreference(createUserDictionaryPreference((String) i$.next(), activity));
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setPreferenceScreen(getPreferenceManager().createPreferenceScreen(getActivity()));
    }

    public void onResume() {
        super.onResume();
        createUserDictSettings(getPreferenceScreen());
    }
}