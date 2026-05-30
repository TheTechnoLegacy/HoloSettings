package com.jellybyn.settings;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.TextView;
import com.jellybyn.settings.TrustedCredentialsSettings.CertHolder;
import com.jellybyn.settings.TrustedCredentialsSettings.Tab;
import com.jellybyn.settings.TrustedCredentialsSettings.ViewHolder;
import java.util.ArrayList;
import java.util.List;

class TrustedCredentialsSettings$TrustedCertificateAdapter extends BaseAdapter {
    private final List<CertHolder> mCertHolders;
    private final Tab mTab;
    final /* synthetic */ TrustedCredentialsSettings this$0;

    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder holder;
        if (view == null) {
            view = LayoutInflater.from(this.this$0.getActivity()).inflate(2130968698, viewGroup, false);
            holder = new ViewHolder(null);
            ViewHolder.access$1302(holder, (TextView) view.findViewById(2131231045));
            ViewHolder.access$1402(holder, (TextView) view.findViewById(2131231046));
            ViewHolder.access$1502(holder, (CheckBox) view.findViewById(2131231047));
            view.setTag(holder);
        } else {
            holder = (ViewHolder) view.getTag();
        }
        CertHolder certHolder = (CertHolder) this.mCertHolders.get(i);
        ViewHolder.access$1300(holder).setText(CertHolder.access$1600(certHolder));
        ViewHolder.access$1400(holder).setText(CertHolder.access$1700(certHolder));
        if (Tab.access$1800(this.mTab)) {
            ViewHolder.access$1500(holder).setChecked(!CertHolder.access$000(certHolder));
            ViewHolder.access$1500(holder).setVisibility(0);
        }
        return view;
    }

    private TrustedCredentialsSettings$TrustedCertificateAdapter(TrustedCredentialsSettings trustedCredentialsSettings, Tab tab) {
        this.this$0 = trustedCredentialsSettings;
        this.mCertHolders = new ArrayList();
        this.mTab = tab;
        load();
    }

    private void load() {
        new AliasLoader(this, null).execute(new Void[0]);
    }

    public int getCount() {
        return this.mCertHolders.size();
    }

    public CertHolder getItem(int i) {
        return (CertHolder) this.mCertHolders.get(i);
    }

    public long getItemId(int i) {
        return (long) i;
    }
}