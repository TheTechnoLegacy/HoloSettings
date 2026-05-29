package com.jellybyn.settings.wifi;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.os.Bundle;

public class WifiScanModeActivity$AlertDialogFragment extends DialogFragment {
    private final String mApp;

    public WifiScanModeActivity$AlertDialogFragment() {
        this.mApp = null;
    }

    public WifiScanModeActivity$AlertDialogFragment(String str) {
        this.mApp = str;
    }

    static WifiScanModeActivity$AlertDialogFragment newInstance(String str) {
        return new WifiScanModeActivity$AlertDialogFragment(str);
    }

    public void onCancel(DialogInterface dialogInterface) {
        WifiScanModeActivity.access$000((WifiScanModeActivity) getActivity());
    }

    public Dialog onCreateDialog(Bundle bundle) {
        return new Builder(getActivity()).setMessage(getString(2131427896, new Object[]{this.mApp})).setPositiveButton(2131427897, new 2(this)).setNegativeButton(2131427898, new 1(this)).create();
    }
}