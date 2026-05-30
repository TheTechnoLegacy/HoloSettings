package com.jellybyn.settings;

import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import com.jellybyn.settings.DreamSettings.DreamInfoAdapter;

class DreamSettings$DreamInfoAdapter$1 implements OnTouchListener {
    final /* synthetic */ DreamInfoAdapter this$1;
    final /* synthetic */ View val$row;

    public boolean onTouch(View view, MotionEvent motionEvent) {
        this.val$row.onTouchEvent(motionEvent);
        return false;
    }

    DreamSettings$DreamInfoAdapter$1(DreamInfoAdapter dreamInfoAdapter, View view) {
        this.this$1 = dreamInfoAdapter;
        this.val$row = view;
    }
}