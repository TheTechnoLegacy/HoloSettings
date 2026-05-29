package com.jellybyn.settings.wifi;

import android.app.ActionBar.LayoutParams;
import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.DetailedState;
import android.net.wifi.ScanResult;
import android.net.wifi.SupplicantState;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.net.wifi.WifiManager.ActionListener;
import android.os.Bundle;
import android.os.UserManager;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.provider.Settings.Global;
import android.provider.Settings.Secure;
import android.util.Log;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Switch;
import android.widget.TextView;
import com.jellybyn.settings.SettingsPreferenceFragment;
import com.jellybyn.settings.wifi.p2p.WifiP2pSettings;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class WifiSettings extends SettingsPreferenceFragment implements OnClickListener {
    private Bundle mAccessPointSavedState;
    private boolean mAutoFinishOnConnection;
    private ActionListener mConnectListener;
    private AtomicBoolean mConnected = new AtomicBoolean(false);
    private WifiDialog mDialog;
    private AccessPoint mDlgAccessPoint;
    private boolean mDlgEdit;
    private TextView mEmptyView;
    private boolean mEnableNextOnConnection;
    private final IntentFilter mFilter = new IntentFilter();
    private ActionListener mForgetListener;
    private WifiInfo mLastInfo;
    private DetailedState mLastState;
    private boolean mP2pSupported;
    private final BroadcastReceiver mReceiver;
    private ActionListener mSaveListener;
    private final Scanner mScanner;
    private AccessPoint mSelectedAccessPoint;
    private boolean mSetupWizardMode;
    private UserManager mUserManager;
    private WifiEnabler mWifiEnabler;
    private WifiManager mWifiManager;

    public void onActivityCreated(Bundle bundle) {
        ConnectivityManager connectivityManager;
        super.onActivityCreated(bundle);
        this.mP2pSupported = getPackageManager().hasSystemFeature("android.hardware.wifi.direct");
        this.mWifiManager = (WifiManager) getSystemService("wifi");
        this.mUserManager = (UserManager) getSystemService("user");
        this.mConnectListener = new 5(this);
        this.mSaveListener = new 6(this);
        this.mForgetListener = new 7(this);
        if (bundle != null && bundle.containsKey("wifi_ap_state")) {
            this.mDlgEdit = bundle.getBoolean("edit_mode");
            this.mAccessPointSavedState = bundle.getBundle("wifi_ap_state");
        }
        Activity activity = getActivity();
        Intent intent = activity.getIntent();
        this.mAutoFinishOnConnection = intent.getBooleanExtra("wifi_auto_finish_on_connect", false);
        if (this.mAutoFinishOnConnection) {
            if (hasNextButton()) {
                getNextButton().setVisibility(8);
            }
            connectivityManager = (ConnectivityManager) activity.getSystemService("connectivity");
            if (connectivityManager != null && connectivityManager.getNetworkInfo(1).isConnected()) {
                activity.setResult(-1);
                activity.finish();
                return;
            }
        }
        this.mEnableNextOnConnection = intent.getBooleanExtra("wifi_enable_next_on_connect", false);
        if (this.mEnableNextOnConnection && hasNextButton()) {
            connectivityManager = (ConnectivityManager) activity.getSystemService("connectivity");
            if (connectivityManager != null) {
                changeNextButtonState(connectivityManager.getNetworkInfo(1).isConnected());
            }
        }
        addPreferencesFromResource(2131034168);
        if (this.mSetupWizardMode) {
            getView().setSystemUiVisibility(27525120);
        }
        if (!this.mSetupWizardMode) {
            Switch switchR = new Switch(activity);
            if (activity instanceof PreferenceActivity) {
                PreferenceActivity preferenceActivity = (PreferenceActivity) activity;
                if (preferenceActivity.onIsHidingHeaders() || !preferenceActivity.onIsMultiPane()) {
                    switchR.setPaddingRelative(0, 0, activity.getResources().getDimensionPixelSize(2131558402), 0);
                    activity.getActionBar().setDisplayOptions(16, 16);
                    activity.getActionBar().setCustomView(switchR, new LayoutParams(-2, -2, 8388629));
                }
            }
            this.mWifiEnabler = new WifiEnabler(activity, switchR);
        }
        this.mEmptyView = (TextView) getView().findViewById(16908292);
        getListView().setEmptyView(this.mEmptyView);
        if (!this.mSetupWizardMode) {
            registerForContextMenu(getListView());
        }
        setHasOptionsMenu(true);
    }

    private void handleEvent(Context context, Intent intent) {
        String action = intent.getAction();
        if ("android.net.wifi.WIFI_STATE_CHANGED".equals(action)) {
            updateWifiState(intent.getIntExtra("wifi_state", 4));
        } else if ("android.net.wifi.SCAN_RESULTS".equals(action) || "android.net.wifi.CONFIGURED_NETWORKS_CHANGE".equals(action) || "android.net.wifi.LINK_CONFIGURATION_CHANGED".equals(action)) {
            updateAccessPoints();
        } else if ("android.net.wifi.supplicant.STATE_CHANGE".equals(action)) {
            SupplicantState supplicantState = (SupplicantState) intent.getParcelableExtra("newState");
            if (this.mConnected.get() || !SupplicantState.isHandshakeState(supplicantState)) {
                updateConnectionState(null);
            } else {
                updateConnectionState(WifiInfo.getDetailedStateOf(supplicantState));
            }
        } else if ("android.net.wifi.STATE_CHANGE".equals(action)) {
            NetworkInfo networkInfo = (NetworkInfo) intent.getParcelableExtra("networkInfo");
            this.mConnected.set(networkInfo.isConnected());
            changeNextButtonState(networkInfo.isConnected());
            updateAccessPoints();
            updateConnectionState(networkInfo.getDetailedState());
            if (this.mAutoFinishOnConnection && networkInfo.isConnected()) {
                Activity activity = getActivity();
                if (activity != null) {
                    activity.setResult(-1);
                    activity.finish();
                }
            }
        } else if ("android.net.wifi.RSSI_CHANGED".equals(action)) {
            updateConnectionState(null);
        }
    }

    private List<AccessPoint> constructAccessPoints() {
        ArrayList arrayList = new ArrayList();
        Multimap multimap = new Multimap(this, null);
        List<WifiConfiguration> configuredNetworks = this.mWifiManager.getConfiguredNetworks();
        if (configuredNetworks != null) {
            for (WifiConfiguration accessPoint : configuredNetworks) {
                AccessPoint accessPoint2 = new AccessPoint(getActivity(), accessPoint);
                accessPoint2.update(this.mLastInfo, this.mLastState);
                arrayList.add(accessPoint2);
                multimap.put(accessPoint2.ssid, accessPoint2);
            }
        }
        List<ScanResult> scanResults = this.mWifiManager.getScanResults();
        if (scanResults != null) {
            for (ScanResult scanResult : scanResults) {
                if (!(scanResult.SSID == null || scanResult.SSID.length() == 0 || scanResult.capabilities.contains("[IBSS]"))) {
                    AccessPoint accessPoint3;
                    Object obj = null;
                    for (AccessPoint accessPoint32 : multimap.getAll(scanResult.SSID)) {
                        obj = accessPoint32.update(scanResult) ? 1 : obj;
                    }
                    if (obj == null) {
                        accessPoint32 = new AccessPoint(getActivity(), scanResult);
                        arrayList.add(accessPoint32);
                        multimap.put(accessPoint32.ssid, accessPoint32);
                    }
                }
            }
        }
        Collections.sort(arrayList);
        return arrayList;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (this.mUserManager.hasUserRestriction("no_config_wifi")) {
            return false;
        }
        switch (menuItem.getItemId()) {
            case 1:
                showDialog(2);
                return true;
            case 2:
                showDialog(3);
                return true;
            case 3:
                if (getActivity() instanceof PreferenceActivity) {
                    ((PreferenceActivity) getActivity()).startPreferencePanel(WifiP2pSettings.class.getCanonicalName(), null, 2131427932, null, this, 0);
                } else {
                    startFragment(this, WifiP2pSettings.class.getCanonicalName(), -1, null);
                }
                return true;
            case 4:
                if (this.mWifiManager.isWifiEnabled()) {
                    onAddNetworkPressed();
                }
                return true;
            case 5:
                if (getActivity() instanceof PreferenceActivity) {
                    ((PreferenceActivity) getActivity()).startPreferencePanel(AdvancedWifiSettings.class.getCanonicalName(), null, 2131427911, null, this, 0);
                } else {
                    startFragment(this, AdvancedWifiSettings.class.getCanonicalName(), -1, null);
                }
                return true;
            case 6:
                if (this.mWifiManager.isWifiEnabled()) {
                    this.mScanner.forceScan();
                }
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        if (!this.mSetupWizardMode) {
            return super.onCreateView(layoutInflater, viewGroup, bundle);
        }
        View inflate = layoutInflater.inflate(2130968694, viewGroup, false);
        inflate.findViewById(2131231035).setOnClickListener(new 2(this));
        ImageButton imageButton = (ImageButton) inflate.findViewById(2131231033);
        if (imageButton != null) {
            imageButton.setOnClickListener(new 3(this, layoutInflater, imageButton));
        }
        Intent intent = getActivity().getIntent();
        if (intent.getBooleanExtra("wifi_show_custom_button", false)) {
            inflate.findViewById(2131231038).setVisibility(0);
            inflate.findViewById(2131231039).setVisibility(4);
            inflate.findViewById(2131231041).setVisibility(4);
            inflate.findViewById(2131230762).setVisibility(4);
            Button button = (Button) inflate.findViewById(2131231040);
            button.setVisibility(0);
            button.setOnClickListener(new 4(this));
        }
        if (!intent.getBooleanExtra("wifi_show_wifi_required_info", false)) {
            return inflate;
        }
        inflate.findViewById(2131231034).setVisibility(0);
        return inflate;
    }

    private void updateAccessPoints() {
        if (getActivity() != null) {
            if (this.mUserManager.hasUserRestriction("no_config_wifi")) {
                addMessagePreference(2131427837);
                return;
            }
            switch (this.mWifiManager.getWifiState()) {
                case 0:
                    addMessagePreference(2131427806);
                    return;
                case 1:
                    setOffMessage();
                    return;
                case 2:
                    getPreferenceScreen().removeAll();
                    return;
                case 3:
                    List<AccessPoint> constructAccessPoints = constructAccessPoints();
                    getPreferenceScreen().removeAll();
                    if (constructAccessPoints.size() == 0) {
                        addMessagePreference(2131427836);
                    }
                    for (AccessPoint addPreference : constructAccessPoints) {
                        getPreferenceScreen().addPreference(addPreference);
                    }
                    return;
                default:
                    return;
            }
        }
    }

    private void updateConnectionState(DetailedState detailedState) {
        if (this.mWifiManager.isWifiEnabled()) {
            if (detailedState == DetailedState.OBTAINING_IPADDR) {
                this.mScanner.pause();
            } else {
                this.mScanner.resume();
            }
            this.mLastInfo = this.mWifiManager.getConnectionInfo();
            if (detailedState != null) {
                this.mLastState = detailedState;
            }
            for (int preferenceCount = getPreferenceScreen().getPreferenceCount() - 1; preferenceCount >= 0; preferenceCount--) {
                Preference preference = getPreferenceScreen().getPreference(preferenceCount);
                if (preference instanceof AccessPoint) {
                    ((AccessPoint) preference).update(this.mLastInfo, this.mLastState);
                }
            }
            return;
        }
        this.mScanner.pause();
    }

    public Dialog onCreateDialog(int i) {
        switch (i) {
            case 1:
                AccessPoint accessPoint = this.mDlgAccessPoint;
                if (accessPoint == null && this.mAccessPointSavedState != null) {
                    accessPoint = new AccessPoint(getActivity(), this.mAccessPointSavedState);
                    this.mDlgAccessPoint = accessPoint;
                }
                this.mSelectedAccessPoint = accessPoint;
                this.mDialog = new WifiDialog(getActivity(), this, accessPoint, this.mDlgEdit);
                return this.mDialog;
            case 2:
                return new WpsDialog(getActivity(), 0);
            case 3:
                return new WpsDialog(getActivity(), 1);
            case 4:
                return new Builder(getActivity()).setMessage(2131427908).setCancelable(false).setNegativeButton(2131427906, new 9(this)).setPositiveButton(2131427907, new 8(this)).create();
            case 5:
                return new Builder(getActivity()).setMessage(2131427909).setCancelable(false).setNegativeButton(2131427906, new 11(this)).setPositiveButton(2131427907, new 10(this)).create();
            default:
                return super.onCreateDialog(i);
        }
    }

    public WifiSettings() {
        this.mFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        this.mFilter.addAction("android.net.wifi.SCAN_RESULTS");
        this.mFilter.addAction("android.net.wifi.NETWORK_IDS_CHANGED");
        this.mFilter.addAction("android.net.wifi.supplicant.STATE_CHANGE");
        this.mFilter.addAction("android.net.wifi.CONFIGURED_NETWORKS_CHANGE");
        this.mFilter.addAction("android.net.wifi.LINK_CONFIGURATION_CHANGED");
        this.mFilter.addAction("android.net.wifi.STATE_CHANGE");
        this.mFilter.addAction("android.net.wifi.RSSI_CHANGED");
        this.mReceiver = new 1(this);
        this.mScanner = new Scanner(this, null);
    }

    public boolean onContextItemSelected(MenuItem menuItem) {
        if (this.mSelectedAccessPoint == null) {
            return super.onContextItemSelected(menuItem);
        }
        switch (menuItem.getItemId()) {
            case 7:
                if (this.mSelectedAccessPoint.networkId != -1) {
                    this.mWifiManager.connect(this.mSelectedAccessPoint.networkId, this.mConnectListener);
                    return true;
                } else if (this.mSelectedAccessPoint.security == 0) {
                    this.mSelectedAccessPoint.generateOpenNetworkConfig();
                    this.mWifiManager.connect(this.mSelectedAccessPoint.getConfig(), this.mConnectListener);
                    return true;
                } else {
                    showDialog(this.mSelectedAccessPoint, true);
                    return true;
                }
            case 8:
                this.mWifiManager.forget(this.mSelectedAccessPoint.networkId, this.mForgetListener);
                return true;
            case 9:
                showDialog(this.mSelectedAccessPoint, true);
                return true;
            default:
                return super.onContextItemSelected(menuItem);
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        if (!this.mUserManager.hasUserRestriction("no_config_wifi")) {
            boolean wifiIsEnabled = this.mWifiManager.isWifiEnabled();
            if (this.mSetupWizardMode) {
                menu.add(0, 1, 0, 2131427826).setIcon(2130837650).setEnabled(wifiIsEnabled).setShowAsAction(2);
                menu.add(0, 4, 0, 2131427824).setEnabled(wifiIsEnabled).setShowAsAction(2);
            } else {
                menu.add(0, 1, 0, 2131427826).setIcon(2130837650).setEnabled(wifiIsEnabled).setShowAsAction(1);
                menu.add(0, 4, 0, 2131427824).setIcon(2130837586).setEnabled(wifiIsEnabled).setShowAsAction(1);
                menu.add(0, 6, 0, 2131427830).setEnabled(wifiIsEnabled).setShowAsAction(0);
                menu.add(0, 2, 0, 2131427828).setEnabled(wifiIsEnabled).setShowAsAction(0);
                if (this.mP2pSupported) {
                    menu.add(0, 3, 0, 2131427829).setEnabled(wifiIsEnabled).setShowAsAction(0);
                }
                menu.add(0, 5, 0, 2131427831).setShowAsAction(0);
            }
            super.onCreateOptionsMenu(menu, menuInflater);
        }
    }

    void submit(WifiConfigController wifiConfigController) {
        WifiConfiguration config = wifiConfigController.getConfig();
        if (config == null) {
            if (!(this.mSelectedAccessPoint == null || this.mSelectedAccessPoint.networkId == -1)) {
                this.mWifiManager.connect(this.mSelectedAccessPoint.networkId, this.mConnectListener);
            }
        } else if (config.networkId != -1) {
            if (this.mSelectedAccessPoint != null) {
                this.mWifiManager.save(config, this.mSaveListener);
            }
        } else if (wifiConfigController.isEdit()) {
            this.mWifiManager.save(config, this.mSaveListener);
        } else {
            this.mWifiManager.connect(config, this.mConnectListener);
        }
        if (this.mWifiManager.isWifiEnabled()) {
            this.mScanner.resume();
        }
        updateAccessPoints();
    }

    private void updateWifiState(int i) {
        Activity activity = getActivity();
        if (activity != null) {
            activity.invalidateOptionsMenu();
        }
        switch (i) {
            case 1:
                setOffMessage();
                break;
            case 2:
                addMessagePreference(2131427805);
                break;
            case 3:
                this.mScanner.resume();
                return;
        }
        this.mLastInfo = null;
        this.mLastState = null;
        this.mScanner.pause();
    }

    private void setOffMessage() {
        if (this.mEmptyView != null) {
            this.mEmptyView.setText(2131427835);
            if (Global.getInt(getActivity().getContentResolver(), "wifi_scan_always_enabled", 0) == 1) {
                this.mEmptyView.append("\n\n");
                this.mEmptyView.append(getText(Secure.isLocationProviderEnabled(getActivity().getContentResolver(), "network") ? 2131427817 : 2131427818));
            }
        }
        getPreferenceScreen().removeAll();
    }

    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenuInfo contextMenuInfo) {
        if (contextMenuInfo instanceof AdapterContextMenuInfo) {
            Preference preference = (Preference) getListView().getItemAtPosition(((AdapterContextMenuInfo) contextMenuInfo).position);
            if (preference instanceof AccessPoint) {
                this.mSelectedAccessPoint = (AccessPoint) preference;
                contextMenu.setHeaderTitle(this.mSelectedAccessPoint.ssid);
                if (this.mSelectedAccessPoint.getLevel() != -1 && this.mSelectedAccessPoint.getState() == null) {
                    contextMenu.add(0, 7, 0, 2131427832);
                }
                if (this.mSelectedAccessPoint.networkId != -1) {
                    contextMenu.add(0, 8, 0, 2131427833);
                    contextMenu.add(0, 9, 0, 2131427834);
                }
            }
        }
    }

    void forget() {
        if (this.mSelectedAccessPoint.networkId == -1) {
            Log.e("WifiSettings", "Failed to forget invalid network " + this.mSelectedAccessPoint.getConfig());
            return;
        }
        this.mWifiManager.forget(this.mSelectedAccessPoint.networkId, this.mForgetListener);
        if (this.mWifiManager.isWifiEnabled()) {
            this.mScanner.resume();
        }
        updateAccessPoints();
        changeNextButtonState(false);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (!(preference instanceof AccessPoint)) {
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        }
        this.mSelectedAccessPoint = (AccessPoint) preference;
        if (this.mSelectedAccessPoint.security == 0 && this.mSelectedAccessPoint.networkId == -1) {
            this.mSelectedAccessPoint.generateOpenNetworkConfig();
            this.mWifiManager.connect(this.mSelectedAccessPoint.getConfig(), this.mConnectListener);
        } else {
            showDialog(this.mSelectedAccessPoint, false);
        }
        return true;
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.mDialog != null && this.mDialog.isShowing()) {
            bundle.putBoolean("edit_mode", this.mDlgEdit);
            if (this.mDlgAccessPoint != null) {
                this.mAccessPointSavedState = new Bundle();
                this.mDlgAccessPoint.saveWifiState(this.mAccessPointSavedState);
                bundle.putBundle("wifi_ap_state", this.mAccessPointSavedState);
            }
        }
    }

    private void showDialog(AccessPoint accessPoint, boolean z) {
        if (this.mDialog != null) {
            removeDialog(1);
            this.mDialog = null;
        }
        this.mDlgAccessPoint = accessPoint;
        this.mDlgEdit = z;
        showDialog(1);
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (i == -3 && this.mSelectedAccessPoint != null) {
            forget();
        } else if (i == -1 && this.mDialog != null) {
            submit(this.mDialog.getController());
        }
    }

    public void onPause() {
        super.onPause();
        if (this.mWifiEnabler != null) {
            this.mWifiEnabler.pause();
        }
        getActivity().unregisterReceiver(this.mReceiver);
        this.mScanner.pause();
    }

    public void onResume() {
        super.onResume();
        if (this.mWifiEnabler != null) {
            this.mWifiEnabler.resume();
        }
        getActivity().registerReceiver(this.mReceiver, this.mFilter);
        updateAccessPoints();
    }

    void refreshAccessPoints() {
        if (this.mWifiManager.isWifiEnabled()) {
            this.mScanner.resume();
        }
        getPreferenceScreen().removeAll();
    }

    private void addMessagePreference(int i) {
        if (this.mEmptyView != null) {
            this.mEmptyView.setText(i);
        }
        getPreferenceScreen().removeAll();
    }

    private void changeNextButtonState(boolean z) {
        if (this.mEnableNextOnConnection && hasNextButton()) {
            getNextButton().setEnabled(z);
        }
    }

    protected int getHelpResource() {
        return this.mSetupWizardMode ? 0 : 2131429114;
    }

    void onAddNetworkPressed() {
        this.mSelectedAccessPoint = null;
        showDialog(null, true);
    }

    public void onCreate(Bundle bundle) {
        this.mSetupWizardMode = getActivity().getIntent().getBooleanExtra("firstRun", false);
        super.onCreate(bundle);
    }

    void resumeWifiScan() {
        if (this.mWifiManager.isWifiEnabled()) {
            this.mScanner.resume();
        }
    }
}