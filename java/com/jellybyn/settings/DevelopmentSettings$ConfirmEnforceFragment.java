package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.os.Bundle;

public class DevelopmentSettings$ConfirmEnforceFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle bundle) {
        Context context = getActivity();
        Builder builder = new Builder(context);
        builder.setTitle(2131428573);
        builder.setMessage(2131428574);
        builder.setPositiveButton(17039370, new 1(this, context));
        builder.setNegativeButton(17039360, new 2(this));
        return builder.create();
    }

    public static void show(DevelopmentSettings developmentSettings) {
        DevelopmentSettings$ConfirmEnforceFragment dialog = new DevelopmentSettings$ConfirmEnforceFragment();
        dialog.setTargetFragment(developmentSettings, 0);
        dialog.show(developmentSettings.getFragmentManager(), "confirm_enforce");
    }
}