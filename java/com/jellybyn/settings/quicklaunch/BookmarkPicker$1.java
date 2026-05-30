package com.jellybyn.settings.quicklaunch;

import android.content.pm.ResolveInfo.DisplayNameComparator;
import java.util.ArrayList;
import java.util.Collections;

class BookmarkPicker$1 extends Thread {
    final /* synthetic */ BookmarkPicker this$0;

    public void run() {
        synchronized (this.this$0) {
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            BookmarkPicker.access$000(this.this$0, arrayList);
            Collections.sort(arrayList, new DisplayNameComparator(this.this$0.getPackageManager()));
            BookmarkPicker.access$100(this.this$0, arrayList2, arrayList);
            BookmarkPicker.access$200(this.this$0, arrayList2, arrayList);
        }
    }

    BookmarkPicker$1(BookmarkPicker bookmarkPicker, String str) {
        this.this$0 = bookmarkPicker;
        super(str);
    }
}