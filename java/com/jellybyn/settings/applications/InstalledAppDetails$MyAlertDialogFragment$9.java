package com.jellybyn.settings.applications;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.applications.InstalledAppDetails.MyAlertDialogFragment;

class InstalledAppDetails$MyAlertDialogFragment$9 implements OnClickListener {
    final /* synthetic */ MyAlertDialogFragment this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        InstalledAppDetails.access$600(this.this$0.getOwner(), InstalledAppDetails.access$100(this.this$0.getOwner()).info.packageName, false, true);
    }

    InstalledAppDetails$MyAlertDialogFragment$9(MyAlertDialogFragment myAlertDialogFragment) {
        this.this$0 = myAlertDialogFragment;
    }
}