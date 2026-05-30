package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.os.Bundle;

public class DataUsageSummary$ConfirmRestrictFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle bundle) {
        Context context = getActivity();
        Builder builder = new Builder(context);
        builder.setTitle(2131428997);
        if (Utils.hasMultipleUsers(context)) {
            builder.setMessage(2131428999);
        } else {
            builder.setMessage(2131428998);
        }
        builder.setPositiveButton(17039370, new 1(this));
        builder.setNegativeButton(17039360, null);
        return builder.create();
    }

    public static void show(DataUsageSummary dataUsageSummary) {
        if (dataUsageSummary.isAdded()) {
            DataUsageSummary$ConfirmRestrictFragment dialog = new DataUsageSummary$ConfirmRestrictFragment();
            dialog.setTargetFragment(dataUsageSummary, 0);
            dialog.show(dataUsageSummary.getFragmentManager(), "confirmRestrict");
        }
    }
}