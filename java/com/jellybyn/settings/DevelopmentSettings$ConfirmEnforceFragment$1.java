package com.jellybyn.settings;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.DevelopmentSettings.ConfirmEnforceFragment;

class DevelopmentSettings$ConfirmEnforceFragment$1 implements OnClickListener {
    final /* synthetic */ ConfirmEnforceFragment this$0;
    final /* synthetic */ Context val$context;

    public void onClick(DialogInterface dialogInterface, int i) {
        DevelopmentSettings.access$000(this.val$context, "android.permission.READ_EXTERNAL_STORAGE", true);
        DevelopmentSettings.access$100((DevelopmentSettings) this.this$0.getTargetFragment());
    }

    DevelopmentSettings$ConfirmEnforceFragment$1(ConfirmEnforceFragment confirmEnforceFragment, Context context) {
        this.this$0 = confirmEnforceFragment;
        this.val$context = context;
    }
}