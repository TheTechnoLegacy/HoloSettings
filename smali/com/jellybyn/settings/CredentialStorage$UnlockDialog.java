package com.jellybyn.settings;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

class CredentialStorage$UnlockDialog implements OnClickListener, OnDismissListener, TextWatcher {
    private final Button mButton;
    private final TextView mError;
    private final TextView mOldPassword;
    private boolean mUnlockConfirmed;
    final /* synthetic */ CredentialStorage this$0;

    private CredentialStorage$UnlockDialog(CredentialStorage credentialStorage) {
        CharSequence text;
        this.this$0 = credentialStorage;
        View view = View.inflate(credentialStorage, 2130968601, null);
        if (CredentialStorage.access$500(credentialStorage) == -1) {
            text = credentialStorage.getResources().getText(2131428770);
        } else if (CredentialStorage.access$500(credentialStorage) > 3) {
            text = credentialStorage.getResources().getText(2131428774);
        } else if (CredentialStorage.access$500(credentialStorage) == 1) {
            text = credentialStorage.getResources().getText(2131428775);
        } else {
            text = credentialStorage.getString(2131428776, new Object[]{Integer.valueOf(CredentialStorage.access$500(credentialStorage))});
        }
        ((TextView) view.findViewById(2131230770)).setText(text);
        this.mOldPassword = (TextView) view.findViewById(2131230773);
        this.mOldPassword.setVisibility(0);
        this.mOldPassword.addTextChangedListener(this);
        this.mError = (TextView) view.findViewById(2131230771);
        AlertDialog create = new Builder(credentialStorage).setView(view).setTitle(2131428769).setPositiveButton(17039370, this).setNegativeButton(17039360, this).create();
        create.setOnDismissListener(this);
        create.show();
        this.mButton = create.getButton(-1);
        this.mButton.setEnabled(false);
    }

    public void onDismiss(DialogInterface dialogInterface) {
        if (this.mUnlockConfirmed) {
            this.mUnlockConfirmed = false;
            this.mError.setVisibility(0);
            CredentialStorage.access$400(this.this$0).unlock(this.mOldPassword.getText().toString());
            int lastError = CredentialStorage.access$400(this.this$0).getLastError();
            if (lastError == 1) {
                CredentialStorage.access$502(this.this$0, -1);
                Toast.makeText(this.this$0, 2131428779, 0).show();
                CredentialStorage.access$600(this.this$0);
                return;
            } else if (lastError == 3) {
                CredentialStorage.access$502(this.this$0, -1);
                Toast.makeText(this.this$0, 2131428777, 0).show();
                CredentialStorage.access$700(this.this$0);
                return;
            } else if (lastError >= 10) {
                CredentialStorage.access$502(this.this$0, (lastError - 10) + 1);
                CredentialStorage.access$700(this.this$0);
                return;
            } else {
                return;
            }
        }
        this.this$0.finish();
    }

    public void afterTextChanged(Editable editable) {
        Button button = this.mButton;
        boolean z = this.mOldPassword == null || this.mOldPassword.getText().length() > 0;
        button.setEnabled(z);
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        this.mUnlockConfirmed = i == -1;
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}