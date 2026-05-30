package com.jellybyn.settings;

import android.app.ListFragment;
import android.content.ContentResolver;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.provider.UserDictionary.Words;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.jellybyn.settings.inputmethod.UserDictionaryAddWordFragment;
import java.util.Locale;

public class UserDictionarySettings extends ListFragment {
    private static final String[] QUERY_PROJECTION = new String[]{"_id", "word", "shortcut"};
    private Cursor mCursor;
    protected String mLocale;

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Intent intent = getActivity().getIntent();
        String localeFromIntent = intent == null ? null : intent.getStringExtra("locale");
        Bundle arguments = getArguments();
        String localeFromArguments = arguments == null ? null : arguments.getString("locale");
        String locale = localeFromArguments != null ? localeFromArguments : localeFromIntent != null ? localeFromIntent : null;
        this.mLocale = locale;
        this.mCursor = createCursor(locale);
        TextView textView = (TextView) getView().findViewById(16908292);
        textView.setText(2131428515);
        ListView listView = getListView();
        listView.setAdapter(createAdapter());
        listView.setFastScrollEnabled(true);
        listView.setEmptyView(textView);
        setHasOptionsMenu(true);
    }

    private void showAddOrEditDialog(String str, String str2) {
        Bundle bundle = new Bundle();
        bundle.putInt("mode", str == null ? 1 : 0);
        bundle.putString("word", str);
        bundle.putString("shortcut", str2);
        bundle.putString("locale", this.mLocale);
        ((PreferenceActivity) getActivity()).startPreferencePanel(UserDictionaryAddWordFragment.class.getName(), bundle, 2131428502, null, null, 0);
    }

    private Cursor createCursor(String str) {
        if ("".equals(str)) {
            return getActivity().managedQuery(Words.CONTENT_URI, QUERY_PROJECTION, "locale is null", null, "UPPER(word)");
        }
        String locale = str != null ? str : Locale.getDefault().toString();
        return getActivity().managedQuery(Words.CONTENT_URI, QUERY_PROJECTION, "locale=?", new String[]{locale}, "UPPER(word)");
    }

    private String getShortcut(int i) {
        if (this.mCursor == null) {
            return null;
        }
        this.mCursor.moveToPosition(i);
        return !this.mCursor.isAfterLast() ? this.mCursor.getString(this.mCursor.getColumnIndexOrThrow("shortcut")) : null;
    }

    private String getWord(int i) {
        if (this.mCursor == null) {
            return null;
        }
        this.mCursor.moveToPosition(i);
        return !this.mCursor.isAfterLast() ? this.mCursor.getString(this.mCursor.getColumnIndexOrThrow("word")) : null;
    }

    public void onListItemClick(ListView listView, View view, int i, long j) {
        String word = getWord(i);
        String shortcut = getShortcut(i);
        if (word != null) {
            showAddOrEditDialog(word, shortcut);
        }
    }

    public static void deleteWord(String str, String str2, ContentResolver contentResolver) {
        if (TextUtils.isEmpty(str2)) {
            contentResolver.delete(Words.CONTENT_URI, "word=? AND shortcut is null OR shortcut=''", new String[]{str});
            return;
        }
        contentResolver.delete(Words.CONTENT_URI, "word=? AND shortcut=?", new String[]{str, str2});
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menu.add(0, 1, 0, 2131428501).setIcon(2130837586).setShowAsAction(5);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 1) {
            return false;
        }
        showAddOrEditDialog(null, null);
        return true;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    private ListAdapter createAdapter() {
        return new MyAdapter(getActivity(), 2130968708, this.mCursor, new String[]{"word", "shortcut"}, new int[]{16908308, 16908309}, this);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(17367195, viewGroup, false);
    }
}