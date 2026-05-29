package com.jellybyn.settings;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;

class CredentialStorage$ConfigureKeyGuardDialog implements OnClickListener, OnDismissListener {
    private boolean mConfigureConfirmed;
    final /* synthetic */ CredentialStorage this$0;

    public void onDismiss(DialogInterface dialogInterface) {
        if (this.mConfigureConfirmed) {
            this.mConfigureConfirmed = false;
            Intent intent = new Intent("android.app.action.SET_NEW_PASSWORD");
            intent.putExtra("minimum_quality", 65536);
            this.this$0.startActivity(intent);
            return;
        }
        this.this$0.finish();
    }

    private CredentialStorage$ConfigureKeyGuardDialog(CredentialStorage credentialStorage) {
        this.this$0 = credentialStorage;
        AlertDialog dialog = new Builder(credentialStorage).setTitle(17039380).setIconAttribute(16843605).setMessage(2131428780).setPositiveButton(17039370, this).setNegativeButton(17039360, this).create();
        dialog.setOnDismissListener(this);
        dialog.show();
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        this.mConfigureConfirmed = i == -1;
    }
}