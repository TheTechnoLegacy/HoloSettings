package com.jellybyn.settings;

import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.DataUsageSummary.ConfirmAutoSyncChangeFragment;

class DataUsageSummary$ConfirmAutoSyncChangeFragment$1 implements OnClickListener {
    final /* synthetic */ ConfirmAutoSyncChangeFragment this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        ContentResolver.setMasterSyncAutomatically(ConfirmAutoSyncChangeFragment.access$2900(this.this$0));
    }

    DataUsageSummary$ConfirmAutoSyncChangeFragment$1(ConfirmAutoSyncChangeFragment confirmAutoSyncChangeFragment) {
        this.this$0 = confirmAutoSyncChangeFragment;
    }
}