package com.jellybyn.settings.bluetooth;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;

public final class BluetoothVisibilityTimeoutFragment extends DialogFragment implements OnClickListener {
    private final BluetoothDiscoverableEnabler mDiscoverableEnabler = LocalBluetoothManager.getInstance(getActivity()).getDiscoverableEnabler();

    public void onClick(DialogInterface dialogInterface, int i) {
        this.mDiscoverableEnabler.setDiscoverableTimeout(i);
        dismiss();
    }

    public Dialog onCreateDialog(Bundle bundle) {
        return new Builder(getActivity()).setTitle(2131427426).setSingleChoiceItems(2131165208, this.mDiscoverableEnabler.getDiscoverableTimeoutIndex(), this).setNegativeButton(17039360, null).create();
    }
}