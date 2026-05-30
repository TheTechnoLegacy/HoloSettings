package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.os.Bundle;

public class DataUsageSummary$ConfirmDataRoamingFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle bundle) {
        Context context = getActivity();
        Builder builder = new Builder(context);
        builder.setTitle(2131427577);
        if (Utils.hasMultipleUsers(context)) {
            builder.setMessage(2131427576);
        } else {
            builder.setMessage(2131427575);
        }
        builder.setPositiveButton(17039370, new 1(this));
        builder.setNegativeButton(17039360, null);
        return builder.create();
    }

    public static void show(DataUsageSummary dataUsageSummary) {
        if (dataUsageSummary.isAdded()) {
            DataUsageSummary$ConfirmDataRoamingFragment dialog = new DataUsageSummary$ConfirmDataRoamingFragment();
            dialog.setTargetFragment(dataUsageSummary, 0);
            dialog.show(dataUsageSummary.getFragmentManager(), "confirmDataRoaming");
        }
    }
}