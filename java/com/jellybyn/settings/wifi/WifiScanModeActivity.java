package com.jellybyn.settings.wifi;

import android.app.Activity;
import android.app.DialogFragment;
import android.content.Intent;
import android.os.Bundle;
import android.provider.Settings.Global;

public class WifiScanModeActivity extends Activity {
    private String mApp;
    private DialogFragment mDialog;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (bundle != null) {
            this.mApp = bundle.getString("app");
        } else if (intent == null || !intent.getAction().equals("android.net.wifi.action.REQUEST_SCAN_ALWAYS_AVAILABLE")) {
            finish();
            return;
        } else {
            this.mApp = getCallingPackage();
        }
        createDialog();
    }

    private void createDialog() {
        if (this.mDialog == null) {
            this.mDialog = AlertDialogFragment.newInstance(this.mApp);
            this.mDialog.show(getFragmentManager(), "dialog");
        }
    }

    private void dismissDialog() {
        if (this.mDialog != null) {
            this.mDialog.dismiss();
            this.mDialog = null;
        }
    }

    private void doPositiveClick() {
        Global.putInt(getContentResolver(), "wifi_scan_always_enabled", 1);
        setResult(-1);
        finish();
    }

    private void doNegativeClick() {
        setResult(0);
        finish();
    }

    public void onPause() {
        super.onPause();
        dismissDialog();
    }

    public void onResume() {
        super.onResume();
        createDialog();
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putString("app", this.mApp);
    }
}