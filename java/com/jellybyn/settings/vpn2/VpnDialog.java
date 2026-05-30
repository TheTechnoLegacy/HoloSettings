package com.jellybyn.settings.vpn2;

class VpnDialog extends android.app.AlertDialog implements android.text.TextWatcher, android.view.View.OnClickListener, android.widget.AdapterView.OnItemSelectedListener {
    private android.widget.TextView mDnsServers;
    private boolean mEditing;
    private android.widget.Spinner mIpsecCaCert;
    private android.widget.TextView mIpsecIdentifier;
    private android.widget.TextView mIpsecSecret;
    private android.widget.Spinner mIpsecServerCert;
    private android.widget.Spinner mIpsecUserCert;
    private final android.security.KeyStore mKeyStore;
    private android.widget.TextView mL2tpSecret;
    private final android.content.DialogInterface.OnClickListener mListener;
    private android.widget.CheckBox mMppe;
    private android.widget.TextView mName;
    private android.widget.TextView mPassword;
    private final com.android.internal.net.VpnProfile mProfile;
    private android.widget.TextView mRoutes;
    private android.widget.CheckBox mSaveLogin;
    private android.widget.TextView mSearchDomains;
    private android.widget.TextView mServer;
    private android.widget.Spinner mType;
    private android.widget.TextView mUsername;
    private android.view.View mView;

    VpnDialog(android.content.Context r2, android.content.DialogInterface.OnClickListener r3, com.android.internal.net.VpnProfile r4, boolean r5) {
        r1 = this;
        r1.<init>(r2);
        r0 = android.security.KeyStore.getInstance();
        r1.mKeyStore = r0;
        r1.mListener = r3;
        r1.mProfile = r4;
        r1.mEditing = r5;
        return;
    }

    private void changeType(int r8) {
        r7 = this;
        r6 = 2131231091; // 0x7f080173 float:1.8078253E38 double:1.0529680654E-314;
        r5 = 2131231088; // 0x7f080170 float:1.8078247E38 double:1.052968064E-314;
        r4 = 2131231086; // 0x7f08016e float:1.8078243E38 double:1.052968063E-314;
        r3 = 8;
        r2 = 0;
        r0 = r7.mMppe;
        r0.setVisibility(r3);
        r0 = r7.mView;
        r0 = r0.findViewById(r4);
        r0.setVisibility(r3);
        r0 = r7.mView;
        r0 = r0.findViewById(r5);
        r0.setVisibility(r3);
        r0 = r7.mView;
        r0 = r0.findViewById(r6);
        r0.setVisibility(r3);
        r0 = r7.mView;
        r1 = 2131231093; // 0x7f080175 float:1.8078257E38 double:1.0529680664E-314;
        r0 = r0.findViewById(r1);
        r0.setVisibility(r3);
        switch(r8) {
            case 0: goto L_0x003c;
            case 1: goto L_0x0042;
            case 2: goto L_0x0055;
            case 3: goto L_0x004b;
            case 4: goto L_0x005e;
            case 5: goto L_0x0067;
            default: goto L_0x003b;
        };
    L_0x003b:
        return;
    L_0x003c:
        r0 = r7.mMppe;
        r0.setVisibility(r2);
        goto L_0x003b;
    L_0x0042:
        r0 = r7.mView;
        r0 = r0.findViewById(r4);
        r0.setVisibility(r2);
    L_0x004b:
        r0 = r7.mView;
        r0 = r0.findViewById(r5);
        r0.setVisibility(r2);
        goto L_0x003b;
    L_0x0055:
        r0 = r7.mView;
        r0 = r0.findViewById(r4);
        r0.setVisibility(r2);
    L_0x005e:
        r0 = r7.mView;
        r0 = r0.findViewById(r6);
        r0.setVisibility(r2);
    L_0x0067:
        r0 = r7.mView;
        r1 = 2131231093; // 0x7f080175 float:1.8078257E38 double:1.0529680664E-314;
        r0 = r0.findViewById(r1);
        r0.setVisibility(r2);
        goto L_0x003b;
    }

    private void loadCertificates(android.widget.Spinner r10, java.lang.String r11, int r12, java.lang.String r13) {
        r9 = this;
        r8 = 1;
        r7 = 0;
        r3 = r9.getContext();
        if (r12 != 0) goto L_0x003a;
    L_0x0008:
        r4 = "";
    L_0x000a:
        r6 = r9.mKeyStore;
        r2 = r6.saw(r11);
        if (r2 == 0) goto L_0x0015;
    L_0x0012:
        r6 = r2.length;
        if (r6 != 0) goto L_0x003f;
    L_0x0015:
        r2 = new java.lang.String[r8];
        r2[r7] = r4;
    L_0x0019:
        r0 = new android.widget.ArrayAdapter;
        r6 = 17367048; // 0x1090008 float:2.5162948E-38 double:8.580462E-317;
        r0.<init>(r3, r6, r2);
        r6 = 17367049; // 0x1090009 float:2.516295E-38 double:8.5804623E-317;
        r0.setDropDownViewResource(r6);
        r10.setAdapter(r0);
        r5 = 1;
    L_0x002b:
        r6 = r2.length;
        if (r5 >= r6) goto L_0x0039;
    L_0x002e:
        r6 = r2[r5];
        r6 = r6.equals(r13);
        if (r6 == 0) goto L_0x004c;
    L_0x0036:
        r10.setSelection(r5);
    L_0x0039:
        return;
    L_0x003a:
        r4 = r3.getString(r12);
        goto L_0x000a;
    L_0x003f:
        r6 = r2.length;
        r6 = r6 + 1;
        r1 = new java.lang.String[r6];
        r1[r7] = r4;
        r6 = r2.length;
        java.lang.System.arraycopy(r2, r7, r1, r8, r6);
        r2 = r1;
        goto L_0x0019;
    L_0x004c:
        r5 = r5 + 1;
        goto L_0x002b;
    }

    private boolean validate(boolean r4) {
        r3 = this;
        r0 = 1;
        r1 = 0;
        if (r4 != 0) goto L_0x001f;
    L_0x0004:
        r2 = r3.mUsername;
        r2 = r2.getText();
        r2 = r2.length();
        if (r2 == 0) goto L_0x001d;
    L_0x0010:
        r2 = r3.mPassword;
        r2 = r2.getText();
        r2 = r2.length();
        if (r2 == 0) goto L_0x001d;
    L_0x001c:
        return r0;
    L_0x001d:
        r0 = r1;
        goto L_0x001c;
    L_0x001f:
        r2 = r3.mName;
        r2 = r2.getText();
        r2 = r2.length();
        if (r2 == 0) goto L_0x0057;
    L_0x002b:
        r2 = r3.mServer;
        r2 = r2.getText();
        r2 = r2.length();
        if (r2 == 0) goto L_0x0057;
    L_0x0037:
        r2 = r3.mDnsServers;
        r2 = r2.getText();
        r2 = r2.toString();
        r2 = r3.validateAddresses(r2, r1);
        if (r2 == 0) goto L_0x0057;
    L_0x0047:
        r2 = r3.mRoutes;
        r2 = r2.getText();
        r2 = r2.toString();
        r2 = r3.validateAddresses(r2, r0);
        if (r2 != 0) goto L_0x0059;
    L_0x0057:
        r0 = r1;
        goto L_0x001c;
    L_0x0059:
        r2 = r3.mType;
        r2 = r2.getSelectedItemPosition();
        switch(r2) {
            case 0: goto L_0x001c;
            case 1: goto L_0x0064;
            case 2: goto L_0x0072;
            case 3: goto L_0x0064;
            case 4: goto L_0x0072;
            case 5: goto L_0x001c;
            default: goto L_0x0062;
        };
    L_0x0062:
        r0 = r1;
        goto L_0x001c;
    L_0x0064:
        r2 = r3.mIpsecSecret;
        r2 = r2.getText();
        r2 = r2.length();
        if (r2 != 0) goto L_0x001c;
    L_0x0070:
        r0 = r1;
        goto L_0x001c;
    L_0x0072:
        r2 = r3.mIpsecUserCert;
        r2 = r2.getSelectedItemPosition();
        if (r2 != 0) goto L_0x001c;
    L_0x007a:
        r0 = r1;
        goto L_0x001c;
    }

    private boolean validateAddresses(java.lang.String r12, boolean r13) {
        r11 = this;
        r9 = " ";
        r1 = r12.split(r9);	 Catch:{ Exception -> 0x0064 }
        r6 = r1.length;	 Catch:{ Exception -> 0x0064 }
        r4 = 0;
    L_0x0008:
        if (r4 >= r6) goto L_0x0067;
    L_0x000a:
        r0 = r1[r4];	 Catch:{ Exception -> 0x0064 }
        r9 = r0.isEmpty();	 Catch:{ Exception -> 0x0064 }
        if (r9 == 0) goto L_0x0015;
    L_0x0012:
        r4 = r4 + 1;
        goto L_0x0008;
    L_0x0015:
        r8 = 32;
        if (r13 == 0) goto L_0x002a;
    L_0x0019:
        r9 = "/";
        r10 = 2;
        r7 = r0.split(r9, r10);	 Catch:{ Exception -> 0x0064 }
        r9 = 0;
        r0 = r7[r9];	 Catch:{ Exception -> 0x0064 }
        r9 = 1;
        r9 = r7[r9];	 Catch:{ Exception -> 0x0064 }
        r8 = java.lang.Integer.parseInt(r9);	 Catch:{ Exception -> 0x0064 }
    L_0x002a:
        r9 = java.net.InetAddress.parseNumericAddress(r0);	 Catch:{ Exception -> 0x0064 }
        r2 = r9.getAddress();	 Catch:{ Exception -> 0x0064 }
        r9 = 3;
        r9 = r2[r9];	 Catch:{ Exception -> 0x0064 }
        r9 = r9 & 255;
        r10 = 2;
        r10 = r2[r10];	 Catch:{ Exception -> 0x0064 }
        r10 = r10 & 255;
        r10 = r10 << 8;
        r9 = r9 | r10;
        r10 = 1;
        r10 = r2[r10];	 Catch:{ Exception -> 0x0064 }
        r10 = r10 & 255;
        r10 = r10 << 16;
        r9 = r9 | r10;
        r10 = 0;
        r10 = r2[r10];	 Catch:{ Exception -> 0x0064 }
        r10 = r10 & 255;
        r10 = r10 << 24;
        r5 = r9 | r10;
        r9 = r2.length;	 Catch:{ Exception -> 0x0064 }
        r10 = 4;
        if (r9 != r10) goto L_0x0062;
    L_0x0054:
        if (r8 < 0) goto L_0x0062;
    L_0x0056:
        r9 = 32;
        if (r8 > r9) goto L_0x0062;
    L_0x005a:
        r9 = 32;
        if (r8 >= r9) goto L_0x0012;
    L_0x005e:
        r9 = r5 << r8;
        if (r9 == 0) goto L_0x0012;
    L_0x0062:
        r9 = 0;
    L_0x0063:
        return r9;
    L_0x0064:
        r3 = move-exception;
        r9 = 0;
        goto L_0x0063;
    L_0x0067:
        r9 = 1;
        goto L_0x0063;
    }

    public void afterTextChanged(android.text.Editable r3) {
        r2 = this;
        r0 = -1;
        r0 = r2.getButton(r0);
        r1 = r2.mEditing;
        r1 = r2.validate(r1);
        r0.setEnabled(r1);
        return;
    }

    public void beforeTextChanged(java.lang.CharSequence r1, int r2, int r3, int r4) {
        r0 = this;
        return;
    }

    com.android.internal.net.VpnProfile getProfile() {
        r2 = this;
        r0 = new com.android.internal.net.VpnProfile;
        r1 = r2.mProfile;
        r1 = r1.key;
        r0.<init>(r1);
        r1 = r2.mName;
        r1 = r1.getText();
        r1 = r1.toString();
        r0.name = r1;
        r1 = r2.mType;
        r1 = r1.getSelectedItemPosition();
        r0.type = r1;
        r1 = r2.mServer;
        r1 = r1.getText();
        r1 = r1.toString();
        r1 = r1.trim();
        r0.server = r1;
        r1 = r2.mUsername;
        r1 = r1.getText();
        r1 = r1.toString();
        r0.username = r1;
        r1 = r2.mPassword;
        r1 = r1.getText();
        r1 = r1.toString();
        r0.password = r1;
        r1 = r2.mSearchDomains;
        r1 = r1.getText();
        r1 = r1.toString();
        r1 = r1.trim();
        r0.searchDomains = r1;
        r1 = r2.mDnsServers;
        r1 = r1.getText();
        r1 = r1.toString();
        r1 = r1.trim();
        r0.dnsServers = r1;
        r1 = r2.mRoutes;
        r1 = r1.getText();
        r1 = r1.toString();
        r1 = r1.trim();
        r0.routes = r1;
        r1 = r0.type;
        switch(r1) {
            case 0: goto L_0x0083;
            case 1: goto L_0x008c;
            case 2: goto L_0x00b1;
            case 3: goto L_0x0098;
            case 4: goto L_0x00bd;
            case 5: goto L_0x00cf;
            default: goto L_0x007a;
        };
    L_0x007a:
        r1 = r2.mSaveLogin;
        r1 = r1.isChecked();
        r0.saveLogin = r1;
        return r0;
    L_0x0083:
        r1 = r2.mMppe;
        r1 = r1.isChecked();
        r0.mppe = r1;
        goto L_0x007a;
    L_0x008c:
        r1 = r2.mL2tpSecret;
        r1 = r1.getText();
        r1 = r1.toString();
        r0.l2tpSecret = r1;
    L_0x0098:
        r1 = r2.mIpsecIdentifier;
        r1 = r1.getText();
        r1 = r1.toString();
        r0.ipsecIdentifier = r1;
        r1 = r2.mIpsecSecret;
        r1 = r1.getText();
        r1 = r1.toString();
        r0.ipsecSecret = r1;
        goto L_0x007a;
    L_0x00b1:
        r1 = r2.mL2tpSecret;
        r1 = r1.getText();
        r1 = r1.toString();
        r0.l2tpSecret = r1;
    L_0x00bd:
        r1 = r2.mIpsecUserCert;
        r1 = r1.getSelectedItemPosition();
        if (r1 == 0) goto L_0x00cf;
    L_0x00c5:
        r1 = r2.mIpsecUserCert;
        r1 = r1.getSelectedItem();
        r1 = (java.lang.String) r1;
        r0.ipsecUserCert = r1;
    L_0x00cf:
        r1 = r2.mIpsecCaCert;
        r1 = r1.getSelectedItemPosition();
        if (r1 == 0) goto L_0x00e1;
    L_0x00d7:
        r1 = r2.mIpsecCaCert;
        r1 = r1.getSelectedItem();
        r1 = (java.lang.String) r1;
        r0.ipsecCaCert = r1;
    L_0x00e1:
        r1 = r2.mIpsecServerCert;
        r1 = r1.getSelectedItemPosition();
        if (r1 == 0) goto L_0x007a;
    L_0x00e9:
        r1 = r2.mIpsecServerCert;
        r1 = r1.getSelectedItem();
        r1 = (java.lang.String) r1;
        r0.ipsecServerCert = r1;
        goto L_0x007a;
    }

    boolean isEditing() {
        r1 = this;
        r0 = r1.mEditing;
        return r0;
    }

    public void onClick(android.view.View r3) {
        r2 = this;
        r0 = 8;
        r3.setVisibility(r0);
        r0 = r2.mView;
        r1 = 2131231097; // 0x7f080179 float:1.8078265E38 double:1.0529680684E-314;
        r0 = r0.findViewById(r1);
        r1 = 0;
        r0.setVisibility(r1);
        return;
    }

    protected void onCreate(android.os.Bundle r12) {
        r11 = this;
        r10 = 0;
        r9 = -1;
        r5 = 1;
        r4 = 0;
        r3 = r11.getLayoutInflater();
        r6 = 2130968711; // 0x7f040087 float:1.7546083E38 double:1.0528384325E-314;
        r3 = r3.inflate(r6, r10);
        r11.mView = r3;
        r3 = r11.mView;
        r11.setView(r3);
        r11.setInverseBackgroundForced(r5);
        r0 = r11.getContext();
        r3 = r11.mView;
        r6 = 2131230834; // 0x7f080072 float:1.8077732E38 double:1.0529679384E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.TextView) r3;
        r11.mName = r3;
        r3 = r11.mView;
        r6 = 2131231083; // 0x7f08016b float:1.8078237E38 double:1.0529680615E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.Spinner) r3;
        r11.mType = r3;
        r3 = r11.mView;
        r6 = 2131231084; // 0x7f08016c float:1.807824E38 double:1.052968062E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.TextView) r3;
        r11.mServer = r3;
        r3 = r11.mView;
        r6 = 2131231102; // 0x7f08017e float:1.8078276E38 double:1.052968071E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.TextView) r3;
        r11.mUsername = r3;
        r3 = r11.mView;
        r6 = 2131231103; // 0x7f08017f float:1.8078278E38 double:1.0529680713E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.TextView) r3;
        r11.mPassword = r3;
        r3 = r11.mView;
        r6 = 2131231098; // 0x7f08017a float:1.8078267E38 double:1.052968069E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.TextView) r3;
        r11.mSearchDomains = r3;
        r3 = r11.mView;
        r6 = 2131231099; // 0x7f08017b float:1.807827E38 double:1.0529680694E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.TextView) r3;
        r11.mDnsServers = r3;
        r3 = r11.mView;
        r6 = 2131231100; // 0x7f08017c float:1.8078271E38 double:1.05296807E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.TextView) r3;
        r11.mRoutes = r3;
        r3 = r11.mView;
        r6 = 2131231085; // 0x7f08016d float:1.8078241E38 double:1.0529680624E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.CheckBox) r3;
        r11.mMppe = r3;
        r3 = r11.mView;
        r6 = 2131231087; // 0x7f08016f float:1.8078245E38 double:1.0529680634E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.TextView) r3;
        r11.mL2tpSecret = r3;
        r3 = r11.mView;
        r6 = 2131231089; // 0x7f080171 float:1.807825E38 double:1.0529680644E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.TextView) r3;
        r11.mIpsecIdentifier = r3;
        r3 = r11.mView;
        r6 = 2131231090; // 0x7f080172 float:1.8078251E38 double:1.052968065E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.TextView) r3;
        r11.mIpsecSecret = r3;
        r3 = r11.mView;
        r6 = 2131231092; // 0x7f080174 float:1.8078255E38 double:1.052968066E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.Spinner) r3;
        r11.mIpsecUserCert = r3;
        r3 = r11.mView;
        r6 = 2131231094; // 0x7f080176 float:1.807826E38 double:1.052968067E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.Spinner) r3;
        r11.mIpsecCaCert = r3;
        r3 = r11.mView;
        r6 = 2131231095; // 0x7f080177 float:1.8078261E38 double:1.0529680674E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.Spinner) r3;
        r11.mIpsecServerCert = r3;
        r3 = r11.mView;
        r6 = 2131231104; // 0x7f080180 float:1.807828E38 double:1.052968072E-314;
        r3 = r3.findViewById(r6);
        r3 = (android.widget.CheckBox) r3;
        r11.mSaveLogin = r3;
        r3 = r11.mName;
        r6 = r11.mProfile;
        r6 = r6.name;
        r3.setText(r6);
        r3 = r11.mType;
        r6 = r11.mProfile;
        r6 = r6.type;
        r3.setSelection(r6);
        r3 = r11.mServer;
        r6 = r11.mProfile;
        r6 = r6.server;
        r3.setText(r6);
        r3 = r11.mProfile;
        r3 = r3.saveLogin;
        if (r3 == 0) goto L_0x0120;
    L_0x010e:
        r3 = r11.mUsername;
        r6 = r11.mProfile;
        r6 = r6.username;
        r3.setText(r6);
        r3 = r11.mPassword;
        r6 = r11.mProfile;
        r6 = r6.password;
        r3.setText(r6);
    L_0x0120:
        r3 = r11.mSearchDomains;
        r6 = r11.mProfile;
        r6 = r6.searchDomains;
        r3.setText(r6);
        r3 = r11.mDnsServers;
        r6 = r11.mProfile;
        r6 = r6.dnsServers;
        r3.setText(r6);
        r3 = r11.mRoutes;
        r6 = r11.mProfile;
        r6 = r6.routes;
        r3.setText(r6);
        r3 = r11.mMppe;
        r6 = r11.mProfile;
        r6 = r6.mppe;
        r3.setChecked(r6);
        r3 = r11.mL2tpSecret;
        r6 = r11.mProfile;
        r6 = r6.l2tpSecret;
        r3.setText(r6);
        r3 = r11.mIpsecIdentifier;
        r6 = r11.mProfile;
        r6 = r6.ipsecIdentifier;
        r3.setText(r6);
        r3 = r11.mIpsecSecret;
        r6 = r11.mProfile;
        r6 = r6.ipsecSecret;
        r3.setText(r6);
        r3 = r11.mIpsecUserCert;
        r6 = "USRPKEY_";
        r7 = r11.mProfile;
        r7 = r7.ipsecUserCert;
        r11.loadCertificates(r3, r6, r4, r7);
        r3 = r11.mIpsecCaCert;
        r6 = "CACERT_";
        r7 = 2131429032; // 0x7f0b06a8 float:1.8479725E38 double:1.0530658613E-314;
        r8 = r11.mProfile;
        r8 = r8.ipsecCaCert;
        r11.loadCertificates(r3, r6, r7, r8);
        r3 = r11.mIpsecServerCert;
        r6 = "USRCERT_";
        r7 = 2131429033; // 0x7f0b06a9 float:1.8479727E38 double:1.053065862E-314;
        r8 = r11.mProfile;
        r8 = r8.ipsecServerCert;
        r11.loadCertificates(r3, r6, r7, r8);
        r3 = r11.mSaveLogin;
        r6 = r11.mProfile;
        r6 = r6.saveLogin;
        r3.setChecked(r6);
        r3 = r11.mName;
        r3.addTextChangedListener(r11);
        r3 = r11.mType;
        r3.setOnItemSelectedListener(r11);
        r3 = r11.mServer;
        r3.addTextChangedListener(r11);
        r3 = r11.mUsername;
        r3.addTextChangedListener(r11);
        r3 = r11.mPassword;
        r3.addTextChangedListener(r11);
        r3 = r11.mDnsServers;
        r3.addTextChangedListener(r11);
        r3 = r11.mRoutes;
        r3.addTextChangedListener(r11);
        r3 = r11.mIpsecSecret;
        r3.addTextChangedListener(r11);
        r3 = r11.mIpsecUserCert;
        r3.setOnItemSelectedListener(r11);
        r2 = r11.validate(r5);
        r3 = r11.mEditing;
        if (r3 != 0) goto L_0x01c6;
    L_0x01c4:
        if (r2 != 0) goto L_0x0241;
    L_0x01c6:
        r3 = r5;
    L_0x01c7:
        r11.mEditing = r3;
        r3 = r11.mEditing;
        if (r3 == 0) goto L_0x0247;
    L_0x01cd:
        r3 = 2131429037; // 0x7f0b06ad float:1.8479735E38 double:1.0530658637E-314;
        r11.setTitle(r3);
        r3 = r11.mView;
        r5 = 2131231082; // 0x7f08016a float:1.8078235E38 double:1.052968061E-314;
        r3 = r3.findViewById(r5);
        r3.setVisibility(r4);
        r3 = r11.mProfile;
        r3 = r3.type;
        r11.changeType(r3);
        r3 = r11.mView;
        r5 = 2131231096; // 0x7f080178 float:1.8078263E38 double:1.052968068E-314;
        r1 = r3.findViewById(r5);
        r3 = r11.mProfile;
        r3 = r3.searchDomains;
        r3 = r3.isEmpty();
        if (r3 == 0) goto L_0x0243;
    L_0x01f9:
        r3 = r11.mProfile;
        r3 = r3.dnsServers;
        r3 = r3.isEmpty();
        if (r3 == 0) goto L_0x0243;
    L_0x0203:
        r3 = r11.mProfile;
        r3 = r3.routes;
        r3 = r3.isEmpty();
        if (r3 == 0) goto L_0x0243;
    L_0x020d:
        r1.setOnClickListener(r11);
    L_0x0210:
        r3 = 2131429035; // 0x7f0b06ab float:1.8479731E38 double:1.0530658627E-314;
        r3 = r0.getString(r3);
        r5 = r11.mListener;
        r11.setButton(r9, r3, r5);
    L_0x021c:
        r3 = -2;
        r5 = 2131429034; // 0x7f0b06aa float:1.847973E38 double:1.0530658622E-314;
        r5 = r0.getString(r5);
        r6 = r11.mListener;
        r11.setButton(r3, r5, r6);
        super.onCreate(r10);
        r3 = r11.getButton(r9);
        r5 = r11.mEditing;
        if (r5 == 0) goto L_0x0272;
    L_0x0234:
        r3.setEnabled(r2);
        r3 = r11.getWindow();
        r4 = 20;
        r3.setSoftInputMode(r4);
        return;
    L_0x0241:
        r3 = r4;
        goto L_0x01c7;
    L_0x0243:
        r11.onClick(r1);
        goto L_0x0210;
    L_0x0247:
        r3 = 2131429038; // 0x7f0b06ae float:1.8479737E38 double:1.053065864E-314;
        r5 = new java.lang.Object[r5];
        r6 = r11.mProfile;
        r6 = r6.name;
        r5[r4] = r6;
        r3 = r0.getString(r3, r5);
        r11.setTitle(r3);
        r3 = r11.mView;
        r5 = 2131231101; // 0x7f08017d float:1.8078274E38 double:1.0529680704E-314;
        r3 = r3.findViewById(r5);
        r3.setVisibility(r4);
        r3 = 2131429036; // 0x7f0b06ac float:1.8479733E38 double:1.053065863E-314;
        r3 = r0.getString(r3);
        r5 = r11.mListener;
        r11.setButton(r9, r3, r5);
        goto L_0x021c;
    L_0x0272:
        r2 = r11.validate(r4);
        goto L_0x0234;
    }

    public void onItemSelected(android.widget.AdapterView<?> r3, android.view.View r4, int r5, long r6) {
        r2 = this;
        r0 = r2.mType;
        if (r3 != r0) goto L_0x0007;
    L_0x0004:
        r2.changeType(r5);
    L_0x0007:
        r0 = -1;
        r0 = r2.getButton(r0);
        r1 = r2.mEditing;
        r1 = r2.validate(r1);
        r0.setEnabled(r1);
        return;
    }

    public void onNothingSelected(android.widget.AdapterView<?> r1) {
        r0 = this;
        return;
    }

    public void onTextChanged(java.lang.CharSequence r1, int r2, int r3, int r4) {
        r0 = this;
        return;
    }
}