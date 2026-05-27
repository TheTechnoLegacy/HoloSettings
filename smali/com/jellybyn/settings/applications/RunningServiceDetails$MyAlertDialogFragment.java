package com.jellybyn.settings.applications;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.ComponentName;
import android.os.Bundle;

public class RunningServiceDetails$MyAlertDialogFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle bundle) {
        int id = getArguments().getInt("id");
        switch (id) {
            case 1:
                ComponentName comp = (ComponentName) getArguments().getParcelable("comp");
                return getOwner().activeDetailForService(comp) == null ? null : new Builder(getActivity()).setTitle(getActivity().getString(2131428466)).setIconAttribute(16843605).setMessage(getActivity().getString(2131428467)).setPositiveButton(2131428389, new 1(this, comp)).setNegativeButton(2131428390, null).create();
            default:
                throw new IllegalArgumentException("unknown id " + id);
        }
    }

    public static RunningServiceDetails$MyAlertDialogFragment newConfirmStop(int i, ComponentName componentName) {
        RunningServiceDetails$MyAlertDialogFragment frag = new RunningServiceDetails$MyAlertDialogFragment();
        Bundle args = new Bundle();
        args.putInt("id", i);
        args.putParcelable("comp", componentName);
        frag.setArguments(args);
        return frag;
    }

    RunningServiceDetails getOwner() {
        return (RunningServiceDetails) getTargetFragment();
    }
}