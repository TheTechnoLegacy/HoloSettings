package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TabHost;
import org.apache.harmony.xnet.provider.jsse.TrustedCertificateStore;

public class TrustedCredentialsSettings extends Fragment {
    private final TrustedCertificateStore mStore = new TrustedCertificateStore();
    private TabHost mTabHost;

    private void showCertDialog(CertHolder certHolder) {
        View view = CertHolder.access$2600(certHolder).inflateCertificateView(getActivity());
        Builder builder = new Builder(getActivity());
        builder.setTitle(17040674);
        builder.setView(view);
        builder.setPositiveButton(17039370, new 2(this));
        Dialog certDialog = builder.create();
        ViewGroup body = (ViewGroup) view.findViewById(16909101);
        Button removeButton = (Button) LayoutInflater.from(getActivity()).inflate(2130968699, body, false);
        body.addView(removeButton);
        removeButton.setText(Tab.access$2700(CertHolder.access$100(certHolder), certHolder));
        removeButton.setOnClickListener(new 3(this, certHolder, certDialog));
        certDialog.show();
    }

    private void addTab(Tab tab) {
        this.mTabHost.addTab(this.mTabHost.newTabSpec(Tab.access$700(tab)).setIndicator(getActivity().getString(Tab.access$600(tab))).setContent(Tab.access$500(tab)));
        ListView lv = (ListView) this.mTabHost.findViewById(Tab.access$800(tab));
        TrustedCertificateAdapter adapter = new TrustedCertificateAdapter(this, tab, null);
        lv.setAdapter(adapter);
        lv.setOnItemClickListener(new 1(this, adapter));
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mTabHost = (TabHost) layoutInflater.inflate(2130968700, viewGroup, false);
        this.mTabHost.setup();
        addTab(Tab.SYSTEM);
        addTab(Tab.USER);
        return this.mTabHost;
    }
}