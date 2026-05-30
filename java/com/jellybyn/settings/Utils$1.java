package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class Utils$1 implements OnClickListener {
    final /* synthetic */ Runnable val$positiveAction;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.val$positiveAction.run();
    }

    Utils$1(Runnable runnable) {
        this.val$positiveAction = runnable;
    }
}