package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.os.Bundle;

public class DataUsageSummary$ConfirmDataDisableFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle bundle) {
        Builder builder = new Builder(getActivity());
        builder.setMessage(2131428964);
        builder.setPositiveButton(17039370, new 1(this));
        builder.setNegativeButton(17039360, null);
        return builder.create();
    }

    public static void show(DataUsageSummary dataUsageSummary) {
        if (dataUsageSummary.isAdded()) {
            DataUsageSummary$ConfirmDataDisableFragment dialog = new DataUsageSummary$ConfirmDataDisableFragment();
            dialog.setTargetFragment(dataUsageSummary, 0);
            dialog.show(dataUsageSummary.getFragmentManager(), "confirmDataDisable");
        }
    }
}