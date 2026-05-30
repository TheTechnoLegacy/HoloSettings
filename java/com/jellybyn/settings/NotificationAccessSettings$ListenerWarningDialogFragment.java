package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.ComponentName;
import android.os.Bundle;

public class NotificationAccessSettings$ListenerWarningDialogFragment extends DialogFragment {
    final /* synthetic */ NotificationAccessSettings this$0;

    public Dialog onCreateDialog(Bundle bundle) {
        super.onCreate(bundle);
        Bundle args = getArguments();
        String label = args.getString("l");
        ComponentName cn = ComponentName.unflattenFromString(args.getString("c"));
        return new Builder(getActivity()).setMessage(getResources().getString(2131427693, new Object[]{label})).setTitle(getResources().getString(2131427692, new Object[]{label})).setIconAttribute(16843605).setCancelable(true).setPositiveButton(17039370, new 2(this, cn)).setNegativeButton(17039360, new 1(this)).create();
    }

    public NotificationAccessSettings$ListenerWarningDialogFragment setListenerInfo(ComponentName componentName, String str) {
        Bundle args = new Bundle();
        args.putString("c", componentName.flattenToString());
        args.putString("l", str);
        setArguments(args);
        return this;
    }

    public NotificationAccessSettings$ListenerWarningDialogFragment(NotificationAccessSettings notificationAccessSettings) {
        this.this$0 = notificationAccessSettings;
    }
}