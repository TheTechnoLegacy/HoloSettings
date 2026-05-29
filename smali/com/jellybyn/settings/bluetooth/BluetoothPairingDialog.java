package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.text.Editable;
import android.text.Html;
import android.text.InputFilter;
import android.text.InputFilter.LengthFilter;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.TextView;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController.AlertParams;
import java.util.Locale;

public final class BluetoothPairingDialog extends AlertActivity implements OnClickListener, TextWatcher, OnCheckedChangeListener {
    private BluetoothDevice mDevice;
    private Button mOkButton;
    private String mPairingKey;
    private EditText mPairingView;
    private final BroadcastReceiver mReceiver = new 1(this);
    private int mType;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (intent.getAction().equals("android.bluetooth.device.action.PAIRING_REQUEST")) {
            LocalBluetoothManager manager = LocalBluetoothManager.getInstance(this);
            if (manager == null) {
                Log.e("BluetoothPairingDialog", "Error: BluetoothAdapter not supported by system");
                finish();
                return;
            }
            CachedBluetoothDeviceManager deviceManager = manager.getCachedDeviceManager();
            this.mDevice = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            this.mType = intent.getIntExtra("android.bluetooth.device.extra.PAIRING_VARIANT", Integer.MIN_VALUE);
            switch (this.mType) {
                case 0:
                case 1:
                    createUserEntryDialog(deviceManager);
                    break;
                case 2:
                    if (intent.getIntExtra("android.bluetooth.device.extra.PAIRING_KEY", Integer.MIN_VALUE) != Integer.MIN_VALUE) {
                        this.mPairingKey = String.format(Locale.US, "%06d", new Object[]{Integer.valueOf(intent.getIntExtra("android.bluetooth.device.extra.PAIRING_KEY", Integer.MIN_VALUE))});
                        createConfirmationDialog(deviceManager);
                        break;
                    }
                    Log.e("BluetoothPairingDialog", "Invalid Confirmation Passkey received, not showing any dialog");
                    return;
                case 3:
                case 6:
                    createConsentDialog(deviceManager);
                    break;
                case 4:
                case 5:
                    if (intent.getIntExtra("android.bluetooth.device.extra.PAIRING_KEY", Integer.MIN_VALUE) != Integer.MIN_VALUE) {
                        if (this.mType == 4) {
                            this.mPairingKey = String.format("%06d", new Object[]{Integer.valueOf(pairingKey)});
                        } else {
                            this.mPairingKey = String.format("%04d", new Object[]{Integer.valueOf(pairingKey)});
                        }
                        createDisplayPasskeyOrPinDialog(deviceManager);
                        break;
                    }
                    Log.e("BluetoothPairingDialog", "Invalid Confirmation Passkey or PIN received, not showing any dialog");
                    return;
                default:
                    Log.e("BluetoothPairingDialog", "Incorrect pairing type received, not showing any dialog");
                    break;
            }
            registerReceiver(this.mReceiver, new IntentFilter("android.bluetooth.device.action.PAIRING_CANCEL"));
            registerReceiver(this.mReceiver, new IntentFilter("android.bluetooth.device.action.BOND_STATE_CHANGED"));
            return;
        }
        Log.e("BluetoothPairingDialog", "Error: this activity may be started only with intent android.bluetooth.device.action.PAIRING_REQUEST");
        finish();
    }

    private View createPinEntryView(String str) {
        int messageId1;
        int messageId2;
        int maxLength;
        View view = getLayoutInflater().inflate(2130968595, null);
        TextView messageView = (TextView) view.findViewById(2131230749);
        TextView messageView2 = (TextView) view.findViewById(2131230755);
        CheckBox alphanumericPin = (CheckBox) view.findViewById(2131230754);
        this.mPairingView = (EditText) view.findViewById(2131230752);
        this.mPairingView.addTextChangedListener(this);
        alphanumericPin.setOnCheckedChangeListener(this);
        switch (this.mType) {
            case 0:
                messageId1 = 2131427700;
                messageId2 = 2131427704;
                maxLength = 16;
                break;
            case 1:
                messageId1 = 2131427701;
                messageId2 = 2131427705;
                maxLength = 6;
                alphanumericPin.setVisibility(8);
                break;
            default:
                Log.e("BluetoothPairingDialog", "Incorrect pairing type for createPinEntryView: " + this.mType);
                return null;
        }
        messageView.setText(Html.fromHtml(getString(messageId1, new Object[]{str})));
        messageView2.setText(messageId2);
        this.mPairingView.setInputType(2);
        this.mPairingView.setFilters(new InputFilter[]{new LengthFilter(maxLength)});
        return view;
    }

    private void createDisplayPasskeyOrPinDialog(CachedBluetoothDeviceManager cachedBluetoothDeviceManager) {
        AlertParams p = this.mAlertParams;
        p.mIconId = 17301659;
        p.mTitle = getString(2131427699);
        p.mView = createView(cachedBluetoothDeviceManager);
        p.mNegativeButtonText = getString(17039360);
        p.mNegativeButtonListener = this;
        setupAlert();
        if (this.mType == 4) {
            this.mDevice.setPairingConfirmation(true);
        } else if (this.mType == 5) {
            this.mDevice.setPin(BluetoothDevice.convertPinToBytes(this.mPairingKey));
        }
    }

    private View createView(CachedBluetoothDeviceManager cachedBluetoothDeviceManager) {
        String messageText;
        View view = getLayoutInflater().inflate(2130968594, null);
        String name = cachedBluetoothDeviceManager.getName(this.mDevice);
        TextView messageView = (TextView) view.findViewById(2131230749);
        switch (this.mType) {
            case 2:
                messageText = getString(2131427706, new Object[]{name, this.mPairingKey});
                break;
            case 3:
            case 6:
                messageText = getString(2131427707, new Object[]{name});
                break;
            case 4:
            case 5:
                messageText = getString(2131427708, new Object[]{name, this.mPairingKey});
                break;
            default:
                Log.e("BluetoothPairingDialog", "Incorrect pairing type received, not creating view");
                return null;
        }
        messageView.setText(Html.fromHtml(messageText));
        return view;
    }

    private void createUserEntryDialog(CachedBluetoothDeviceManager cachedBluetoothDeviceManager) {
        AlertParams p = this.mAlertParams;
        p.mIconId = 17301659;
        p.mTitle = getString(2131427699);
        p.mView = createPinEntryView(cachedBluetoothDeviceManager.getName(this.mDevice));
        p.mPositiveButtonText = getString(17039370);
        p.mPositiveButtonListener = this;
        p.mNegativeButtonText = getString(17039360);
        p.mNegativeButtonListener = this;
        setupAlert();
        this.mOkButton = this.mAlert.getButton(-1);
        this.mOkButton.setEnabled(false);
    }

    private void onPair(String str) {
        switch (this.mType) {
            case 0:
                byte[] convertPinToBytes = BluetoothDevice.convertPinToBytes(str);
                if (convertPinToBytes != null) {
                    this.mDevice.setPin(convertPinToBytes);
                    return;
                }
                return;
            case 1:
                this.mDevice.setPasskey(Integer.parseInt(str));
                return;
            case 2:
            case 3:
                this.mDevice.setPairingConfirmation(true);
                return;
            case 4:
            case 5:
                return;
            case 6:
                this.mDevice.setRemoteOutOfBandData();
                return;
            default:
                Log.e("BluetoothPairingDialog", "Incorrect pairing type received");
                return;
        }
    }

    private void createConfirmationDialog(CachedBluetoothDeviceManager cachedBluetoothDeviceManager) {
        AlertParams p = this.mAlertParams;
        p.mIconId = 17301659;
        p.mTitle = getString(2131427699);
        p.mView = createView(cachedBluetoothDeviceManager);
        p.mPositiveButtonText = getString(2131427709);
        p.mPositiveButtonListener = this;
        p.mNegativeButtonText = getString(2131427710);
        p.mNegativeButtonListener = this;
        setupAlert();
    }

    private void createConsentDialog(CachedBluetoothDeviceManager cachedBluetoothDeviceManager) {
        AlertParams p = this.mAlertParams;
        p.mIconId = 17301659;
        p.mTitle = getString(2131427699);
        p.mView = createView(cachedBluetoothDeviceManager);
        p.mPositiveButtonText = getString(2131427709);
        p.mPositiveButtonListener = this;
        p.mNegativeButtonText = getString(2131427710);
        p.mNegativeButtonListener = this;
        setupAlert();
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        switch (i) {
            case -1:
                if (this.mPairingView != null) {
                    onPair(this.mPairingView.getText().toString());
                    return;
                } else {
                    onPair(null);
                    return;
                }
            default:
                onCancel();
                return;
        }
    }

    public void afterTextChanged(Editable editable) {
        if (this.mOkButton != null) {
            this.mOkButton.setEnabled(editable.length() > 0);
        }
    }

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        if (z) {
            this.mPairingView.setInputType(1);
        } else {
            this.mPairingView.setInputType(2);
        }
    }

    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(this.mReceiver);
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4) {
            onCancel();
        }
        return super.onKeyDown(i, keyEvent);
    }

    private void onCancel() {
        this.mDevice.cancelPairingUserInput();
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}