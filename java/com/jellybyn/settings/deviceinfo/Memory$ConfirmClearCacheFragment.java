package com.jellybyn.settings.deviceinfo;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.os.Bundle;

public class Memory$ConfirmClearCacheFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle bundle) {
        Context context = getActivity();
        Builder builder = new Builder(context);
        builder.setTitle(2131428134);
        builder.setMessage(getString(2131428135));
        builder.setPositiveButton(17039370, new 1(this, context));
        builder.setNegativeButton(17039360, null);
        return builder.create();
    }

    public static void show(Memory memory) {
        if (memory.isAdded()) {
            Memory$ConfirmClearCacheFragment dialog = new Memory$ConfirmClearCacheFragment();
            dialog.setTargetFragment(memory, 0);
            dialog.show(memory.getFragmentManager(), "confirmClearCache");
        }
    }
}