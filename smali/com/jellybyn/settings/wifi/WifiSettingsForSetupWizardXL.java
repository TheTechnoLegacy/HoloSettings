package com.jellybyn.settings.wifi;

import android.app.Activity;
import android.content.Intent;
import android.net.NetworkInfo.DetailedState;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import java.util.EnumMap;

public class WifiSettingsForSetupWizardXL extends Activity implements OnClickListener {
    private static final EnumMap<DetailedState, DetailedState> sNetworkStateMap = new EnumMap(DetailedState.class);
    private Button mAddNetworkButton;
    private Button mBackButton;
    private View mBottomPadding;
    private Button mConnectButton;
    private View mConnectingStatusLayout;
    private TextView mConnectingStatusView;
    private View mContentPadding;
    private CharSequence mEditingTitle;
    private InputMethodManager mInputMethodManager;
    private CharSequence mNetworkName = "";
    private DetailedState mPreviousNetworkState = DetailedState.DISCONNECTED;
    private ProgressBar mProgressBar;
    private Button mRefreshButton;
    private int mScreenState = 0;
    private Button mSkipOrNextButton;
    private TextView mTitleView;
    private View mTopDividerNoProgress;
    private View mTopPadding;
    private WifiConfigUiForSetupWizardXL mWifiConfig;
    private WifiManager mWifiManager;
    private WifiSettings mWifiSettings;
    private View mWifiSettingsFragmentLayout;

    private void initViews() {
        Intent intent = getIntent();
        if (intent.getBooleanExtra("firstRun", false)) {
            findViewById(2131230810).setSystemUiVisibility(4194304);
        }
        if (intent.getBooleanExtra("extra_prefs_landscape_lock", false)) {
            setRequestedOrientation(6);
        }
        if (intent.getBooleanExtra("extra_prefs_portrait_lock", false)) {
            setRequestedOrientation(7);
        }
        this.mTitleView = (TextView) findViewById(2131231172);
        this.mProgressBar = (ProgressBar) findViewById(2131231173);
        this.mProgressBar.setMax(2);
        this.mTopDividerNoProgress = findViewById(2131231174);
        this.mBottomPadding = findViewById(2131231184);
        this.mProgressBar.setVisibility(0);
        this.mProgressBar.setIndeterminate(true);
        this.mTopDividerNoProgress.setVisibility(8);
        this.mAddNetworkButton = (Button) findViewById(2131231186);
        this.mAddNetworkButton.setOnClickListener(this);
        this.mRefreshButton = (Button) findViewById(2131231190);
        this.mRefreshButton.setOnClickListener(this);
        this.mSkipOrNextButton = (Button) findViewById(2131231189);
        this.mSkipOrNextButton.setOnClickListener(this);
        this.mConnectButton = (Button) findViewById(2131231188);
        this.mConnectButton.setOnClickListener(this);
        this.mBackButton = (Button) findViewById(2131231187);
        this.mBackButton.setOnClickListener(this);
        this.mTopPadding = findViewById(2131231171);
        this.mContentPadding = findViewById(2131231177);
        this.mWifiSettingsFragmentLayout = findViewById(2131231178);
        this.mConnectingStatusLayout = findViewById(2131231181);
        this.mConnectingStatusView = (TextView) findViewById(2131231182);
    }

    private void onBackButtonPressed() {
        if (this.mScreenState == 2 || this.mScreenState == 3) {
            Log.d("SetupWizard", "Back button pressed after connect action.");
            this.mScreenState = 0;
            restoreFirstVisibilityState();
            this.mSkipOrNextButton.setEnabled(true);
            changeNextButtonState(false);
            showScanningState();
            for (WifiConfiguration wifiConfiguration : this.mWifiManager.getConfiguredNetworks()) {
                Log.d("SetupWizard", String.format("forgeting Wi-Fi network \"%s\" (id: %d)", new Object[]{wifiConfiguration.SSID, Integer.valueOf(wifiConfiguration.networkId)}));
                this.mWifiManager.forget(wifiConfiguration.networkId, new 1(this));
            }
            this.mWifiSettingsFragmentLayout.setVisibility(8);
            refreshAccessPoints(true);
        } else {
            this.mScreenState = 0;
            this.mWifiSettings.resumeWifiScan();
            restoreFirstVisibilityState();
            this.mAddNetworkButton.setEnabled(true);
            this.mRefreshButton.setEnabled(true);
            this.mSkipOrNextButton.setEnabled(true);
            showDisconnectedProgressBar();
            this.mWifiSettingsFragmentLayout.setVisibility(0);
            this.mBottomPadding.setVisibility(8);
        }
        setPaddingVisibility(0);
        this.mConnectingStatusLayout.setVisibility(8);
        ViewGroup viewGroup = (ViewGroup) findViewById(2131231180);
        viewGroup.removeAllViews();
        viewGroup.setVisibility(8);
        this.mWifiConfig = null;
    }

    boolean initSecurityFields(View view, int i) {
        view.findViewById(2131231127).setVisibility(8);
        view.findViewById(2131231128).setVisibility(8);
        view.findViewById(2131231130).setVisibility(0);
        view.findViewById(2131231131).setVisibility(0);
        if (i == 3) {
            setPaddingVisibility(0);
            hideSoftwareKeyboard();
            if (view.findViewById(2131231129).getVisibility() == 0) {
                view.findViewById(2131231128).setVisibility(0);
            } else {
                view.findViewById(2131231127).setVisibility(0);
            }
            view.findViewById(2131231132).setVisibility(8);
            view.findViewById(2131231130).setVisibility(8);
            view.findViewById(2131231131).setVisibility(8);
            onEapNetworkSelected();
            return false;
        }
        this.mConnectButton.setVisibility(0);
        setPaddingVisibility(8);
        if (this.mWifiConfig != null) {
            if (i == 2 || i == 1) {
                this.mWifiConfig.requestFocusAndShowKeyboard(2131231103);
            } else {
                this.mWifiConfig.requestFocusAndShowKeyboard(2131231122);
            }
        }
        return true;
    }

    public void onClick(View view) {
        hideSoftwareKeyboard();
        if (view == this.mAddNetworkButton) {
            Log.d("SetupWizard", "AddNetwork button pressed");
            onAddNetworkButtonPressed();
        } else if (view == this.mRefreshButton) {
            Log.d("SetupWizard", "Refresh button pressed");
            refreshAccessPoints(true);
        } else if (view == this.mSkipOrNextButton) {
            Log.d("SetupWizard", "Skip/Next button pressed");
            if (TextUtils.equals(getString(2131428824), ((Button) view).getText())) {
                this.mWifiManager.setWifiEnabled(false);
                setResult(1);
            } else {
                setResult(-1);
            }
            finish();
        } else if (view == this.mConnectButton) {
            Log.d("SetupWizard", "Connect button pressed");
            onConnectButtonPressed();
        } else if (view == this.mBackButton) {
            Log.d("SetupWizard", "Back button pressed");
            onBackButtonPressed();
        }
    }

    void onConnectButtonPressed() {
        this.mScreenState = 2;
        this.mWifiSettings.submit(this.mWifiConfig.getController());
        showConnectingState();
        this.mBackButton.setVisibility(0);
        this.mBackButton.setText(2131428826);
        ((ViewGroup) findViewById(2131231180)).setVisibility(8);
        this.mConnectingStatusLayout.setVisibility(0);
        this.mConnectingStatusView.setText(2131428842);
        this.mSkipOrNextButton.setVisibility(0);
        this.mSkipOrNextButton.setEnabled(false);
        this.mConnectButton.setVisibility(8);
        this.mAddNetworkButton.setVisibility(8);
        this.mRefreshButton.setVisibility(8);
    }

    static {
        sNetworkStateMap.put(DetailedState.IDLE, DetailedState.DISCONNECTED);
        sNetworkStateMap.put(DetailedState.SCANNING, DetailedState.SCANNING);
        sNetworkStateMap.put(DetailedState.CONNECTING, DetailedState.CONNECTING);
        sNetworkStateMap.put(DetailedState.AUTHENTICATING, DetailedState.CONNECTING);
        sNetworkStateMap.put(DetailedState.OBTAINING_IPADDR, DetailedState.CONNECTING);
        sNetworkStateMap.put(DetailedState.CONNECTED, DetailedState.CONNECTED);
        sNetworkStateMap.put(DetailedState.SUSPENDED, DetailedState.SUSPENDED);
        sNetworkStateMap.put(DetailedState.DISCONNECTING, DetailedState.DISCONNECTED);
        sNetworkStateMap.put(DetailedState.DISCONNECTED, DetailedState.DISCONNECTED);
        sNetworkStateMap.put(DetailedState.FAILED, DetailedState.FAILED);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(2130968724);
        this.mWifiManager = (WifiManager) getSystemService("wifi");
        this.mWifiManager.setWifiEnabled(true);
        this.mWifiSettings = (WifiSettings) getFragmentManager().findFragmentById(2131231179);
        this.mInputMethodManager = (InputMethodManager) getSystemService("input_method");
        initViews();
        showScanningState();
    }

    private void showDisconnectedProgressBar() {
        if (this.mScreenState == 0) {
            this.mProgressBar.setVisibility(8);
            this.mProgressBar.setIndeterminate(false);
            this.mTopDividerNoProgress.setVisibility(0);
            return;
        }
        this.mProgressBar.setVisibility(0);
        this.mProgressBar.setIndeterminate(false);
        this.mProgressBar.setProgress(0);
        this.mTopDividerNoProgress.setVisibility(8);
    }

    private void restoreFirstVisibilityState() {
        showDefaultTitle();
        this.mAddNetworkButton.setVisibility(0);
        this.mRefreshButton.setVisibility(0);
        this.mSkipOrNextButton.setVisibility(0);
        this.mConnectButton.setVisibility(8);
        this.mBackButton.setVisibility(8);
        setPaddingVisibility(0);
    }

    private void showConnectingState() {
        this.mScreenState = 2;
        this.mBackButton.setVisibility(0);
        this.mEditingTitle = this.mTitleView.getText();
        showConnectingTitle();
        showConnectingProgressBar();
        setPaddingVisibility(0);
    }

    private void showConnectingTitle() {
        if (TextUtils.isEmpty(this.mNetworkName) && this.mWifiConfig != null) {
            if (this.mWifiConfig.getController() == null || this.mWifiConfig.getController().getConfig() == null) {
                Log.w("SetupWizard", "Unexpected null found (WifiController or WifiConfig is null). Ignore them.");
            } else {
                this.mNetworkName = this.mWifiConfig.getController().getConfig().SSID;
            }
        }
        this.mTitleView.setText(getString(2131428818, new Object[]{this.mNetworkName}));
    }

    private void hideSoftwareKeyboard() {
        Log.i("SetupWizard", "Hiding software keyboard.");
        View focusedView = getCurrentFocus();
        if (focusedView != null) {
            this.mInputMethodManager.hideSoftInputFromWindow(focusedView.getWindowToken(), 0);
        }
    }

    private void refreshAccessPoints(boolean z) {
        showScanningState();
        if (z) {
            this.mWifiManager.disconnect();
        }
        this.mWifiSettings.refreshAccessPoints();
    }

    private void showConnectingProgressBar() {
        showTopDividerWithProgressBar();
        this.mProgressBar.setIndeterminate(false);
        this.mProgressBar.setProgress(1);
    }

    private void showScanningState() {
        setPaddingVisibility(0);
        this.mWifiSettingsFragmentLayout.setVisibility(8);
        showScanningProgressBar();
    }

    private void showTopDividerWithProgressBar() {
        this.mProgressBar.setVisibility(0);
        this.mTopDividerNoProgress.setVisibility(8);
        this.mBottomPadding.setVisibility(8);
    }

    void changeNextButtonState(boolean z) {
        if (z) {
            this.mSkipOrNextButton.setText(2131428825);
        } else {
            this.mSkipOrNextButton.setText(2131428824);
        }
    }

    private void onEapNetworkSelected() {
        this.mConnectButton.setVisibility(8);
        this.mBackButton.setText(2131428826);
    }

    private void showScanningProgressBar() {
        showTopDividerWithProgressBar();
        this.mProgressBar.setIndeterminate(true);
    }

    void setPaddingVisibility(int i) {
        this.mTopPadding.setVisibility(i);
        this.mContentPadding.setVisibility(i);
    }

    private void onAddNetworkButtonPressed() {
        this.mWifiSettings.onAddNetworkPressed();
    }

    private void showDefaultTitle() {
        this.mTitleView.setText(getString(2131428816));
    }
}