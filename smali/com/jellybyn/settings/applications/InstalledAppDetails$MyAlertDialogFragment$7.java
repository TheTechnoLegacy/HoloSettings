package com.jellybyn.settings.applications;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.applications.InstalledAppDetails.MyAlertDialogFragment;

class InstalledAppDetails$MyAlertDialogFragment$7 implements OnClickListener {
    final /* synthetic */ MyAlertDialogFragment this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        InstalledAppDetails.access$1100(this.this$0.getOwner()).setChecked(true);
    }

    InstalledAppDetails$MyAlertDialogFragment$7(MyAlertDialogFragment myAlertDialogFragment) {
        this.this$0 = myAlertDialogFragment;
    }
}