package com.jellybyn.settings.quicklaunch;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.ContentObserver;
import android.database.Cursor;
import android.os.Bundle;
import android.os.Handler;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.provider.Settings.Bookmarks;
import android.util.Log;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemLongClickListener;
import java.net.URISyntaxException;

public class QuickLaunchSettings extends PreferenceActivity implements OnClickListener, OnItemLongClickListener {
    private static final String[] sProjection = new String[]{"shortcut", "title", "intent"};
    private SparseBooleanArray mBookmarkedShortcuts;
    private Cursor mBookmarksCursor;
    private BookmarksObserver mBookmarksObserver;
    private CharSequence mClearDialogBookmarkTitle;
    private char mClearDialogShortcut;
    private PreferenceGroup mShortcutGroup;
    private SparseArray<ShortcutPreference> mShortcutToPreference;
    private Handler mUiHandler = new Handler();

    private class BookmarksObserver extends ContentObserver {
        public BookmarksObserver(Handler handler) {
            super(handler);
        }

        public void onChange(boolean z) {
            super.onChange(z);
            QuickLaunchSettings.this.refreshShortcuts();
        }
    }

    private synchronized void refreshShortcuts() {
        Cursor c = this.mBookmarksCursor;
        if (c != null) {
            if (c.requery()) {
                ShortcutPreference pref;
                SparseBooleanArray noLongerBookmarkedShortcuts = this.mBookmarkedShortcuts;
                SparseBooleanArray newBookmarkedShortcuts = new SparseBooleanArray();
                while (c.moveToNext()) {
                    char shortcut = Character.toLowerCase((char) c.getInt(0));
                    if (shortcut != 0) {
                        pref = getOrCreatePreference(shortcut);
                        CharSequence title = Bookmarks.getTitle(this, c);
                        String intentUri = c.getString(c.getColumnIndex("intent"));
                        PackageManager packageManager = getPackageManager();
                        try {
                            ResolveInfo resolveActivity = packageManager.resolveActivity(Intent.parseUri(intentUri, 0), 0);
                            if (resolveActivity != null) {
                                title = resolveActivity.loadLabel(packageManager);
                            }
                        } catch (URISyntaxException e) {
                        }
                        pref.setTitle(title);
                        pref.setSummary(getString(2131428526, new Object[]{String.valueOf(shortcut)}));
                        pref.setHasBookmark(true);
                        newBookmarkedShortcuts.put(shortcut, true);
                        if (noLongerBookmarkedShortcuts != null) {
                            noLongerBookmarkedShortcuts.put(shortcut, false);
                        }
                    }
                }
                if (noLongerBookmarkedShortcuts != null) {
                    for (int size = noLongerBookmarkedShortcuts.size() - 1; size >= 0; size--) {
                        if (noLongerBookmarkedShortcuts.valueAt(size)) {
                            pref = (ShortcutPreference) this.mShortcutToPreference.get((char) noLongerBookmarkedShortcuts.keyAt(size));
                            if (pref != null) {
                                pref.setHasBookmark(false);
                            }
                        }
                    }
                }
                this.mBookmarkedShortcuts = newBookmarkedShortcuts;
                c.deactivate();
            } else {
                Log.e("QuickLaunchSettings", "Could not requery cursor when refreshing shortcuts.");
            }
        }
    }

    private void initShortcutPreferences() {
        SparseBooleanArray shortcutSeen = new SparseBooleanArray();
        KeyCharacterMap keyMap = KeyCharacterMap.load(-1);
        for (int keyCode = KeyEvent.getMaxKeyCode() - 1; keyCode >= 0; keyCode--) {
            char toLowerCase = Character.toLowerCase(keyMap.getDisplayLabel(keyCode));
            if (!(toLowerCase == 0 || shortcutSeen.get(toLowerCase, false) || !Character.isLetterOrDigit(toLowerCase))) {
                shortcutSeen.put(toLowerCase, true);
                createPreference(toLowerCase);
            }
        }
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034136);
        this.mShortcutGroup = (PreferenceGroup) findPreference("shortcut_category");
        this.mShortcutToPreference = new SparseArray();
        this.mBookmarksObserver = new BookmarksObserver(this.mUiHandler);
        initShortcutPreferences();
        this.mBookmarksCursor = managedQuery(Bookmarks.CONTENT_URI, sProjection, null, null);
        getListView().setOnItemLongClickListener(this);
    }

    protected void onActivityResult(int i, int i2, Intent intent) {
        if (i2 == -1) {
            if (i != 1) {
                super.onActivityResult(i, i2, intent);
            } else if (intent == null) {
                Log.w("QuickLaunchSettings", "Result from bookmark picker does not have an intent.");
            } else {
                updateShortcut(intent.getCharExtra("com.jellybyn.settings.quicklaunch.SHORTCUT", 0), intent);
            }
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (!(preference instanceof ShortcutPreference)) {
            return false;
        }
        ShortcutPreference shortcutPreference = (ShortcutPreference) preference;
        Intent intent = new Intent(this, BookmarkPicker.class);
        intent.putExtra("com.jellybyn.settings.quicklaunch.SHORTCUT", shortcutPreference.getShortcut());
        startActivityForResult(intent, 1);
        return true;
    }

    private ShortcutPreference getOrCreatePreference(char c) {
        ShortcutPreference pref = (ShortcutPreference) this.mShortcutToPreference.get(c);
        if (pref != null) {
            return pref;
        }
        Log.w("QuickLaunchSettings", "Unknown shortcut '" + c + "', creating preference anyway");
        return createPreference(c);
    }

    private void showClearDialog(ShortcutPreference shortcutPreference) {
        if (shortcutPreference.hasBookmark()) {
            this.mClearDialogBookmarkTitle = shortcutPreference.getTitle();
            this.mClearDialogShortcut = shortcutPreference.getShortcut();
            showDialog(0);
        }
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (this.mClearDialogShortcut > 0 && i == -1) {
            clearShortcut(this.mClearDialogShortcut);
        }
        this.mClearDialogBookmarkTitle = null;
        this.mClearDialogShortcut = 0;
    }

    public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long j) {
        Preference preference = (Preference) getPreferenceScreen().getRootAdapter().getItem(i);
        if (!(preference instanceof ShortcutPreference)) {
            return false;
        }
        showClearDialog((ShortcutPreference) preference);
        return true;
    }

    protected void onPrepareDialog(int i, Dialog dialog) {
        switch (i) {
            case 0:
                ((AlertDialog) dialog).setMessage(getString(2131428528, new Object[]{Character.valueOf(this.mClearDialogShortcut), this.mClearDialogBookmarkTitle}));
                return;
            default:
                return;
        }
    }

    private ShortcutPreference createPreference(char c) {
        ShortcutPreference pref = new ShortcutPreference(this, c);
        this.mShortcutGroup.addPreference(pref);
        this.mShortcutToPreference.put(c, pref);
        return pref;
    }

    protected Dialog onCreateDialog(int i) {
        switch (i) {
            case 0:
                return new Builder(this).setTitle(getString(2131428527)).setIconAttribute(16843605).setMessage(getString(2131428528, new Object[]{Character.valueOf(this.mClearDialogShortcut), this.mClearDialogBookmarkTitle})).setPositiveButton(2131428529, this).setNegativeButton(2131428530, this).create();
            default:
                return super.onCreateDialog(i);
        }
    }

    protected void onRestoreInstanceState(Bundle bundle) {
        super.onRestoreInstanceState(bundle);
        this.mClearDialogBookmarkTitle = bundle.getString("CLEAR_DIALOG_BOOKMARK_TITLE");
        this.mClearDialogShortcut = (char) bundle.getInt("CLEAR_DIALOG_SHORTCUT", 0);
    }

    protected void onResume() {
        super.onResume();
        getContentResolver().registerContentObserver(Bookmarks.CONTENT_URI, true, this.mBookmarksObserver);
        refreshShortcuts();
    }

    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putCharSequence("CLEAR_DIALOG_BOOKMARK_TITLE", this.mClearDialogBookmarkTitle);
        bundle.putInt("CLEAR_DIALOG_SHORTCUT", this.mClearDialogShortcut);
    }

    protected void onPause() {
        super.onPause();
        getContentResolver().unregisterContentObserver(this.mBookmarksObserver);
    }

    private void clearShortcut(char c) {
        getContentResolver().delete(Bookmarks.CONTENT_URI, "shortcut=?", new String[]{String.valueOf(c)});
    }

    private void updateShortcut(char c, Intent intent) {
        Bookmarks.add(getContentResolver(), intent, "", "@quicklaunch", c, 0);
    }
}