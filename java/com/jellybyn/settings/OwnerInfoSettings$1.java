package com.jellybyn.settings;

import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;

class OwnerInfoSettings$1 implements OnCheckedChangeListener {
    final /* synthetic */ OwnerInfoSettings this$0;

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        OwnerInfoSettings.access$000(this.this$0).setOwnerInfoEnabled(z);
        OwnerInfoSettings.access$100(this.this$0).setEnabled(z);
    }

    OwnerInfoSettings$1(OwnerInfoSettings ownerInfoSettings) {
        this.this$0 = ownerInfoSettings;
    }
}