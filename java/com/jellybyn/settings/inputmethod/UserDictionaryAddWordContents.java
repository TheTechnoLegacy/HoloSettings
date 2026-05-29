package com.jellybyn.settings.inputmethod;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.UserDictionary.Words;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import com.jellybyn.settings.UserDictionarySettings;
import com.jellybyn.settings.Utils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;
import java.util.TreeSet;

public class UserDictionaryAddWordContents {
    private static final String[] HAS_WORD_PROJECTION = new String[]{"word"};
    private String mLocale;
    private final int mMode;
    private final String mOldShortcut;
    private final String mOldWord;
    private final EditText mShortcutEditText;
    private final EditText mWordEditText;

    int apply(Context context, Bundle bundle) {
        String newShortcut;
        Locale locale = null;
        if (bundle != null) {
            saveStateIntoBundle(bundle);
        }
        ContentResolver resolver = context.getContentResolver();
        if (this.mMode == 0 && !TextUtils.isEmpty(this.mOldWord)) {
            UserDictionarySettings.deleteWord(this.mOldWord, this.mOldShortcut, resolver);
        }
        String newWord = this.mWordEditText.getText().toString();
        if (this.mShortcutEditText == null) {
            newShortcut = null;
        } else {
            String obj = this.mShortcutEditText.getText().toString();
            newShortcut = TextUtils.isEmpty(obj) ? null : obj;
        }
        if (TextUtils.isEmpty(newWord)) {
            return 1;
        }
        if (hasWord(newWord, context)) {
            return 2;
        }
        UserDictionarySettings.deleteWord(newWord, null, resolver);
        if (!TextUtils.isEmpty(newShortcut)) {
            UserDictionarySettings.deleteWord(newWord, newShortcut, resolver);
        }
        String str = newWord.toString();
        if (!TextUtils.isEmpty(this.mLocale)) {
            locale = Utils.createLocaleFromString(this.mLocale);
        }
        Words.addWord(context, str, 250, newShortcut, locale);
        return 0;
    }

    UserDictionaryAddWordContents(View view, Bundle bundle) {
        this.mWordEditText = (EditText) view.findViewById(2131231075);
        this.mShortcutEditText = (EditText) view.findViewById(2131231078);
        String word = bundle.getString("word");
        if (word != null) {
            this.mWordEditText.setText(word);
            this.mWordEditText.setSelection(word.length());
        }
        String shortcut = bundle.getString("shortcut");
        if (!(shortcut == null || this.mShortcutEditText == null)) {
            this.mShortcutEditText.setText(shortcut);
        }
        this.mMode = bundle.getInt("mode");
        this.mOldWord = bundle.getString("word");
        this.mOldShortcut = bundle.getString("shortcut");
        updateLocale(bundle.getString("locale"));
    }

    public ArrayList<LocaleRenderer> getLocalesList(Activity activity) {
        TreeSet<String> locales = UserDictionaryList.getUserDictionaryLocalesSet(activity);
        locales.remove(this.mLocale);
        String systemLocale = Locale.getDefault().toString();
        locales.remove(systemLocale);
        locales.remove("");
        ArrayList<LocaleRenderer> localesList = new ArrayList();
        addLocaleDisplayNameToList(activity, localesList, this.mLocale);
        if (!systemLocale.equals(this.mLocale)) {
            addLocaleDisplayNameToList(activity, localesList, systemLocale);
        }
        Iterator i$ = locales.iterator();
        while (i$.hasNext()) {
            addLocaleDisplayNameToList(activity, localesList, (String) i$.next());
        }
        if (!"".equals(this.mLocale)) {
            addLocaleDisplayNameToList(activity, localesList, "");
        }
        localesList.add(new LocaleRenderer(activity, null));
        return localesList;
    }

    private boolean hasWord(String str, Context context) {
        Cursor cursor = "".equals(this.mLocale) ? context.getContentResolver().query(Words.CONTENT_URI, HAS_WORD_PROJECTION, "word=? AND locale is null", new String[]{str}, null) : context.getContentResolver().query(Words.CONTENT_URI, HAS_WORD_PROJECTION, "word=? AND locale=?", new String[]{str, this.mLocale}, null);
        if (cursor != null) {
            try {
                boolean z = cursor.getCount() > 0;
                if (cursor != null) {
                    cursor.close();
                }
                return z;
            } catch (Throwable th) {
                if (cursor != null) {
                    cursor.close();
                }
            }
        } else if (cursor == null) {
            return false;
        } else {
            cursor.close();
            return false;
        }
    }

    void saveStateIntoBundle(Bundle bundle) {
        bundle.putString("word", this.mWordEditText.getText().toString());
        bundle.putString("originalWord", this.mOldWord);
        if (this.mShortcutEditText != null) {
            bundle.putString("shortcut", this.mShortcutEditText.getText().toString());
        }
        if (this.mOldShortcut != null) {
            bundle.putString("originalShortcut", this.mOldShortcut);
        }
        bundle.putString("locale", this.mLocale);
    }

    void delete(Context context) {
        if (this.mMode == 0 && !TextUtils.isEmpty(this.mOldWord)) {
            UserDictionarySettings.deleteWord(this.mOldWord, this.mOldShortcut, context.getContentResolver());
        }
    }

    private static void addLocaleDisplayNameToList(Context context, ArrayList<LocaleRenderer> list, String str) {
        if (str != null) {
            list.add(new LocaleRenderer(context, str));
        }
    }

    void updateLocale(String str) {
        if (str == null) {
            str = Locale.getDefault().toString();
        }
        this.mLocale = str;
    }
}