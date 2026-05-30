package com.jellybyn.settings;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.jellybyn.settings.TrustedCredentialsSettings.TrustedCertificateAdapter;

class TrustedCredentialsSettings$1 implements OnItemClickListener {
    final /* synthetic */ TrustedCredentialsSettings this$0;
    final /* synthetic */ TrustedCertificateAdapter val$adapter;

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        TrustedCredentialsSettings.access$1000(this.this$0, this.val$adapter.getItem(i));
    }

    TrustedCredentialsSettings$1(TrustedCredentialsSettings trustedCredentialsSettings, TrustedCertificateAdapter trustedCertificateAdapter) {
        this.this$0 = trustedCredentialsSettings;
        this.val$adapter = trustedCertificateAdapter;
    }
}