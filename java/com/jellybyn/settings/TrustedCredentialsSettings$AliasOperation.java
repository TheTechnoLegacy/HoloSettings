package com.jellybyn.settings;

import android.os.AsyncTask;
import android.os.RemoteException;
import android.security.IKeyChainService;
import android.security.KeyChain;
import android.security.KeyChain.KeyChainConnection;
import com.jellybyn.settings.TrustedCredentialsSettings.CertHolder;
import com.jellybyn.settings.TrustedCredentialsSettings.Tab;
import java.security.cert.CertificateEncodingException;

class TrustedCredentialsSettings$AliasOperation extends AsyncTask<Void, Void, Boolean> {
    private final CertHolder mCertHolder;
    final /* synthetic */ TrustedCredentialsSettings this$0;

    protected Boolean doInBackground(Void... voidArr) {
        try {
            KeyChainConnection bind = KeyChain.bind(this.this$0.getActivity());
            IKeyChainService service = bind.getService();
            try {
                Boolean valueOf;
                if (CertHolder.access$000(this.mCertHolder)) {
                    service.installCaCertificate(CertHolder.access$3000(this.mCertHolder).getEncoded());
                    valueOf = Boolean.valueOf(true);
                    return valueOf;
                }
                valueOf = Boolean.valueOf(service.deleteCaCertificate(CertHolder.access$3100(this.mCertHolder)));
                bind.close();
                return valueOf;
            } finally {
                bind.close();
            }
        } catch (CertificateEncodingException e) {
            return Boolean.valueOf(false);
        } catch (IllegalStateException e2) {
            return Boolean.valueOf(false);
        } catch (RemoteException e3) {
            return Boolean.valueOf(false);
        } catch (InterruptedException e4) {
            Thread.currentThread().interrupt();
            return Boolean.valueOf(false);
        }
    }

    private TrustedCredentialsSettings$AliasOperation(TrustedCredentialsSettings trustedCredentialsSettings, CertHolder certHolder) {
        this.this$0 = trustedCredentialsSettings;
        this.mCertHolder = certHolder;
    }

    protected void onPostExecute(Boolean bool) {
        Tab.access$3200(CertHolder.access$100(this.mCertHolder), bool.booleanValue(), this.mCertHolder);
    }
}