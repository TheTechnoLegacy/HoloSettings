package com.jellybyn.settings;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;

class CredentialStorage$ResetDialog implements OnClickListener, OnDismissListener {
    private boolean mResetConfirmed;
    final /* synthetic */ CredentialStorage this$0;

    private CredentialStorage$ResetDialog(CredentialStorage credentialStorage) {
        this.this$0 = credentialStorage;
        AlertDialog dialog = new Builder(credentialStorage).setTitle(17039380).setIconAttribute(16843605).setMessage(2131428772).setPositiveButton(17039370, this).setNegativeButton(17039360, this).create();
        dialog.setOnDismissListener(this);
        dialog.show();
    }

    public void onDismiss(DialogInterface dialogInterface) {
        if (this.mResetConfirmed) {
            this.mResetConfirmed = false;
            new CredentialStorage$ResetDialog(this.this$0).execute(new Void[0]);
            return;
        }
        this.this$0.finish();
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        this.mResetConfirmed = i == -1;
    }
}