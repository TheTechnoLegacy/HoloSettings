package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.view.View;
import android.view.View.OnClickListener;
import com.jellybyn.settings.TrustedCredentialsSettings.CertHolder;
import com.jellybyn.settings.TrustedCredentialsSettings.Tab;

class TrustedCredentialsSettings$3 implements OnClickListener {
    final /* synthetic */ TrustedCredentialsSettings this$0;
    final /* synthetic */ Dialog val$certDialog;
    final /* synthetic */ CertHolder val$certHolder;

    public void onClick(View view) {
        Builder builder = new Builder(this.this$0.getActivity());
        builder.setMessage(Tab.access$2800(CertHolder.access$100(this.val$certHolder), this.val$certHolder));
        builder.setPositiveButton(17039379, new 1(this));
        builder.setNegativeButton(17039369, new 1(this));
        builder.create().show();
    }

    TrustedCredentialsSettings$3(TrustedCredentialsSettings trustedCredentialsSettings, CertHolder certHolder, Dialog dialog) {
        this.this$0 = trustedCredentialsSettings;
        this.val$certHolder = certHolder;
        this.val$certDialog = dialog;
    }
}