package com.jellybyn.settings.bluetooth;

import android.app.AlertDialog;
import android.app.Dialog;
import android.text.Editable;
import android.text.TextWatcher;

class DeviceProfilesSettings$RenameEditTextPreference implements TextWatcher {
    final /* synthetic */ DeviceProfilesSettings this$0;

    public void afterTextChanged(Editable editable) {
        Dialog dialog = DeviceProfilesSettings.access$000(this.this$0).getDialog();
        if (dialog instanceof AlertDialog) {
            ((AlertDialog) dialog).getButton(-1).setEnabled(editable.length() > 0);
        }
    }

    private DeviceProfilesSettings$RenameEditTextPreference(DeviceProfilesSettings deviceProfilesSettings) {
        this.this$0 = deviceProfilesSettings;
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}