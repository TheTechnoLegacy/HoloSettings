package com.jellybyn.settings.wifi;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.net.wifi.WifiConfiguration;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

public class WifiApDialog extends AlertDialog implements TextWatcher, OnClickListener, OnItemSelectedListener {
    private final DialogInterface.OnClickListener mListener;
    private EditText mPassword;
    private int mSecurityTypeIndex = 0;
    private TextView mSsid;
    private View mView;
    WifiConfiguration mWifiConfig;

    protected void onCreate(Bundle bundle) {
        this.mView = getLayoutInflater().inflate(2130968715, null);
        Spinner mSecurity = (Spinner) this.mView.findViewById(2131231123);
        setView(this.mView);
        setInverseBackgroundForced(true);
        Context context = getContext();
        setTitle(2131427953);
        this.mView.findViewById(2131231083).setVisibility(0);
        this.mSsid = (TextView) this.mView.findViewById(2131231122);
        this.mPassword = (EditText) this.mView.findViewById(2131231103);
        setButton(-1, context.getString(2131427903), this.mListener);
        setButton(-2, context.getString(2131427905), this.mListener);
        if (this.mWifiConfig != null) {
            this.mSsid.setText(this.mWifiConfig.SSID);
            mSecurity.setSelection(this.mSecurityTypeIndex);
            if (this.mSecurityTypeIndex == 1 || this.mSecurityTypeIndex == 2) {
                this.mPassword.setText(this.mWifiConfig.preSharedKey);
            }
        }
        this.mSsid.addTextChangedListener(this);
        this.mPassword.addTextChangedListener(this);
        ((CheckBox) this.mView.findViewById(2131231125)).setOnClickListener(this);
        mSecurity.setOnItemSelectedListener(this);
        super.onCreate(bundle);
        showSecurityFields();
        validate();
    }

    public WifiConfiguration getConfig() {
        WifiConfiguration config = new WifiConfiguration();
        config.SSID = this.mSsid.getText().toString();
        switch (this.mSecurityTypeIndex) {
            case 0:
                config.allowedKeyManagement.set(0);
                return config;
            case 1:
                config.allowedKeyManagement.set(1);
                config.allowedAuthAlgorithms.set(0);
                if (this.mPassword.length() == 0) {
                    return config;
                }
                config.preSharedKey = this.mPassword.getText().toString();
                return config;
            case 2:
                config.allowedKeyManagement.set(4);
                config.allowedAuthAlgorithms.set(0);
                if (this.mPassword.length() == 0) {
                    return config;
                }
                config.preSharedKey = this.mPassword.getText().toString();
                return config;
            default:
                return null;
        }
    }

    public WifiApDialog(Context context, DialogInterface.OnClickListener onClickListener, WifiConfiguration wifiConfiguration) {
        super(context);
        this.mListener = onClickListener;
        this.mWifiConfig = wifiConfiguration;
        if (wifiConfiguration != null) {
            this.mSecurityTypeIndex = getSecurityTypeIndex(wifiConfiguration);
        }
    }

    public static int getSecurityTypeIndex(WifiConfiguration wifiConfiguration) {
        if (wifiConfiguration.allowedKeyManagement.get(1)) {
            return 1;
        }
        return wifiConfiguration.allowedKeyManagement.get(4) ? 2 : 0;
    }

    private void showSecurityFields() {
        if (this.mSecurityTypeIndex == 0) {
            this.mView.findViewById(2131231124).setVisibility(8);
        } else {
            this.mView.findViewById(2131231124).setVisibility(0);
        }
    }

    private void validate() {
        if ((this.mSsid == null || this.mSsid.length() != 0) && (!(this.mSecurityTypeIndex == 1 || this.mSecurityTypeIndex == 2) || this.mPassword.length() >= 8)) {
            getButton(-1).setEnabled(true);
        } else {
            getButton(-1).setEnabled(false);
        }
    }

    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long j) {
        this.mSecurityTypeIndex = i;
        showSecurityFields();
        validate();
    }

    public void onClick(View view) {
        this.mPassword.setInputType((((CheckBox) view).isChecked() ? 144 : 128) | 1);
    }

    public void afterTextChanged(Editable editable) {
        validate();
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    public void onNothingSelected(AdapterView<?> adapterView) {
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}