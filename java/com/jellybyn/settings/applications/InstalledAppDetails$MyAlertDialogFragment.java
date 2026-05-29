package com.jellybyn.settings.applications;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.os.Bundle;

public class InstalledAppDetails$MyAlertDialogFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle bundle) {
        int id = getArguments().getInt("id");
        int moveErrorCode = getArguments().getInt("moveError");
        switch (id) {
            case 1:
                return new Builder(getActivity()).setTitle(getActivity().getText(2131428387)).setIconAttribute(16843605).setMessage(getActivity().getText(2131428388)).setPositiveButton(2131428389, new 1(this)).setNegativeButton(2131428390, null).create();
            case 2:
                return new Builder(getActivity()).setTitle(getActivity().getText(2131428394)).setIconAttribute(16843605).setMessage(getActivity().getText(2131428395)).setPositiveButton(2131428389, new 1(this)).setNegativeButton(2131428390, null).create();
            case 3:
                return new Builder(getActivity()).setTitle(getActivity().getText(2131428391)).setIconAttribute(16843605).setMessage(getActivity().getText(2131428391)).setNeutralButton(getActivity().getText(2131428389), new 1(this)).create();
            case 4:
                return new Builder(getActivity()).setTitle(getActivity().getText(2131428396)).setIconAttribute(16843605).setMessage(getActivity().getText(2131428397)).setNeutralButton(2131428389, new 1(this)).create();
            case 5:
                return new Builder(getActivity()).setTitle(getActivity().getText(2131428419)).setIconAttribute(16843605).setMessage(getActivity().getText(2131428420)).setPositiveButton(2131428389, new 1(this)).setNegativeButton(2131428390, null).create();
            case 6:
                return new Builder(getActivity()).setTitle(getActivity().getText(2131428421)).setIconAttribute(16843605).setMessage(getActivity().getString(2131428422, new Object[]{InstalledAppDetails.access$1000(getOwner(), moveErrorCode)})).setNeutralButton(2131428389, null).create();
            case 7:
                return new Builder(getActivity()).setTitle(getActivity().getText(2131428425)).setIconAttribute(16843605).setMessage(getActivity().getText(2131428426)).setPositiveButton(2131428389, new 1(this)).setNegativeButton(2131428390, null).create();
            case 8:
                return new Builder(getActivity()).setTitle(getActivity().getText(2131428429)).setIconAttribute(16843605).setMessage(getActivity().getText(2131428430)).setPositiveButton(2131428389, new 1(this)).setNegativeButton(2131428390, new 1(this)).create();
            case 9:
                return new Builder(getActivity()).setTitle(getActivity().getText(2131428427)).setIconAttribute(16843605).setMessage(getActivity().getText(2131428428)).setPositiveButton(2131428389, new 1(this)).setNegativeButton(2131428390, null).create();
            default:
                throw new IllegalArgumentException("unknown id " + id);
        }
    }

    public static InstalledAppDetails$MyAlertDialogFragment newInstance(int i, int i2) {
        InstalledAppDetails$MyAlertDialogFragment frag = new InstalledAppDetails$MyAlertDialogFragment();
        Bundle args = new Bundle();
        args.putInt("id", i);
        args.putInt("moveError", i2);
        frag.setArguments(args);
        return frag;
    }

    InstalledAppDetails getOwner() {
        return (InstalledAppDetails) getTargetFragment();
    }
}