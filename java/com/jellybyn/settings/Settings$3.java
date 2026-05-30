package com.jellybyn.settings;

import android.preference.PreferenceActivity.Header;
import java.util.Comparator;

class Settings$3 implements Comparator<Header> {
    final /* synthetic */ Settings this$0;

    Settings$3(Settings settings) {
        this.this$0 = settings;
    }

    public int compare(Header header, Header header2) {
        return header.title.toString().compareTo(header2.title.toString());
    }
}