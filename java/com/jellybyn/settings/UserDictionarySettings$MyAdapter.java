package com.jellybyn.settings;

import android.content.Context;
import android.database.Cursor;
import android.widget.AlphabetIndexer;
import android.widget.SectionIndexer;
import android.widget.SimpleCursorAdapter;
import android.widget.SimpleCursorAdapter.ViewBinder;

class UserDictionarySettings$MyAdapter extends SimpleCursorAdapter implements SectionIndexer {
    private AlphabetIndexer mIndexer;
    private ViewBinder mViewBinder = new 1(this);

    public UserDictionarySettings$MyAdapter(Context context, int i, Cursor cursor, String[] strArr, int[] iArr, UserDictionarySettings userDictionarySettings) {
        super(context, i, cursor, strArr, iArr);
        if (cursor != null) {
            this.mIndexer = new AlphabetIndexer(cursor, cursor.getColumnIndexOrThrow("word"), context.getString(17040513));
        }
        setViewBinder(this.mViewBinder);
    }

    public int getPositionForSection(int i) {
        return this.mIndexer == null ? 0 : this.mIndexer.getPositionForSection(i);
    }

    public int getSectionForPosition(int i) {
        return this.mIndexer == null ? 0 : this.mIndexer.getSectionForPosition(i);
    }

    public Object[] getSections() {
        return this.mIndexer == null ? null : this.mIndexer.getSections();
    }
}