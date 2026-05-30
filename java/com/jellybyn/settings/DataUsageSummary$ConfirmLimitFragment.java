package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;

public class DataUsageSummary$ConfirmLimitFragment extends DialogFragment {
    public static void show(DataUsageSummary dataUsageSummary) {
        if (dataUsageSummary.isAdded()) {
            CharSequence string;
            long max;
            Resources res = dataUsageSummary.getResources();
            long minLimitBytes = (long) (((float) DataUsageSummary.access$2700(dataUsageSummary).getPolicy(DataUsageSummary.access$2600(dataUsageSummary)).warningBytes) * 1.2f);
            String currentTab = DataUsageSummary.access$400(dataUsageSummary);
            if ("3g".equals(currentTab)) {
                string = res.getString(2131428996);
                max = Math.max(5368709120L, minLimitBytes);
            } else if ("4g".equals(currentTab)) {
                string = res.getString(2131428996);
                max = Math.max(5368709120L, minLimitBytes);
            } else if ("mobile".equals(currentTab)) {
                string = res.getString(2131428996);
                max = Math.max(5368709120L, minLimitBytes);
            } else {
                throw new IllegalArgumentException("unknown current tab: " + currentTab);
            }
            Bundle bundle = new Bundle();
            bundle.putCharSequence("message", string);
            bundle.putLong("limitBytes", max);
            DataUsageSummary$ConfirmLimitFragment dataUsageSummary$ConfirmLimitFragment = new DataUsageSummary$ConfirmLimitFragment();
            dataUsageSummary$ConfirmLimitFragment.setArguments(bundle);
            dataUsageSummary$ConfirmLimitFragment.setTargetFragment(dataUsageSummary, 0);
            dataUsageSummary$ConfirmLimitFragment.show(dataUsageSummary.getFragmentManager(), "confirmLimit");
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        Context context = getActivity();
        CharSequence message = getArguments().getCharSequence("message");
        long limitBytes = getArguments().getLong("limitBytes");
        Builder builder = new Builder(context);
        builder.setTitle(2131428995);
        builder.setMessage(message);
        builder.setPositiveButton(17039370, new 1(this, limitBytes));
        return builder.create();
    }
}