package com.jellybyn.settings;

import android.net.http.SslCertificate;
import com.jellybyn.settings.TrustedCredentialsSettings.Tab;
import com.jellybyn.settings.TrustedCredentialsSettings.TrustedCertificateAdapter;
import java.security.cert.X509Certificate;
import org.apache.harmony.xnet.provider.jsse.TrustedCertificateStore;

class TrustedCredentialsSettings$CertHolder implements Comparable<TrustedCredentialsSettings$CertHolder> {
    private final TrustedCertificateAdapter mAdapter;
    private final String mAlias;
    private boolean mDeleted;
    private final SslCertificate mSslCert;
    private final TrustedCertificateStore mStore;
    private final String mSubjectPrimary;
    private final String mSubjectSecondary;
    private final Tab mTab;
    private final X509Certificate mX509Cert;

    private TrustedCredentialsSettings$CertHolder(TrustedCertificateStore trustedCertificateStore, TrustedCertificateAdapter trustedCertificateAdapter, Tab tab, String str, X509Certificate x509Certificate) {
        this.mStore = trustedCertificateStore;
        this.mAdapter = trustedCertificateAdapter;
        this.mTab = tab;
        this.mAlias = str;
        this.mX509Cert = x509Certificate;
        this.mSslCert = new SslCertificate(x509Certificate);
        String cn = this.mSslCert.getIssuedTo().getCName();
        String o = this.mSslCert.getIssuedTo().getOName();
        String ou = this.mSslCert.getIssuedTo().getUName();
        if (o.isEmpty()) {
            if (cn.isEmpty()) {
                this.mSubjectPrimary = this.mSslCert.getIssuedTo().getDName();
                this.mSubjectSecondary = "";
            } else {
                this.mSubjectPrimary = cn;
                this.mSubjectSecondary = "";
            }
        } else if (cn.isEmpty()) {
            this.mSubjectPrimary = o;
            this.mSubjectSecondary = ou;
        } else {
            this.mSubjectPrimary = o;
            this.mSubjectSecondary = cn;
        }
        this.mDeleted = Tab.access$2500(this.mTab, this.mStore, this.mAlias);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof TrustedCredentialsSettings$CertHolder)) {
            return false;
        }
        return this.mAlias.equals(((TrustedCredentialsSettings$CertHolder) obj).mAlias);
    }

    public int compareTo(TrustedCredentialsSettings$CertHolder trustedCredentialsSettings$CertHolder) {
        int primary = this.mSubjectPrimary.compareToIgnoreCase(trustedCredentialsSettings$CertHolder.mSubjectPrimary);
        return primary != 0 ? primary : this.mSubjectSecondary.compareToIgnoreCase(trustedCredentialsSettings$CertHolder.mSubjectSecondary);
    }

    public int hashCode() {
        return this.mAlias.hashCode();
    }
}