package com.jellybyn.settings.applications;

import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.applications.RunningServiceDetails.ActiveDetail;
import com.jellybyn.settings.applications.RunningServiceDetails.MyAlertDialogFragment;

class RunningServiceDetails$MyAlertDialogFragment$1 implements OnClickListener {
    final /* synthetic */ MyAlertDialogFragment this$0;
    final /* synthetic */ ComponentName val$comp;

    public void onClick(DialogInterface dialogInterface, int i) {
        ActiveDetail ad = this.this$0.getOwner().activeDetailForService(this.val$comp);
        if (ad != null) {
            ad.stopActiveService(true);
        }
    }

    RunningServiceDetails$MyAlertDialogFragment$1(MyAlertDialogFragment myAlertDialogFragment, ComponentName componentName) {
        this.this$0 = myAlertDialogFragment;
        this.val$comp = componentName;
    }
}