package com.jellybyn.settings;

import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.jellybyn.settings.NotificationAccessSettings.ListenerWarningDialogFragment;

class NotificationAccessSettings$ListenerWarningDialogFragment$2 implements OnClickListener {
    final /* synthetic */ ListenerWarningDialogFragment this$1;
    final /* synthetic */ ComponentName val$cn;

    public void onClick(DialogInterface dialogInterface, int i) {
        NotificationAccessSettings.access$000(this.this$1.this$0).add(this.val$cn);
        this.this$1.this$0.saveEnabledListeners();
    }

    NotificationAccessSettings$ListenerWarningDialogFragment$2(ListenerWarningDialogFragment listenerWarningDialogFragment, ComponentName componentName) {
        this.this$1 = listenerWarningDialogFragment;
        this.val$cn = componentName;
    }
}