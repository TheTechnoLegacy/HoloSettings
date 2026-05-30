package com.jellybyn.settings;

import android.os.AsyncTask;
import android.view.View;
import android.widget.ProgressBar;
import com.jellybyn.settings.TrustedCredentialsSettings.CertHolder;
import com.jellybyn.settings.TrustedCredentialsSettings.Tab;
import com.jellybyn.settings.TrustedCredentialsSettings.TrustedCertificateAdapter;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

class TrustedCredentialsSettings$TrustedCertificateAdapter$AliasLoader extends AsyncTask<Void, Integer, List<CertHolder>> {
    View mList;
    ProgressBar mProgressBar;
    final /* synthetic */ TrustedCertificateAdapter this$1;

    protected List<CertHolder> doInBackground(Void... voidArr) {
        Set<String> aliases = Tab.access$2300(TrustedCertificateAdapter.access$2000(this.this$1), TrustedCredentialsSettings.access$2200(this.this$1.this$0));
        int max = aliases.size();
        int progress = 0;
        List<CertHolder> certHolders = new ArrayList(max);
        for (String str : aliases) {
            certHolders.add(new CertHolder(TrustedCredentialsSettings.access$2200(this.this$1.this$0), this.this$1, TrustedCertificateAdapter.access$2000(this.this$1), str, (X509Certificate) TrustedCredentialsSettings.access$2200(this.this$1.this$0).getCertificate(str, true), null));
            r0 = new Integer[2];
            progress++;
            r0[0] = Integer.valueOf(progress);
            r0[1] = Integer.valueOf(max);
            publishProgress(r0);
        }
        Collections.sort(certHolders);
        return certHolders;
    }

    protected void onPostExecute(List<CertHolder> certHolders) {
        TrustedCertificateAdapter.access$300(this.this$1).clear();
        TrustedCertificateAdapter.access$300(this.this$1).addAll(certHolders);
        this.this$1.notifyDataSetChanged();
        View content = TrustedCredentialsSettings.access$1900(this.this$1.this$0).getTabContentView();
        this.mProgressBar.setVisibility(8);
        this.mList.setVisibility(0);
        this.mProgressBar.setProgress(0);
    }

    protected void onPreExecute() {
        View content = TrustedCredentialsSettings.access$1900(this.this$1.this$0).getTabContentView();
        this.mProgressBar = (ProgressBar) content.findViewById(Tab.access$2100(TrustedCertificateAdapter.access$2000(this.this$1)));
        this.mList = content.findViewById(Tab.access$800(TrustedCertificateAdapter.access$2000(this.this$1)));
        this.mProgressBar.setVisibility(0);
        this.mList.setVisibility(8);
    }

    protected void onProgressUpdate(Integer... numArr) {
        int progress = numArr[0].intValue();
        int max = numArr[1].intValue();
        if (max != this.mProgressBar.getMax()) {
            this.mProgressBar.setMax(max);
        }
        this.mProgressBar.setProgress(progress);
    }

    private TrustedCredentialsSettings$TrustedCertificateAdapter$AliasLoader(TrustedCertificateAdapter trustedCertificateAdapter) {
        this.this$1 = trustedCertificateAdapter;
    }
}