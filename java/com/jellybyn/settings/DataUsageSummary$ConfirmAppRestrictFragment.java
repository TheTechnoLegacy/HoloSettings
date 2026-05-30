package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.os.Bundle;

public class DataUsageSummary$ConfirmAppRestrictFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle bundle) {
        Builder builder = new Builder(getActivity());
        builder.setTitle(2131428983);
        builder.setMessage(2131428984);
        builder.setPositiveButton(17039370, new 1(this));
        builder.setNegativeButton(17039360, null);
        return builder.create();
    }

    public static void show(DataUsageSummary dataUsageSummary) {
        if (dataUsageSummary.isAdded()) {
            DataUsageSummary$ConfirmAppRestrictFragment dialog = new DataUsageSummary$ConfirmAppRestrictFragment();
            dialog.setTargetFragment(dataUsageSummary, 0);
            dialog.show(dataUsageSummary.getFragmentManager(), "confirmAppRestrict");
        }
    }
}