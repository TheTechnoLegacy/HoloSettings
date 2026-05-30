package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.os.Bundle;

public class DataUsageSummary$ConfirmAutoSyncChangeFragment extends DialogFragment {
    private boolean mEnabling;

    public Dialog onCreateDialog(Bundle bundle) {
        Context context = getActivity();
        if (bundle != null) {
            this.mEnabling = bundle.getBoolean("enabling");
        }
        Builder builder = new Builder(context);
        if (this.mEnabling) {
            builder.setTitle(2131428986);
            builder.setMessage(2131428987);
        } else {
            builder.setTitle(2131428988);
            builder.setMessage(2131428989);
        }
        builder.setPositiveButton(17039370, new 1(this));
        builder.setNegativeButton(17039360, null);
        return builder.create();
    }

    public static void show(DataUsageSummary dataUsageSummary, boolean z) {
        if (dataUsageSummary.isAdded()) {
            DataUsageSummary$ConfirmAutoSyncChangeFragment dialog = new DataUsageSummary$ConfirmAutoSyncChangeFragment();
            dialog.mEnabling = z;
            dialog.setTargetFragment(dataUsageSummary, 0);
            dialog.show(dataUsageSummary.getFragmentManager(), "confirmAutoSyncChange");
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("enabling", this.mEnabling);
    }
}