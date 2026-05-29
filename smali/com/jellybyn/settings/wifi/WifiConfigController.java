package com.jellybyn.settings.wifi;

import android.content.Context;
import android.content.res.Resources;
import android.net.LinkAddress;
import android.net.LinkProperties;
import android.net.NetworkInfo.DetailedState;
import android.net.NetworkUtils;
import android.net.ProxyProperties;
import android.net.RouteInfo;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiConfiguration.IpAssignment;
import android.net.wifi.WifiConfiguration.ProxySettings;
import android.net.wifi.WifiEnterpriseConfig;
import android.net.wifi.WifiInfo;
import android.os.Handler;
import android.security.KeyStore;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import com.jellybyn.settings.ProxySelector;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Iterator;

public class WifiConfigController implements TextWatcher, OnClickListener, OnItemSelectedListener {
    private final ArrayAdapter<String> PHASE2_FULL_ADAPTER;
    private final ArrayAdapter<String> PHASE2_PEAP_ADAPTER;
    private final AccessPoint mAccessPoint;
    private int mAccessPointSecurity;
    private final WifiConfigUiBase mConfigUi;
    private TextView mDns1View;
    private TextView mDns2View;
    private TextView mEapAnonymousView;
    private Spinner mEapCaCertSpinner;
    private TextView mEapIdentityView;
    private Spinner mEapMethodSpinner;
    private Spinner mEapUserCertSpinner;
    private boolean mEdit;
    private TextView mGatewayView;
    private final boolean mInXlSetupWizard;
    private TextView mIpAddressView;
    private IpAssignment mIpAssignment = IpAssignment.UNASSIGNED;
    private Spinner mIpSettingsSpinner;
    private LinkProperties mLinkProperties = new LinkProperties();
    private TextView mNetworkPrefixLengthView;
    private TextView mPasswordView;
    private ArrayAdapter<String> mPhase2Adapter;
    private Spinner mPhase2Spinner;
    private TextView mProxyExclusionListView;
    private TextView mProxyHostView;
    private TextView mProxyPortView;
    private ProxySettings mProxySettings = ProxySettings.UNASSIGNED;
    private Spinner mProxySettingsSpinner;
    private Spinner mSecuritySpinner;
    private CheckBox mShowPassword;
    private TextView mSsidView;
    private final Handler mTextViewChangedHandler;
    private final View mView;
    private String unspecifiedCert = "unspecified";

    public WifiConfigController(WifiConfigUiBase wifiConfigUiBase, View view, AccessPoint accessPoint, boolean z) {
        this.mConfigUi = wifiConfigUiBase;
        this.mInXlSetupWizard = wifiConfigUiBase instanceof WifiConfigUiForSetupWizardXL;
        this.mView = view;
        this.mAccessPoint = accessPoint;
        this.mAccessPointSecurity = accessPoint == null ? 0 : accessPoint.security;
        this.mEdit = z;
        this.mTextViewChangedHandler = new Handler();
        Context context = this.mConfigUi.getContext();
        Resources resources = context.getResources();
        this.PHASE2_PEAP_ADAPTER = new ArrayAdapter(context, 17367048, context.getResources().getStringArray(2131165217));
        this.PHASE2_PEAP_ADAPTER.setDropDownViewResource(17367049);
        this.PHASE2_FULL_ADAPTER = new ArrayAdapter(context, 17367048, context.getResources().getStringArray(2131165218));
        this.PHASE2_FULL_ADAPTER.setDropDownViewResource(17367049);
        this.unspecifiedCert = context.getString(2131427873);
        this.mIpSettingsSpinner = (Spinner) this.mView.findViewById(2131231153);
        this.mIpSettingsSpinner.setOnItemSelectedListener(this);
        this.mProxySettingsSpinner = (Spinner) this.mView.findViewById(2131231146);
        this.mProxySettingsSpinner.setOnItemSelectedListener(this);
        if (this.mAccessPoint == null) {
            this.mConfigUi.setTitle(2131427824);
            this.mSsidView = (TextView) this.mView.findViewById(2131231122);
            this.mSsidView.addTextChangedListener(this);
            this.mSecuritySpinner = (Spinner) this.mView.findViewById(2131231123);
            this.mSecuritySpinner.setOnItemSelectedListener(this);
            if (this.mInXlSetupWizard) {
                this.mView.findViewById(2131231129).setVisibility(0);
                this.mView.findViewById(2131231135).setVisibility(0);
                this.mSecuritySpinner.setAdapter(new ArrayAdapter(context, 2130968725, 16908308, context.getResources().getStringArray(2131165203)));
            } else {
                this.mView.findViewById(2131231083).setVisibility(0);
            }
            showIpConfigFields();
            showProxyFields();
            this.mView.findViewById(2131231167).setVisibility(0);
            this.mView.findViewById(2131231168).setOnClickListener(this);
            this.mConfigUi.setSubmitButton(context.getString(2131427903));
        } else {
            this.mConfigUi.setTitle(this.mAccessPoint.ssid);
            ViewGroup group = (ViewGroup) this.mView.findViewById(2131231121);
            DetailedState state = this.mAccessPoint.getState();
            if (state != null) {
                addRow(group, 2131427859, Summary.get(this.mConfigUi.getContext(), state));
            }
            int level = this.mAccessPoint.getLevel();
            if (level != -1) {
                addRow(group, 2131427858, resources.getStringArray(2131165209)[level]);
            }
            WifiInfo info = this.mAccessPoint.getInfo();
            if (!(info == null || info.getLinkSpeed() == -1)) {
                addRow(group, 2131427860, info.getLinkSpeed() + "Mbps");
            }
            addRow(group, 2131427857, this.mAccessPoint.getSecurityString(false));
            boolean showAdvancedFields = false;
            if (this.mAccessPoint.networkId != -1) {
                WifiConfiguration config = this.mAccessPoint.getConfig();
                if (config.ipAssignment == IpAssignment.STATIC) {
                    this.mIpSettingsSpinner.setSelection(1);
                    showAdvancedFields = true;
                } else {
                    this.mIpSettingsSpinner.setSelection(0);
                }
                for (InetAddress hostAddress : config.linkProperties.getAddresses()) {
                    addRow(group, 2131427861, hostAddress.getHostAddress());
                }
                if (config.proxySettings == ProxySettings.STATIC) {
                    this.mProxySettingsSpinner.setSelection(1);
                    showAdvancedFields = true;
                } else {
                    this.mProxySettingsSpinner.setSelection(0);
                }
            }
            if (this.mAccessPoint.networkId == -1 || this.mEdit) {
                showSecurityFields();
                showIpConfigFields();
                showProxyFields();
                this.mView.findViewById(2131231167).setVisibility(0);
                this.mView.findViewById(2131231168).setOnClickListener(this);
                if (showAdvancedFields) {
                    ((CheckBox) this.mView.findViewById(2131231168)).setChecked(true);
                    this.mView.findViewById(2131231169).setVisibility(0);
                }
            }
            if (this.mEdit) {
                this.mConfigUi.setSubmitButton(context.getString(2131427903));
            } else {
                if (state != null || level == -1) {
                    this.mView.findViewById(2131231152).setVisibility(8);
                } else {
                    this.mConfigUi.setSubmitButton(context.getString(2131427899));
                }
                if (this.mAccessPoint.networkId != -1) {
                    this.mConfigUi.setForgetButton(context.getString(2131427901));
                }
            }
        }
        this.mConfigUi.setCancelButton(context.getString(2131427905));
        if (this.mConfigUi.getSubmitButton() != null) {
            enableSubmitIfAppropriate();
        }
    }

    WifiConfiguration getConfig() {
        if (this.mAccessPoint != null && this.mAccessPoint.networkId != -1 && !this.mEdit) {
            return null;
        }
        WifiConfiguration config = new WifiConfiguration();
        if (this.mAccessPoint == null) {
            config.SSID = AccessPoint.convertToQuotedString(this.mSsidView.getText().toString());
            config.hiddenSSID = true;
        } else if (this.mAccessPoint.networkId == -1) {
            config.SSID = AccessPoint.convertToQuotedString(this.mAccessPoint.ssid);
        } else {
            config.networkId = this.mAccessPoint.networkId;
        }
        String obj;
        switch (this.mAccessPointSecurity) {
            case 0:
                config.allowedKeyManagement.set(0);
                break;
            case 1:
                config.allowedKeyManagement.set(0);
                config.allowedAuthAlgorithms.set(0);
                config.allowedAuthAlgorithms.set(1);
                if (this.mPasswordView.length() != 0) {
                    int length = this.mPasswordView.length();
                    obj = this.mPasswordView.getText().toString();
                    if ((length != 10 && length != 26 && length != 58) || !obj.matches("[0-9A-Fa-f]*")) {
                        config.wepKeys[0] = '\"' + obj + '\"';
                        break;
                    }
                    config.wepKeys[0] = obj;
                    break;
                }
                break;
            case 2:
                config.allowedKeyManagement.set(1);
                if (this.mPasswordView.length() != 0) {
                    obj = this.mPasswordView.getText().toString();
                    if (!obj.matches("[0-9A-Fa-f]{64}")) {
                        config.preSharedKey = '\"' + obj + '\"';
                        break;
                    }
                    config.preSharedKey = obj;
                    break;
                }
                break;
            case 3:
                config.allowedKeyManagement.set(2);
                config.allowedKeyManagement.set(3);
                config.enterpriseConfig = new WifiEnterpriseConfig();
                int eapMethod = this.mEapMethodSpinner.getSelectedItemPosition();
                int phase2Method = this.mPhase2Spinner.getSelectedItemPosition();
                config.enterpriseConfig.setEapMethod(eapMethod);
                switch (eapMethod) {
                    case 0:
                        switch (phase2Method) {
                            case 0:
                                config.enterpriseConfig.setPhase2Method(0);
                                break;
                            case 1:
                                config.enterpriseConfig.setPhase2Method(3);
                                break;
                            case 2:
                                config.enterpriseConfig.setPhase2Method(4);
                                break;
                            default:
                                Log.e("WifiConfigController", "Unknown phase2 method" + phase2Method);
                                break;
                        }
                    default:
                        config.enterpriseConfig.setPhase2Method(phase2Method);
                        break;
                }
                String caCert = (String) this.mEapCaCertSpinner.getSelectedItem();
                if (caCert.equals(this.unspecifiedCert)) {
                    caCert = "";
                }
                config.enterpriseConfig.setCaCertificateAlias(caCert);
                String clientCert = (String) this.mEapUserCertSpinner.getSelectedItem();
                if (clientCert.equals(this.unspecifiedCert)) {
                    clientCert = "";
                }
                config.enterpriseConfig.setClientCertificateAlias(clientCert);
                config.enterpriseConfig.setIdentity(this.mEapIdentityView.getText().toString());
                config.enterpriseConfig.setAnonymousIdentity(this.mEapAnonymousView.getText().toString());
                if (this.mPasswordView.isShown()) {
                    if (this.mPasswordView.length() > 0) {
                        config.enterpriseConfig.setPassword(this.mPasswordView.getText().toString());
                        break;
                    }
                }
                config.enterpriseConfig.setPassword(this.mPasswordView.getText().toString());
                break;
                break;
            default:
                return null;
        }
        config.proxySettings = this.mProxySettings;
        config.ipAssignment = this.mIpAssignment;
        config.linkProperties = new LinkProperties(this.mLinkProperties);
        return config;
    }

    private void showSecurityFields() {
        if (this.mInXlSetupWizard && !((WifiSettingsForSetupWizardXL) this.mConfigUi.getContext()).initSecurityFields(this.mView, this.mAccessPointSecurity)) {
            return;
        }
        if (this.mAccessPointSecurity == 0) {
            this.mView.findViewById(2131231132).setVisibility(8);
            return;
        }
        this.mView.findViewById(2131231132).setVisibility(0);
        if (this.mPasswordView == null) {
            this.mPasswordView = (TextView) this.mView.findViewById(2131231103);
            this.mPasswordView.addTextChangedListener(this);
            this.mShowPassword = (CheckBox) this.mView.findViewById(2131231125);
            this.mShowPassword.setOnClickListener(this);
            this.mShowPassword.setOnCheckedChangeListener(new 1(this));
            if (!(this.mAccessPoint == null || this.mAccessPoint.networkId == -1)) {
                this.mPasswordView.setHint(2131427872);
            }
        }
        if (this.mAccessPointSecurity != 3) {
            this.mView.findViewById(2131231137).setVisibility(8);
            return;
        }
        this.mView.findViewById(2131231137).setVisibility(0);
        if (this.mEapMethodSpinner == null) {
            this.mEapMethodSpinner = (Spinner) this.mView.findViewById(2131231138);
            this.mEapMethodSpinner.setOnItemSelectedListener(this);
            this.mPhase2Spinner = (Spinner) this.mView.findViewById(2131231139);
            this.mEapCaCertSpinner = (Spinner) this.mView.findViewById(2131231140);
            this.mEapUserCertSpinner = (Spinner) this.mView.findViewById(2131231141);
            this.mEapIdentityView = (TextView) this.mView.findViewById(2131231142);
            this.mEapAnonymousView = (TextView) this.mView.findViewById(2131231143);
            loadCertificates(this.mEapCaCertSpinner, "CACERT_");
            loadCertificates(this.mEapUserCertSpinner, "USRPKEY_");
            if (this.mAccessPoint == null || this.mAccessPoint.networkId == -1) {
                this.mEapMethodSpinner.setSelection(0);
                showEapFieldsByMethod(0);
                return;
            }
            WifiEnterpriseConfig wifiEnterpriseConfig = this.mAccessPoint.getConfig().enterpriseConfig;
            int eapMethod = wifiEnterpriseConfig.getEapMethod();
            int phase2Method = wifiEnterpriseConfig.getPhase2Method();
            this.mEapMethodSpinner.setSelection(eapMethod);
            showEapFieldsByMethod(eapMethod);
            switch (eapMethod) {
                case 0:
                    switch (phase2Method) {
                        case 0:
                            this.mPhase2Spinner.setSelection(0);
                            break;
                        case 3:
                            this.mPhase2Spinner.setSelection(1);
                            break;
                        case 4:
                            this.mPhase2Spinner.setSelection(2);
                            break;
                        default:
                            Log.e("WifiConfigController", "Invalid phase 2 method " + phase2Method);
                            break;
                    }
                default:
                    this.mPhase2Spinner.setSelection(phase2Method);
                    break;
            }
            setSelection(this.mEapCaCertSpinner, wifiEnterpriseConfig.getCaCertificateAlias());
            setSelection(this.mEapUserCertSpinner, wifiEnterpriseConfig.getClientCertificateAlias());
            this.mEapIdentityView.setText(wifiEnterpriseConfig.getIdentity());
            this.mEapAnonymousView.setText(wifiEnterpriseConfig.getAnonymousIdentity());
            return;
        }
        showEapFieldsByMethod(this.mEapMethodSpinner.getSelectedItemPosition());
    }

    private int validateIpConfigFields(LinkProperties linkProperties) {
        if (this.mIpAddressView == null) {
            return 0;
        }
        String ipAddr = this.mIpAddressView.getText().toString();
        if (TextUtils.isEmpty(ipAddr)) {
            return 2131427920;
        }
        InetAddress inetAddr = null;
        try {
            inetAddr = NetworkUtils.numericToInetAddress(ipAddr);
            int networkPrefixLength = -1;
            try {
                networkPrefixLength = Integer.parseInt(this.mNetworkPrefixLengthView.getText().toString());
                if (networkPrefixLength < 0 || networkPrefixLength > 32) {
                    return 2131427923;
                }
                linkProperties.addLinkAddress(new LinkAddress(inetAddr, networkPrefixLength));
                String gateway = this.mGatewayView.getText().toString();
                if (TextUtils.isEmpty(gateway)) {
                    try {
                        byte[] address = NetworkUtils.getNetworkPart(inetAddr, networkPrefixLength).getAddress();
                        address[address.length - 1] = (byte) 1;
                        this.mGatewayView.setText(InetAddress.getByAddress(address).getHostAddress());
                    } catch (RuntimeException e) {
                    } catch (UnknownHostException e2) {
                    }
                } else {
                    try {
                        linkProperties.addRoute(new RouteInfo(NetworkUtils.numericToInetAddress(gateway)));
                    } catch (IllegalArgumentException e3) {
                        return 2131427921;
                    }
                }
                String obj = this.mDns1View.getText().toString();
                if (TextUtils.isEmpty(obj)) {
                    this.mDns1View.setText(this.mConfigUi.getContext().getString(2131427925));
                } else {
                    try {
                        linkProperties.addDns(NetworkUtils.numericToInetAddress(obj));
                    } catch (IllegalArgumentException e4) {
                        return 2131427922;
                    }
                }
                if (this.mDns2View.length() > 0) {
                    try {
                        linkProperties.addDns(NetworkUtils.numericToInetAddress(this.mDns2View.getText().toString()));
                    } catch (IllegalArgumentException e5) {
                        return 2131427922;
                    }
                }
                return 0;
            } catch (NumberFormatException e6) {
                this.mNetworkPrefixLengthView.setText(this.mConfigUi.getContext().getString(2131427931));
            }
        } catch (IllegalArgumentException e7) {
            return 2131427920;
        }
    }

    private void showIpConfigFields() {
        this.mView.findViewById(2131231152).setVisibility(0);
        WifiConfiguration config = (this.mAccessPoint == null || this.mAccessPoint.networkId == -1) ? null : this.mAccessPoint.getConfig();
        if (this.mIpSettingsSpinner.getSelectedItemPosition() == 1) {
            this.mView.findViewById(2131231154).setVisibility(0);
            if (this.mIpAddressView == null) {
                this.mIpAddressView = (TextView) this.mView.findViewById(2131231155);
                this.mIpAddressView.addTextChangedListener(this);
                this.mGatewayView = (TextView) this.mView.findViewById(2131231156);
                this.mGatewayView.addTextChangedListener(this);
                this.mNetworkPrefixLengthView = (TextView) this.mView.findViewById(2131231157);
                this.mNetworkPrefixLengthView.addTextChangedListener(this);
                this.mDns1View = (TextView) this.mView.findViewById(2131231158);
                this.mDns1View.addTextChangedListener(this);
                this.mDns2View = (TextView) this.mView.findViewById(2131231159);
                this.mDns2View.addTextChangedListener(this);
            }
            if (config != null) {
                LinkProperties linkProperties = config.linkProperties;
                Iterator it = linkProperties.getLinkAddresses().iterator();
                if (it.hasNext()) {
                    LinkAddress linkAddress = (LinkAddress) it.next();
                    this.mIpAddressView.setText(linkAddress.getAddress().getHostAddress());
                    this.mNetworkPrefixLengthView.setText(Integer.toString(linkAddress.getNetworkPrefixLength()));
                }
                for (RouteInfo routeInfo : linkProperties.getRoutes()) {
                    if (routeInfo.isDefaultRoute()) {
                        this.mGatewayView.setText(routeInfo.getGateway().getHostAddress());
                        break;
                    }
                }
                Iterator it2 = linkProperties.getDnses().iterator();
                if (it2.hasNext()) {
                    this.mDns1View.setText(((InetAddress) it2.next()).getHostAddress());
                }
                if (it2.hasNext()) {
                    this.mDns2View.setText(((InetAddress) it2.next()).getHostAddress());
                    return;
                }
                return;
            }
            return;
        }
        this.mView.findViewById(2131231154).setVisibility(8);
    }

    private void showEapFieldsByMethod(int i) {
        this.mView.findViewById(2131231160).setVisibility(0);
        this.mView.findViewById(2131231164).setVisibility(0);
        this.mView.findViewById(2131231162).setVisibility(0);
        this.mView.findViewById(2131231134).setVisibility(0);
        this.mView.findViewById(2131231166).setVisibility(0);
        this.mConfigUi.getContext();
        switch (i) {
            case 0:
                if (this.mPhase2Adapter != this.PHASE2_PEAP_ADAPTER) {
                    this.mPhase2Adapter = this.PHASE2_PEAP_ADAPTER;
                    this.mPhase2Spinner.setAdapter(this.mPhase2Adapter);
                }
                this.mView.findViewById(2131231161).setVisibility(0);
                this.mView.findViewById(2131231165).setVisibility(0);
                setUserCertInvisible();
                return;
            case 1:
                this.mView.findViewById(2131231163).setVisibility(0);
                setPhase2Invisible();
                setAnonymousIdentInvisible();
                setPasswordInvisible();
                return;
            case 2:
                if (this.mPhase2Adapter != this.PHASE2_FULL_ADAPTER) {
                    this.mPhase2Adapter = this.PHASE2_FULL_ADAPTER;
                    this.mPhase2Spinner.setAdapter(this.mPhase2Adapter);
                }
                this.mView.findViewById(2131231161).setVisibility(0);
                this.mView.findViewById(2131231165).setVisibility(0);
                setUserCertInvisible();
                return;
            case 3:
                setPhase2Invisible();
                setCaCertInvisible();
                setAnonymousIdentInvisible();
                setUserCertInvisible();
                return;
            default:
                return;
        }
    }

    private boolean ipAndProxyFieldsAreValid() {
        this.mLinkProperties.clear();
        IpAssignment ipAssignment = (this.mIpSettingsSpinner == null || this.mIpSettingsSpinner.getSelectedItemPosition() != 1) ? IpAssignment.DHCP : IpAssignment.STATIC;
        this.mIpAssignment = ipAssignment;
        if (this.mIpAssignment == IpAssignment.STATIC && validateIpConfigFields(this.mLinkProperties) != 0) {
            return false;
        }
        ProxySettings proxySettings = (this.mProxySettingsSpinner == null || this.mProxySettingsSpinner.getSelectedItemPosition() != 1) ? ProxySettings.NONE : ProxySettings.STATIC;
        this.mProxySettings = proxySettings;
        if (this.mProxySettings == ProxySettings.STATIC && this.mProxyHostView != null) {
            int result;
            String host = this.mProxyHostView.getText().toString();
            String portStr = this.mProxyPortView.getText().toString();
            String exclusionList = this.mProxyExclusionListView.getText().toString();
            int port = 0;
            try {
                port = Integer.parseInt(portStr);
                result = ProxySelector.validate(host, portStr, exclusionList);
            } catch (NumberFormatException e) {
                result = 2131427501;
            }
            if (result != 0) {
                return false;
            }
            this.mLinkProperties.setHttpProxy(new ProxyProperties(host, port, exclusionList));
        }
        return true;
    }

    private void showProxyFields() {
        this.mView.findViewById(2131231144).setVisibility(0);
        WifiConfiguration config = (this.mAccessPoint == null || this.mAccessPoint.networkId == -1) ? null : this.mAccessPoint.getConfig();
        if (this.mProxySettingsSpinner.getSelectedItemPosition() == 1) {
            this.mView.findViewById(2131231147).setVisibility(0);
            this.mView.findViewById(2131231148).setVisibility(0);
            if (this.mProxyHostView == null) {
                this.mProxyHostView = (TextView) this.mView.findViewById(2131231149);
                this.mProxyHostView.addTextChangedListener(this);
                this.mProxyPortView = (TextView) this.mView.findViewById(2131231150);
                this.mProxyPortView.addTextChangedListener(this);
                this.mProxyExclusionListView = (TextView) this.mView.findViewById(2131231151);
                this.mProxyExclusionListView.addTextChangedListener(this);
            }
            if (config != null) {
                ProxyProperties httpProxy = config.linkProperties.getHttpProxy();
                if (httpProxy != null) {
                    this.mProxyHostView.setText(httpProxy.getHost());
                    this.mProxyPortView.setText(Integer.toString(httpProxy.getPort()));
                    this.mProxyExclusionListView.setText(httpProxy.getExclusionList());
                    return;
                }
                return;
            }
            return;
        }
        this.mView.findViewById(2131231147).setVisibility(8);
        this.mView.findViewById(2131231148).setVisibility(8);
    }

    void enableSubmitIfAppropriate() {
        Button submit = this.mConfigUi.getSubmitButton();
        if (submit != null) {
            boolean passwordInvalid = false;
            if (this.mPasswordView != null && ((this.mAccessPointSecurity == 1 && this.mPasswordView.length() == 0) || (this.mAccessPointSecurity == 2 && this.mPasswordView.length() < 8))) {
                passwordInvalid = true;
            }
            boolean enabled = ((this.mSsidView == null || this.mSsidView.length() != 0) && !((this.mAccessPoint == null || this.mAccessPoint.networkId == -1) && passwordInvalid)) ? ipAndProxyFieldsAreValid() : false;
            submit.setEnabled(enabled);
        }
    }

    private void loadCertificates(Spinner spinner, String str) {
        Context context = this.mConfigUi.getContext();
        String[] certs = KeyStore.getInstance().saw(str, 1010);
        if (certs == null || certs.length == 0) {
            certs = new String[]{this.unspecifiedCert};
        } else {
            String[] array = new String[(certs.length + 1)];
            array[0] = this.unspecifiedCert;
            System.arraycopy(certs, 0, array, 1, certs.length);
            certs = array;
        }
        ArrayAdapter arrayAdapter = new ArrayAdapter(context, 17367048, certs);
        arrayAdapter.setDropDownViewResource(17367049);
        spinner.setAdapter(arrayAdapter);
    }

    public void onItemSelected(AdapterView<?> parent, View view, int i, long j) {
        if (parent == this.mSecuritySpinner) {
            this.mAccessPointSecurity = i;
            showSecurityFields();
        } else if (parent == this.mEapMethodSpinner) {
            showSecurityFields();
        } else if (parent == this.mProxySettingsSpinner) {
            showProxyFields();
        } else {
            showIpConfigFields();
        }
        enableSubmitIfAppropriate();
    }

    private void setSelection(Spinner spinner, String str) {
        if (str != null) {
            ArrayAdapter<String> adapter = (ArrayAdapter) spinner.getAdapter();
            for (int i = adapter.getCount() - 1; i >= 0; i--) {
                if (str.equals(adapter.getItem(i))) {
                    spinner.setSelection(i);
                    return;
                }
            }
        }
    }

    public void onClick(View view) {
        if (view.getId() == 2131231125) {
            updatePasswordVisibility(((CheckBox) view).isChecked());
        } else if (view.getId() != 2131231168) {
        } else {
            if (((CheckBox) view).isChecked()) {
                this.mView.findViewById(2131231169).setVisibility(0);
            } else {
                this.mView.findViewById(2131231169).setVisibility(8);
            }
        }
    }

    private void updatePasswordVisibility(boolean z) {
        int pos = this.mPasswordView.getSelectionEnd();
        this.mPasswordView.setInputType((z ? 144 : 128) | 1);
        if (pos >= 0) {
            ((EditText) this.mPasswordView).setSelection(pos);
        }
    }

    private void addRow(ViewGroup viewGroup, int i, String str) {
        View row = this.mConfigUi.getLayoutInflater().inflate(2130968720, viewGroup, false);
        ((TextView) row.findViewById(2131230834)).setText(i);
        ((TextView) row.findViewById(2131230919)).setText(str);
        viewGroup.addView(row);
    }

    private void setPasswordInvisible() {
        this.mPasswordView.setText("");
        this.mView.findViewById(2131231134).setVisibility(8);
        this.mView.findViewById(2131231166).setVisibility(8);
    }

    private void setAnonymousIdentInvisible() {
        this.mView.findViewById(2131231165).setVisibility(8);
        this.mEapAnonymousView.setText("");
    }

    private void setCaCertInvisible() {
        this.mView.findViewById(2131231162).setVisibility(8);
        this.mEapCaCertSpinner.setSelection(0);
    }

    private void setPhase2Invisible() {
        this.mView.findViewById(2131231161).setVisibility(8);
        this.mPhase2Spinner.setSelection(0);
    }

    private void setUserCertInvisible() {
        this.mView.findViewById(2131231163).setVisibility(8);
        this.mEapUserCertSpinner.setSelection(0);
    }

    public void afterTextChanged(Editable editable) {
        this.mTextViewChangedHandler.post(new 1(this));
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    public boolean isEdit() {
        return this.mEdit;
    }

    public void onNothingSelected(AdapterView<?> adapterView) {
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}