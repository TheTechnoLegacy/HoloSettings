package com.jellybyn.settings.quicklaunch;

import java.util.ArrayList;

class BookmarkPicker$2 implements Runnable {
    final /* synthetic */ BookmarkPicker this$0;
    final /* synthetic */ ArrayList val$newAdapterList;
    final /* synthetic */ ArrayList val$newResolveList;

    public void run() {
        BookmarkPicker.access$302(this.this$0, BookmarkPicker.access$400(this.this$0, this.val$newAdapterList));
        BookmarkPicker.access$502(this.this$0, this.val$newResolveList);
        this.this$0.setListAdapter(BookmarkPicker.access$300(this.this$0));
    }

    BookmarkPicker$2(BookmarkPicker bookmarkPicker, ArrayList arrayList, ArrayList arrayList2) {
        this.this$0 = bookmarkPicker;
        this.val$newAdapterList = arrayList;
        this.val$newResolveList = arrayList2;
    }
}