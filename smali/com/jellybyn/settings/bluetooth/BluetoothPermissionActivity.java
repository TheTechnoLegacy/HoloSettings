package com.jellybyn.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.TextView;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController.AlertParams;

public class BluetoothPermissionActivity extends AlertActivity implements OnClickListener, OnPreferenceChangeListener {
    private BluetoothDevice mDevice;
    private Button mOkButton;
    private BroadcastReceiver mReceiver = new 1(this);
    private boolean mReceiverRegistered = false;
    private CheckBox mRememberChoice;
    private boolean mRememberChoiceValue = false;
    private String mReturnClass = null;
    private String mReturnPackage = null;
    private View mView;
    private TextView messageView;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent i = getIntent();
        if (i.getAction().equals("android.bluetooth.device.action.CONNECTION_ACCESS_REQUEST")) {
            this.mDevice = (BluetoothDevice) i.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            this.mReturnPackage = i.getStringExtra("android.bluetooth.device.extra.PACKAGE_NAME");
            this.mReturnClass = i.getStringExtra("android.bluetooth.device.extra.CLASS_NAME");
            int requestType = i.getIntExtra("android.bluetooth.device.extra.ACCESS_REQUEST_TYPE", 2);
            if (requestType == 1) {
                showConnectionDialog();
            } else if (requestType == 2) {
                showPhonebookDialog();
            } else {
                Log.e("BluetoothPermissionActivity", "Error: bad request type: " + requestType);
                finish();
                return;
            }
            registerReceiver(this.mReceiver, new Intent("android.bluetooth.device.action.CONNECTION_ACCESS_CANCEL"));
            this.mReceiverRegistered = true;
            return;
        }
        Log.e("BluetoothPermissionActivity", "Error: this activity may be started only with intent ACTION_CONNECTION_ACCESS_REQUEST");
        finish();
    }

    private void showConnectionDialog() {
        AlertParams p = this.mAlertParams;
        p.mIconId = 17301659;
        p.mTitle = getString(2131427467);
        p.mView = createConnectionDialogView();
        p.mPositiveButtonText = getString(2131427334);
        p.mPositiveButtonListener = this;
        p.mNegativeButtonText = getString(2131427335);
        p.mNegativeButtonListener = this;
        this.mOkButton = this.mAlert.getButton(-1);
        setupAlert();
    }

    private void showPhonebookDialog() {
        AlertParams p = this.mAlertParams;
        p.mIconId = 17301659;
        p.mTitle = getString(2131427470);
        p.mView = createPhonebookDialogView();
        p.mPositiveButtonText = getString(17039379);
        p.mPositiveButtonListener = this;
        p.mNegativeButtonText = getString(17039369);
        p.mNegativeButtonListener = this;
        this.mOkButton = this.mAlert.getButton(-1);
        setupAlert();
    }

    private void sendIntentToReceiver(String str, boolean z, String str2, boolean z2) {
        Intent intent = new Intent(str);
        if (!(this.mReturnPackage == null || this.mReturnClass == null)) {
            intent.setClassName(this.mReturnPackage, this.mReturnClass);
        }
        intent.putExtra("android.bluetooth.device.extra.CONNECTION_ACCESS_RESULT", z ? 1 : 2);
        if (str2 != null) {
            intent.putExtra(str2, z2);
        }
        intent.putExtra("android.bluetooth.device.extra.DEVICE", this.mDevice);
        sendBroadcast(intent, "android.permission.BLUETOOTH_ADMIN");
    }

    private void savePhonebookPermissionChoice(int i) {
        LocalBluetoothManager bluetoothManager = LocalBluetoothManager.getInstance(this);
        CachedBluetoothDeviceManager cachedDeviceManager = bluetoothManager.getCachedDeviceManager();
        CachedBluetoothDevice cachedDevice = cachedDeviceManager.findDevice(this.mDevice);
        if (cachedDevice != null) {
            cachedDevice.setPhonebookPermissionChoice(i);
        } else {
            cachedDeviceManager.addDevice(bluetoothManager.getBluetoothAdapter(), bluetoothManager.getProfileManager(), this.mDevice).setPhonebookPermissionChoice(i);
        }
    }

    private View createPhonebookDialogView() {
        this.mView = getLayoutInflater().inflate(2130968593, null);
        this.messageView = (TextView) this.mView.findViewById(2131230749);
        this.messageView.setText(createPhonebookDisplayText());
        this.mRememberChoice = (CheckBox) this.mView.findViewById(2131230751);
        this.mRememberChoice.setChecked(false);
        this.mRememberChoice.setOnCheckedChangeListener(new 2(this));
        return this.mView;
    }

    private void onNegative() {
        Log.d("BluetoothPermissionActivity", "onNegative mRememberChoiceValue: " + this.mRememberChoiceValue);
        if (this.mRememberChoiceValue) {
            savePhonebookPermissionChoice(2);
        }
        sendIntentToReceiver("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY", false, null, false);
        finish();
    }

    private void onPositive() {
        Log.d("BluetoothPermissionActivity", "onPositive mRememberChoiceValue: " + this.mRememberChoiceValue);
        if (this.mRememberChoiceValue) {
            savePhonebookPermissionChoice(1);
        }
        sendIntentToReceiver("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY", true, "android.bluetooth.device.extra.ALWAYS_ALLOWED", this.mRememberChoiceValue);
        finish();
    }

    private String createConnectionDisplayText() {
        String aliasName = this.mDevice != null ? this.mDevice.getAliasName() : null;
        if (aliasName == null) {
            aliasName = getString(2131428364);
        }
        return getString(2131427469, new Object[]{aliasName});
    }

    private String createPhonebookDisplayText() {
        String aliasName = this.mDevice != null ? this.mDevice.getAliasName() : null;
        if (aliasName == null) {
            aliasName = getString(2131428364);
        }
        return getString(2131427471, new Object[]{aliasName, aliasName});
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        switch (i) {
            case -2:
                onNegative();
                return;
            case -1:
                onPositive();
                return;
            default:
                return;
        }
    }

    protected void onDestroy() {
        super.onDestroy();
        if (this.mReceiverRegistered) {
            unregisterReceiver(this.mReceiver);
            this.mReceiverRegistered = false;
        }
    }

    private View createConnectionDialogView() {
        this.mView = getLayoutInflater().inflate(2130968591, null);
        this.messageView = (TextView) this.mView.findViewById(2131230749);
        this.messageView.setText(createConnectionDisplayText());
        return this.mView;
    }

    private void dismissDialog() {
        dismiss();
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        return true;
    }
}