package com.jellybyn.settings;

import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;

class DreamSettings$1 implements OnCheckedChangeListener {
    final /* synthetic */ DreamSettings this$0;

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        if (!DreamSettings.access$100(this.this$0)) {
            DreamSettings.access$200(this.this$0).setEnabled(z);
            DreamSettings.access$300(this.this$0);
        }
    }

    DreamSettings$1(DreamSettings dreamSettings) {
        this.this$0 = dreamSettings;
    }
}