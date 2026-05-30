package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;
import com.jellybyn.settings.DreamBackend.DreamInfo;
import com.jellybyn.settings.DreamSettings.DreamInfoAdapter;

class DreamSettings$DreamInfoAdapter$3 implements OnClickListener {
    final /* synthetic */ DreamInfoAdapter this$1;
    final /* synthetic */ View val$row;

    public void onClick(View view) {
        view.setPressed(true);
        DreamInfoAdapter.access$500(this.this$1, (DreamInfo) this.val$row.getTag());
    }

    DreamSettings$DreamInfoAdapter$3(DreamInfoAdapter dreamInfoAdapter, View view) {
        this.this$1 = dreamInfoAdapter;
        this.val$row = view;
    }
}