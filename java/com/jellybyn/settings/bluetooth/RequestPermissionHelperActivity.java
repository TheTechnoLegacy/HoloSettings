package com.jellybyn.settings.bluetooth;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController.AlertParams;

public class RequestPermissionHelperActivity extends AlertActivity implements OnClickListener {
    private boolean mEnableOnly;
    private LocalBluetoothAdapter mLocalAdapter;
    private int mTimeout;

    public void onClick(DialogInterface dialogInterface, int i) {
        int i2;
        switch (i) {
            case -2:
                i2 = 0;
                break;
            case -1:
                int btState = 0;
                int retryCount = 30;
                do {
                    try {
                        btState = this.mLocalAdapter.getBluetoothState();
                        Thread.sleep(100);
                        if (btState == 13) {
                            retryCount--;
                        }
                    } catch (InterruptedException e) {
                    }
                    if (btState == 11 && btState != 12 && !this.mLocalAdapter.enable()) {
                        i2 = 0;
                        break;
                    } else {
                        i2 = -1000;
                        break;
                    }
                } while (retryCount > 0);
                if (btState == 11) {
                    break;
                }
                i2 = -1000;
            default:
                return;
        }
        setResult(i2);
    }

    private boolean parseIntent() {
        Intent intent = getIntent();
        if (intent != null && intent.getAction().equals("com.jellybyn.settings.bluetooth.ACTION_INTERNAL_REQUEST_BT_ON")) {
            this.mEnableOnly = true;
        } else if (intent == null || !intent.getAction().equals("com.jellybyn.settings.bluetooth.ACTION_INTERNAL_REQUEST_BT_ON_AND_DISCOVERABLE")) {
            setResult(0);
            return true;
        } else {
            this.mEnableOnly = false;
            this.mTimeout = intent.getIntExtra("android.bluetooth.adapter.extra.DISCOVERABLE_DURATION", 120);
        }
        LocalBluetoothManager manager = LocalBluetoothManager.getInstance(this);
        if (manager == null) {
            Log.e("RequestPermissionHelperActivity", "Error: there's a problem starting Bluetooth");
            setResult(0);
            return true;
        }
        this.mLocalAdapter = manager.getBluetoothAdapter();
        return false;
    }

    void createDialog() {
        AlertParams p = this.mAlertParams;
        if (this.mEnableOnly) {
            p.mMessage = getString(2131427459);
        } else if (this.mTimeout == 0) {
            p.mMessage = getString(2131427463);
        } else {
            p.mMessage = getString(2131427462, new Object[]{Integer.valueOf(this.mTimeout)});
        }
        p.mPositiveButtonText = getString(2131427337);
        p.mPositiveButtonListener = this;
        p.mNegativeButtonText = getString(2131427338);
        p.mNegativeButtonListener = this;
        setupAlert();
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (parseIntent()) {
            finish();
            return;
        }
        createDialog();
        if (getResources().getBoolean(2131296260)) {
            onClick(null, -1);
            dismiss();
        }
    }

    public void onBackPressed() {
        setResult(0);
        super.onBackPressed();
    }
}