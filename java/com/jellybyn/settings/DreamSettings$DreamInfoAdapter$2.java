package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;
import com.jellybyn.settings.DreamBackend.DreamInfo;
import com.jellybyn.settings.DreamSettings.DreamInfoAdapter;

class DreamSettings$DreamInfoAdapter$2 implements OnClickListener {
    final /* synthetic */ DreamInfoAdapter this$1;
    final /* synthetic */ View val$row;

    public void onClick(View view) {
        DreamSettings.access$200(this.this$1.this$0).launchSettings((DreamInfo) this.val$row.getTag());
    }

    DreamSettings$DreamInfoAdapter$2(DreamInfoAdapter dreamInfoAdapter, View view) {
        this.this$1 = dreamInfoAdapter;
        this.val$row = view;
    }
}