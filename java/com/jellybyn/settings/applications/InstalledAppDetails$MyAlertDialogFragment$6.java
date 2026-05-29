package com.jellybyn.settings.applications;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.applications.InstalledAppDetails.DisableChanger;
import com.jellybyn.settings.applications.InstalledAppDetails.MyAlertDialogFragment;

class InstalledAppDetails$MyAlertDialogFragment$6 implements OnClickListener {
    final /* synthetic */ MyAlertDialogFragment this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        new DisableChanger(this.this$0.getOwner(), InstalledAppDetails.access$100(this.this$0.getOwner()).info, 3).execute(new Object[]{null});
    }

    InstalledAppDetails$MyAlertDialogFragment$6(MyAlertDialogFragment myAlertDialogFragment) {
        this.this$0 = myAlertDialogFragment;
    }
}