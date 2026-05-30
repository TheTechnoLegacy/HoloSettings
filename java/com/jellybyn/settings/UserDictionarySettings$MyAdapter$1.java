package com.jellybyn.settings;

import android.database.Cursor;
import android.text.TextUtils;
import android.view.View;
import android.widget.SimpleCursorAdapter.ViewBinder;
import android.widget.TextView;
import com.jellybyn.settings.UserDictionarySettings.MyAdapter;

class UserDictionarySettings$MyAdapter$1 implements ViewBinder {
    final /* synthetic */ MyAdapter this$0;

    public boolean setViewValue(View view, Cursor cursor, int i) {
        if (i != 2) {
            return false;
        }
        String string = cursor.getString(2);
        if (TextUtils.isEmpty(string)) {
            view.setVisibility(8);
        } else {
            ((TextView) view).setText(string);
            view.setVisibility(0);
        }
        view.invalidate();
        return true;
    }

    UserDictionarySettings$MyAdapter$1(MyAdapter myAdapter) {
        this.this$0 = myAdapter;
    }
}