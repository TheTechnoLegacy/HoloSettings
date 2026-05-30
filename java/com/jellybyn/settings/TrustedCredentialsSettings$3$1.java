package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.TrustedCredentialsSettings.3;
import com.jellybyn.settings.TrustedCredentialsSettings.AliasOperation;

class TrustedCredentialsSettings$3$1 implements OnClickListener {
    final /* synthetic */ 3 this$1;

    public void onClick(DialogInterface dialogInterface, int i) {
        new AliasOperation(this.this$1.this$0, this.this$1.val$certHolder, null).execute(new Void[0]);
        dialogInterface.dismiss();
        this.this$1.val$certDialog.dismiss();
    }

    TrustedCredentialsSettings$3$1(3 3) {
        this.this$1 = 3;
    }
}