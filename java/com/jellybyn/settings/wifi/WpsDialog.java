package com.jellybyn.settings.wifi;

import android.app.AlertDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.NetworkInfo;
import android.net.NetworkInfo.DetailedState;
import android.net.wifi.WifiManager;
import android.net.wifi.WifiManager.WpsListener;
import android.net.wifi.WpsInfo;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import java.util.Timer;

public class WpsDialog extends AlertDialog {
    private Button mButton;
    private Context mContext;
    DialogState mDialogState = DialogState.WPS_INIT;
    private final IntentFilter mFilter;
    private Handler mHandler = new Handler();
    private ProgressBar mProgressBar;
    private BroadcastReceiver mReceiver;
    private TextView mTextView;
    private ProgressBar mTimeoutBar;
    private Timer mTimer;
    private View mView;
    private WifiManager mWifiManager;
    private WpsListener mWpsListener;
    private int mWpsSetup;

    protected void onCreate(Bundle bundle) {
        this.mView = getLayoutInflater().inflate(2130968727, null);
        this.mTextView = (TextView) this.mView.findViewById(2131231203);
        this.mTextView.setText(2131427844);
        this.mTimeoutBar = (ProgressBar) this.mView.findViewById(2131231204);
        this.mTimeoutBar.setMax(120);
        this.mTimeoutBar.setProgress(0);
        this.mProgressBar = (ProgressBar) this.mView.findViewById(2131231205);
        this.mProgressBar.setVisibility(8);
        this.mButton = (Button) this.mView.findViewById(2131231206);
        this.mButton.setText(2131427905);
        this.mButton.setOnClickListener(new 1WpsListener(this));
        this.mWifiManager = (WifiManager) this.mContext.getSystemService("wifi");
        setView(this.mView);
        super.onCreate(bundle);
    }

    public WpsDialog(Context context, int i) {
        super(context);
        this.mContext = context;
        this.mWpsSetup = i;
        this.mWpsListener = new 1WpsListener(this);
        this.mFilter = new IntentFilter();
        this.mFilter.addAction("android.net.wifi.STATE_CHANGE");
        this.mReceiver = new 1WpsListener(this);
    }

    private void handleEvent(Context context, Intent intent) {
        if ("android.net.wifi.STATE_CHANGE".equals(intent.getAction()) && ((NetworkInfo) intent.getParcelableExtra("networkInfo")).getDetailedState() == DetailedState.CONNECTED && this.mDialogState == DialogState.WPS_COMPLETE && this.mWifiManager.getConnectionInfo() != null) {
            updateDialog(DialogState.CONNECTED, String.format(this.mContext.getString(2131427848), new Object[]{r4.getSSID()}));
        }
    }

    protected void onStop() {
        if (this.mDialogState != DialogState.WPS_COMPLETE) {
            this.mWifiManager.cancelWps(null);
        }
        if (this.mReceiver != null) {
            this.mContext.unregisterReceiver(this.mReceiver);
            this.mReceiver = null;
        }
        if (this.mTimer != null) {
            this.mTimer.cancel();
        }
    }

    protected void onStart() {
        this.mTimer = new Timer(false);
        this.mTimer.schedule(new 1WpsListener(this), 1000, 1000);
        this.mContext.registerReceiver(this.mReceiver, this.mFilter);
        WpsInfo wpsConfig = new WpsInfo();
        wpsConfig.setup = this.mWpsSetup;
        this.mWifiManager.startWps(wpsConfig, this.mWpsListener);
    }

    private void updateDialog(DialogState dialogState, String str) {
        if (this.mDialogState.ordinal() < dialogState.ordinal()) {
            this.mDialogState = dialogState;
            this.mHandler.post(new 4(this, dialogState, str));
        }
    }
}