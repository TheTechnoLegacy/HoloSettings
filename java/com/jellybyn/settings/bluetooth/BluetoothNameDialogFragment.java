package com.jellybyn.settings.bluetooth;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public final class BluetoothNameDialogFragment extends DialogFragment implements TextWatcher {
    private AlertDialog mAlertDialog;
    private boolean mDeviceNameEdited;
    private boolean mDeviceNameUpdated;
    EditText mDeviceNameView;
    final LocalBluetoothAdapter mLocalAdapter = LocalBluetoothManager.getInstance(getActivity()).getBluetoothAdapter();
    private Button mOkButton;
    private final BroadcastReceiver mReceiver = new 1(this);

    public void onResume() {
        super.onResume();
        if (this.mOkButton == null) {
            this.mOkButton = this.mAlertDialog.getButton(-1);
            this.mOkButton.setEnabled(this.mDeviceNameEdited);
        }
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        filter.addAction("android.bluetooth.adapter.action.LOCAL_NAME_CHANGED");
        getActivity().registerReceiver(this.mReceiver, filter);
    }

    private View createDialogView(String str) {
        View view = ((LayoutInflater) getActivity().getSystemService("layout_inflater")).inflate(2130968624, null);
        this.mDeviceNameView = (EditText) view.findViewById(2131230837);
        this.mDeviceNameView.setFilters(new InputFilter[]{new Utf8ByteLengthFilter(248)});
        this.mDeviceNameView.setText(str);
        this.mDeviceNameView.addTextChangedListener(this);
        this.mDeviceNameView.setOnEditorActionListener(new 1(this));
        return view;
    }

    public void afterTextChanged(Editable editable) {
        boolean z = true;
        if (this.mDeviceNameUpdated) {
            this.mDeviceNameUpdated = false;
            this.mOkButton.setEnabled(false);
            return;
        }
        this.mDeviceNameEdited = true;
        if (this.mOkButton != null) {
            Button button = this.mOkButton;
            if (editable.length() == 0) {
                z = false;
            }
            button.setEnabled(z);
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        String deviceName = this.mLocalAdapter.getName();
        if (bundle != null) {
            deviceName = bundle.getString("device_name", deviceName);
            this.mDeviceNameEdited = bundle.getBoolean("device_name_edited", false);
        }
        this.mAlertDialog = new Builder(getActivity()).setIcon(17301659).setTitle(2131427435).setView(createDialogView(deviceName)).setPositiveButton(2131427436, new 1(this)).setNegativeButton(17039360, null).create();
        this.mAlertDialog.getWindow().setSoftInputMode(5);
        return this.mAlertDialog;
    }

    public void onDestroy() {
        super.onDestroy();
        this.mAlertDialog = null;
        this.mDeviceNameView = null;
        this.mOkButton = null;
    }

    void updateDeviceName() {
        if (this.mLocalAdapter != null && this.mLocalAdapter.isEnabled()) {
            this.mDeviceNameUpdated = true;
            this.mDeviceNameEdited = false;
            this.mDeviceNameView.setText(this.mLocalAdapter.getName());
        }
    }

    private void setDeviceName(String str) {
        Log.d("BluetoothNameDialogFragment", "Setting device name to " + str);
        this.mLocalAdapter.setName(str);
    }

    public void onPause() {
        super.onPause();
        getActivity().unregisterReceiver(this.mReceiver);
    }

    public void onSaveInstanceState(Bundle bundle) {
        bundle.putString("device_name", this.mDeviceNameView.getText().toString());
        bundle.putBoolean("device_name_edited", this.mDeviceNameEdited);
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}