package com.jellybyn.settings.bluetooth;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.BroadcastReceiver;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;

public class RequestPermissionActivity extends Activity implements OnClickListener {
    private AlertDialog mDialog;
    private boolean mEnableOnly;
    private LocalBluetoothAdapter mLocalAdapter;
    private boolean mNeededToEnableBluetooth;
    private final BroadcastReceiver mReceiver = new 1(this);
    private int mTimeout = 120;
    private boolean mUserConfirmed;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (parseIntent()) {
            finish();
            return;
        }
        int state = this.mLocalAdapter.getState();
        switch (state) {
            case 10:
            case 11:
            case 13:
                registerReceiver(this.mReceiver, new IntentFilter("android.bluetooth.adapter.action.STATE_CHANGED"));
                Intent intent = new Intent();
                intent.setClass(this, RequestPermissionHelperActivity.class);
                if (this.mEnableOnly) {
                    intent.setAction("com.jellybyn.settings.bluetooth.ACTION_INTERNAL_REQUEST_BT_ON");
                } else {
                    intent.setAction("com.jellybyn.settings.bluetooth.ACTION_INTERNAL_REQUEST_BT_ON_AND_DISCOVERABLE");
                    intent.putExtra("android.bluetooth.adapter.extra.DISCOVERABLE_DURATION", this.mTimeout);
                }
                startActivityForResult(intent, 1);
                this.mNeededToEnableBluetooth = true;
                return;
            case 12:
                if (this.mEnableOnly) {
                    proceedAndFinish();
                    return;
                } else {
                    createDialog();
                    return;
                }
            default:
                Log.e("RequestPermissionActivity", "Unknown adapter state: " + state);
                return;
        }
    }

    private boolean parseIntent() {
        Intent intent = getIntent();
        if (intent != null && intent.getAction().equals("android.bluetooth.adapter.action.REQUEST_ENABLE")) {
            this.mEnableOnly = true;
        } else if (intent == null || !intent.getAction().equals("android.bluetooth.adapter.action.REQUEST_DISCOVERABLE")) {
            Log.e("RequestPermissionActivity", "Error: this activity may be started only with intent android.bluetooth.adapter.action.REQUEST_ENABLE or android.bluetooth.adapter.action.REQUEST_DISCOVERABLE");
            setResult(0);
            return true;
        } else {
            this.mTimeout = intent.getIntExtra("android.bluetooth.adapter.extra.DISCOVERABLE_DURATION", 120);
            Log.d("RequestPermissionActivity", "Setting Bluetooth Discoverable Timeout = " + this.mTimeout);
            if (this.mTimeout < 0 || this.mTimeout > 3600) {
                this.mTimeout = 120;
            }
        }
        LocalBluetoothManager manager = LocalBluetoothManager.getInstance(this);
        if (manager == null) {
            Log.e("RequestPermissionActivity", "Error: there's a problem starting Bluetooth");
            setResult(0);
            return true;
        }
        this.mLocalAdapter = manager.getBluetoothAdapter();
        return false;
    }

    private void proceedAndFinish() {
        int returnCode;
        if (this.mEnableOnly) {
            returnCode = -1;
        } else if (this.mLocalAdapter.setScanMode(23, this.mTimeout)) {
            long currentTimeMillis = System.currentTimeMillis() + (((long) this.mTimeout) * 1000);
            LocalBluetoothPreferences.persistDiscoverableEndTimestamp(this, currentTimeMillis);
            if (this.mTimeout > 0) {
                BluetoothDiscoverableTimeoutReceiver.setDiscoverableAlarm(this, currentTimeMillis);
            }
            returnCode = this.mTimeout;
            if (returnCode < 1) {
                returnCode = 1;
            }
        } else {
            returnCode = 0;
        }
        if (this.mDialog != null) {
            this.mDialog.dismiss();
        }
        setResult(returnCode);
        finish();
    }

    private void createDialog() {
        Builder builder = new Builder(this);
        if (this.mNeededToEnableBluetooth) {
            builder.setMessage(getString(2131427464));
            builder.setCancelable(false);
        } else {
            if (this.mTimeout == 0) {
                builder.setMessage(getString(2131427461));
            } else {
                builder.setMessage(getString(2131427460, new Object[]{Integer.valueOf(this.mTimeout)}));
            }
            builder.setPositiveButton(getString(2131427337), this);
            builder.setNegativeButton(getString(2131427338), this);
        }
        this.mDialog = builder.create();
        this.mDialog.show();
        if (getResources().getBoolean(2131296260)) {
            onClick(null, -1);
        }
    }

    protected void onActivityResult(int i, int i2, Intent intent) {
        if (i != 1) {
            Log.e("RequestPermissionActivity", "Unexpected onActivityResult " + i + ' ' + i2);
            setResult(0);
            finish();
        } else if (i2 != -1000) {
            setResult(i2);
            finish();
        } else {
            this.mUserConfirmed = true;
            if (this.mLocalAdapter.getBluetoothState() == 12) {
                proceedAndFinish();
            } else {
                createDialog();
            }
        }
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        switch (i) {
            case -2:
                setResult(0);
                finish();
                return;
            case -1:
                proceedAndFinish();
                return;
            default:
                return;
        }
    }

    protected void onDestroy() {
        super.onDestroy();
        if (this.mNeededToEnableBluetooth) {
            unregisterReceiver(this.mReceiver);
        }
    }

    public void onBackPressed() {
        setResult(0);
        super.onBackPressed();
    }
}