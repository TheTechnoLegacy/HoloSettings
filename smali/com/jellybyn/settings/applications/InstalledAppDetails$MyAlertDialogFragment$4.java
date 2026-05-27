package com.jellybyn.settings.applications;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.applications.InstalledAppDetails.MyAlertDialogFragment;

class InstalledAppDetails$MyAlertDialogFragment$4 implements OnClickListener {
    final /* synthetic */ MyAlertDialogFragment this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        InstalledAppDetails.access$800(this.this$0.getOwner()).setEnabled(false);
        InstalledAppDetails.access$700(this.this$0.getOwner(), false, false);
    }

    InstalledAppDetails$MyAlertDialogFragment$4(MyAlertDialogFragment myAlertDialogFragment) {
        this.this$0 = myAlertDialogFragment;
    }
}