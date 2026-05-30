package com.jellybyn.settings;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.Fragment;
import android.app.admin.DevicePolicyManager;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.ProxyProperties;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import com.jellybyn.settings.SettingsPreferenceFragment.SettingsDialogFragment;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ProxySelector extends Fragment implements DialogCreatable {
    private static final Pattern EXCLUSION_PATTERN = Pattern.compile("$|^(\\*)?\\.?[a-zA-Z0-9\\_]+(\\-[a-zA-Z0-9\\_]+)*(\\.[a-zA-Z0-9\\_]+(\\-[a-zA-Z0-9\\_]+)*)*$");
    private static final Pattern HOSTNAME_PATTERN = Pattern.compile("^$|^[a-zA-Z0-9\\_]+(\\-[a-zA-Z0-9\\_]+)*(\\.[a-zA-Z0-9\\_]+(\\-[a-zA-Z0-9\\_]+)*)*$");
    Button mClearButton;
    OnClickListener mClearHandler = new 2(this);
    Button mDefaultButton;
    OnClickListener mDefaultHandler = new 3(this);
    private SettingsDialogFragment mDialogFragment;
    EditText mExclusionListField;
    EditText mHostnameField;
    Button mOKButton;
    OnClickListener mOKHandler = new 1(this);
    OnFocusChangeListener mOnFocusChangeHandler = new 4(this);
    EditText mPortField;
    private View mView;

    void populateFields() {
        Activity activity = getActivity();
        String hostname = "";
        int port = -1;
        String exclList = "";
        ProxyProperties proxy = ((ConnectivityManager) getActivity().getSystemService("connectivity")).getGlobalProxy();
        if (proxy != null) {
            hostname = proxy.getHost();
            port = proxy.getPort();
            exclList = proxy.getExclusionList();
        }
        if (hostname == null) {
            hostname = "";
        }
        this.mHostnameField.setText(hostname);
        this.mPortField.setText(port == -1 ? "" : Integer.toString(port));
        this.mExclusionListField.setText(exclList);
        Intent intent = activity.getIntent();
        String stringExtra = intent.getStringExtra("button-label");
        if (!TextUtils.isEmpty(stringExtra)) {
            this.mOKButton.setText(stringExtra);
        }
        String stringExtra2 = intent.getStringExtra("title");
        if (!TextUtils.isEmpty(stringExtra2)) {
            activity.setTitle(stringExtra2);
        }
    }

    public static int validate(String str, String str2, String str3) {
        Matcher match = HOSTNAME_PATTERN.matcher(str);
        String[] exclListArray = str3.split(",");
        if (!match.matches()) {
            return 2131427497;
        }
        for (CharSequence matcher : exclListArray) {
            if (!EXCLUSION_PATTERN.matcher(matcher).matches()) {
                return 2131427498;
            }
        }
        if (str.length() > 0 && str2.length() == 0) {
            return 2131427499;
        }
        if (str2.length() > 0) {
            if (str.length() == 0) {
                return 2131427500;
            }
            try {
                int portVal = Integer.parseInt(str2);
                if (portVal <= 0 || portVal > 65535) {
                    return 2131427501;
                }
            } catch (NumberFormatException e) {
                return 2131427501;
            }
        }
        return 0;
    }

    boolean saveToDb() {
        String hostname = this.mHostnameField.getText().toString().trim();
        String portStr = this.mPortField.getText().toString().trim();
        String exclList = this.mExclusionListField.getText().toString().trim();
        int port = 0;
        if (validate(hostname, portStr, exclList) > 0) {
            showDialog(0);
            return false;
        }
        if (portStr.length() > 0) {
            try {
                port = Integer.parseInt(portStr);
            } catch (NumberFormatException e) {
                return false;
            }
        }
        ((ConnectivityManager) getActivity().getSystemService("connectivity")).setGlobalProxy(new ProxyProperties(hostname, port, exclList));
        return true;
    }

    private void initView(View view) {
        this.mHostnameField = (EditText) view.findViewById(2131230966);
        this.mHostnameField.setOnFocusChangeListener(this.mOnFocusChangeHandler);
        this.mPortField = (EditText) view.findViewById(2131230967);
        this.mPortField.setOnClickListener(this.mOKHandler);
        this.mPortField.setOnFocusChangeListener(this.mOnFocusChangeHandler);
        this.mExclusionListField = (EditText) view.findViewById(2131230968);
        this.mExclusionListField.setOnFocusChangeListener(this.mOnFocusChangeHandler);
        this.mOKButton = (Button) view.findViewById(2131230969);
        this.mOKButton.setOnClickListener(this.mOKHandler);
        this.mClearButton = (Button) view.findViewById(2131230970);
        this.mClearButton.setOnClickListener(this.mClearHandler);
        this.mDefaultButton = (Button) view.findViewById(2131230971);
        this.mDefaultButton.setOnClickListener(this.mDefaultHandler);
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        boolean z = ((DevicePolicyManager) getActivity().getSystemService("device_policy")).getGlobalProxyAdmin() == null;
        this.mHostnameField.setEnabled(z);
        this.mPortField.setEnabled(z);
        this.mExclusionListField.setEnabled(z);
        this.mOKButton.setEnabled(z);
        this.mClearButton.setEnabled(z);
        this.mDefaultButton.setEnabled(z);
    }

    public Dialog onCreateDialog(int i) {
        if (i != 0) {
            return null;
        }
        return new Builder(getActivity()).setTitle(2131427495).setPositiveButton(2131427496, null).setMessage(getActivity().getString(validate(this.mHostnameField.getText().toString().trim(), this.mPortField.getText().toString().trim(), this.mExclusionListField.getText().toString().trim()))).create();
    }

    private void showDialog(int i) {
        if (this.mDialogFragment != null) {
            Log.e("ProxySelector", "Old dialog fragment not null!");
        }
        this.mDialogFragment = new SettingsDialogFragment(this, i);
        this.mDialogFragment.show(getActivity().getFragmentManager(), Integer.toString(i));
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mView = layoutInflater.inflate(2130968680, viewGroup, false);
        initView(this.mView);
        populateFields();
        return this.mView;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }
}