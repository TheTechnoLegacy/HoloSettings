package com.jellybyn.settings;

import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.android.internal.os.storage.ExternalStorageFormatter;

class MasterClearConfirm$1 implements OnClickListener {
    final /* synthetic */ MasterClearConfirm this$0;

    public void onClick(View view) {
        if (!Utils.isMonkeyRunning()) {
            if (MasterClearConfirm.access$000(this.this$0)) {
                Intent intent = new Intent("com.android.internal.os.storage.FORMAT_AND_FACTORY_RESET");
                intent.setComponent(ExternalStorageFormatter.COMPONENT_NAME);
                this.this$0.getActivity().startService(intent);
                return;
            }
            this.this$0.getActivity().sendBroadcast(new Intent("android.intent.action.MASTER_CLEAR"));
        }
    }

    MasterClearConfirm$1(MasterClearConfirm masterClearConfirm) {
        this.this$0 = masterClearConfirm;
    }
}