package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.View;

public class BugreportPreference extends DialogPreference {
    protected void onPrepareDialogBuilder(Builder builder) {
        super.onPrepareDialogBuilder(builder);
        builder.setPositiveButton(17040388, this);
        builder.setMessage(17039603);
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (i == -1) {
            SystemProperties.set("ctl.start", "bugreport");
        }
    }

    public BugreportPreference(Context context, AttributeSet attributeSet) {
    }

    protected void onBindDialogView(View view) {
        super.onBindDialogView(view);
    }

    protected void onDialogClosed(boolean z) {
        super.onDialogClosed(z);
    }

    protected void showDialog(Bundle bundle) {
        super.showDialog(bundle);
    }
}