package com.jellybyn.settings.wifi.p2p;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.DialogInterface.OnClickListener;
import android.content.IntentFilter;
import android.net.wifi.p2p.WifiP2pConfig;
import android.net.wifi.p2p.WifiP2pDevice;
import android.net.wifi.p2p.WifiP2pDeviceList;
import android.net.wifi.p2p.WifiP2pGroup;
import android.net.wifi.p2p.WifiP2pGroupList;
import android.net.wifi.p2p.WifiP2pManager;
import android.net.wifi.p2p.WifiP2pManager.Channel;
import android.net.wifi.p2p.WifiP2pManager.GroupInfoListener;
import android.net.wifi.p2p.WifiP2pManager.PersistentGroupInfoListener;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.text.InputFilter;
import android.text.InputFilter.LengthFilter;
import android.text.TextUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.EditText;
import com.jellybyn.settings.SettingsPreferenceFragment;

public class WifiP2pSettings extends SettingsPreferenceFragment implements GroupInfoListener, PersistentGroupInfoListener {
    private OnClickListener mCancelConnectListener;
    private Channel mChannel;
    private int mConnectedDevices;
    private WifiP2pGroup mConnectedGroup;
    private OnClickListener mDeleteGroupListener;
    private EditText mDeviceNameText;
    private OnClickListener mDisconnectListener;
    private final IntentFilter mIntentFilter = new IntentFilter();
    private boolean mLastGroupFormed = false;
    private WifiP2pDeviceList mPeers = new WifiP2pDeviceList();
    private PreferenceGroup mPeersGroup;
    private PreferenceGroup mPersistentGroup;
    private final BroadcastReceiver mReceiver = new 1(this);
    private OnClickListener mRenameListener;
    private String mSavedDeviceName;
    private WifiP2pPersistentGroup mSelectedGroup;
    private WifiP2pPeer mSelectedWifiPeer;
    private WifiP2pDevice mThisDevice;
    private Preference mThisDevicePref;
    private boolean mWifiP2pEnabled;
    private WifiP2pManager mWifiP2pManager;
    private boolean mWifiP2pSearching;

    public void onActivityCreated(Bundle bundle) {
        addPreferencesFromResource(2131034167);
        this.mIntentFilter.addAction("android.net.wifi.p2p.STATE_CHANGED");
        this.mIntentFilter.addAction("android.net.wifi.p2p.PEERS_CHANGED");
        this.mIntentFilter.addAction("android.net.wifi.p2p.CONNECTION_STATE_CHANGE");
        this.mIntentFilter.addAction("android.net.wifi.p2p.THIS_DEVICE_CHANGED");
        this.mIntentFilter.addAction("android.net.wifi.p2p.DISCOVERY_STATE_CHANGE");
        this.mIntentFilter.addAction("android.net.wifi.p2p.PERSISTENT_GROUPS_CHANGED");
        Activity activity = getActivity();
        this.mWifiP2pManager = (WifiP2pManager) getSystemService("wifip2p");
        if (this.mWifiP2pManager != null) {
            this.mChannel = this.mWifiP2pManager.initialize(activity, getActivity().getMainLooper(), null);
            if (this.mChannel == null) {
                Log.e("WifiP2pSettings", "Failed to set up connection with wifi p2p service");
                this.mWifiP2pManager = null;
            }
        } else {
            Log.e("WifiP2pSettings", "mWifiP2pManager is null !");
        }
        if (bundle != null && bundle.containsKey("PEER_STATE")) {
            this.mSelectedWifiPeer = new WifiP2pPeer(getActivity(), (WifiP2pDevice) bundle.getParcelable("PEER_STATE"));
        }
        if (bundle != null && bundle.containsKey("DEV_NAME")) {
            this.mSavedDeviceName = bundle.getString("DEV_NAME");
        }
        this.mRenameListener = new 1(this);
        this.mDisconnectListener = new 1(this);
        this.mCancelConnectListener = new 1(this);
        this.mDeleteGroupListener = new 1(this);
        setHasOptionsMenu(true);
        PreferenceScreen preferenceScreen = getPreferenceScreen();
        preferenceScreen.removeAll();
        preferenceScreen.setOrderingAsAdded(true);
        this.mThisDevicePref = new Preference(getActivity());
        preferenceScreen.addPreference(this.mThisDevicePref);
        this.mPeersGroup = new PreferenceCategory(getActivity());
        this.mPeersGroup.setTitle(2131427938);
        this.mPersistentGroup = new PreferenceCategory(getActivity());
        this.mPersistentGroup.setTitle(2131427939);
        super.onActivityCreated(bundle);
    }

    public Dialog onCreateDialog(int i) {
        String str;
        if (i == 1) {
            str = TextUtils.isEmpty(this.mSelectedWifiPeer.device.deviceName) ? this.mSelectedWifiPeer.device.deviceAddress : this.mSelectedWifiPeer.device.deviceName;
            return new Builder(getActivity()).setTitle(2131427942).setMessage(this.mConnectedDevices > 1 ? getActivity().getString(2131427944, new Object[]{str, Integer.valueOf(this.mConnectedDevices - 1)}) : getActivity().getString(2131427943, new Object[]{str})).setPositiveButton(getActivity().getString(2131428389), this.mDisconnectListener).setNegativeButton(getActivity().getString(2131428390), null).create();
        } else if (i == 2) {
            str = TextUtils.isEmpty(this.mSelectedWifiPeer.device.deviceName) ? this.mSelectedWifiPeer.device.deviceAddress : this.mSelectedWifiPeer.device.deviceName;
            return new Builder(getActivity()).setTitle(2131427945).setMessage(getActivity().getString(2131427946, new Object[]{str})).setPositiveButton(getActivity().getString(2131428389), this.mCancelConnectListener).setNegativeButton(getActivity().getString(2131428390), null).create();
        } else if (i != 3) {
            return i == 4 ? new Builder(getActivity()).setMessage(getActivity().getString(2131427947)).setPositiveButton(getActivity().getString(2131428389), this.mDeleteGroupListener).setNegativeButton(getActivity().getString(2131428390), null).create() : null;
        } else {
            this.mDeviceNameText = new EditText(getActivity());
            this.mDeviceNameText.setFilters(new InputFilter[]{new LengthFilter(30)});
            if (this.mSavedDeviceName != null) {
                this.mDeviceNameText.setText(this.mSavedDeviceName);
                this.mDeviceNameText.setSelection(this.mSavedDeviceName.length());
            } else if (!(this.mThisDevice == null || TextUtils.isEmpty(this.mThisDevice.deviceName))) {
                this.mDeviceNameText.setText(this.mThisDevice.deviceName);
                this.mDeviceNameText.setSelection(0, this.mThisDevice.deviceName.length());
            }
            this.mSavedDeviceName = null;
            return new Builder(getActivity()).setTitle(2131427937).setView(this.mDeviceNameText).setPositiveButton(getActivity().getString(2131428389), this.mRenameListener).setNegativeButton(getActivity().getString(2131428390), null).create();
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (preference instanceof WifiP2pPeer) {
            this.mSelectedWifiPeer = (WifiP2pPeer) preference;
            if (this.mSelectedWifiPeer.device.status == 0) {
                showDialog(1);
            } else if (this.mSelectedWifiPeer.device.status == 1) {
                showDialog(2);
            } else {
                WifiP2pConfig wifiP2pConfig = new WifiP2pConfig();
                wifiP2pConfig.deviceAddress = this.mSelectedWifiPeer.device.deviceAddress;
                int i = SystemProperties.getInt("wifidirect.wps", -1);
                if (i != -1) {
                    wifiP2pConfig.wps.setup = i;
                } else if (this.mSelectedWifiPeer.device.wpsPbcSupported()) {
                    wifiP2pConfig.wps.setup = 0;
                } else if (this.mSelectedWifiPeer.device.wpsKeypadSupported()) {
                    wifiP2pConfig.wps.setup = 2;
                } else {
                    wifiP2pConfig.wps.setup = 1;
                }
                this.mWifiP2pManager.connect(this.mChannel, wifiP2pConfig, new 1(this));
            }
        } else if (preference instanceof WifiP2pPersistentGroup) {
            this.mSelectedGroup = (WifiP2pPersistentGroup) preference;
            showDialog(4);
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    private void handleP2pStateChanged() {
        updateSearchMenu(false);
        if (this.mWifiP2pEnabled) {
            PreferenceScreen preferenceScreen = getPreferenceScreen();
            preferenceScreen.removeAll();
            preferenceScreen.setOrderingAsAdded(true);
            preferenceScreen.addPreference(this.mThisDevicePref);
            this.mPeersGroup.setEnabled(true);
            preferenceScreen.addPreference(this.mPeersGroup);
            this.mPersistentGroup.setEnabled(true);
            preferenceScreen.addPreference(this.mPersistentGroup);
        }
    }

    public void onPrepareOptionsMenu(Menu menu) {
        MenuItem searchMenu = menu.findItem(1);
        MenuItem renameMenu = menu.findItem(2);
        if (this.mWifiP2pEnabled) {
            searchMenu.setEnabled(true);
            renameMenu.setEnabled(true);
        } else {
            searchMenu.setEnabled(false);
            renameMenu.setEnabled(false);
        }
        if (this.mWifiP2pSearching) {
            searchMenu.setTitle(2131427936);
        } else {
            searchMenu.setTitle(2131427935);
        }
    }

    private void updateDevicePref() {
        if (this.mThisDevice != null) {
            if (TextUtils.isEmpty(this.mThisDevice.deviceName)) {
                this.mThisDevicePref.setTitle(this.mThisDevice.deviceAddress);
            } else {
                this.mThisDevicePref.setTitle(this.mThisDevice.deviceName);
            }
            this.mThisDevicePref.setPersistent(false);
            this.mThisDevicePref.setEnabled(true);
            this.mThisDevicePref.setSelectable(false);
        }
    }

    private void handlePeersChanged() {
        this.mPeersGroup.removeAll();
        this.mConnectedDevices = 0;
        for (WifiP2pDevice wifiP2pDevice : this.mPeers.getDeviceList()) {
            this.mPeersGroup.addPreference(new WifiP2pPeer(getActivity(), wifiP2pDevice));
            if (wifiP2pDevice.status == 0) {
                this.mConnectedDevices++;
            }
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menu.add(0, 1, 0, this.mWifiP2pSearching ? 2131427936 : 2131427935).setEnabled(this.mWifiP2pEnabled).setShowAsAction(1);
        menu.add(0, 2, 0, 2131427937).setEnabled(this.mWifiP2pEnabled).setShowAsAction(1);
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 1:
                startSearch();
                return true;
            case 2:
                showDialog(3);
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        if (this.mSelectedWifiPeer != null) {
            bundle.putParcelable("PEER_STATE", this.mSelectedWifiPeer.device);
        }
        if (this.mDeviceNameText != null) {
            bundle.putString("DEV_NAME", this.mDeviceNameText.getText().toString());
        }
    }

    private void updateSearchMenu(boolean z) {
        this.mWifiP2pSearching = z;
        Activity activity = getActivity();
        if (activity != null) {
            activity.invalidateOptionsMenu();
        }
    }

    public void onPause() {
        super.onPause();
        this.mWifiP2pManager.stopPeerDiscovery(this.mChannel, null);
        getActivity().unregisterReceiver(this.mReceiver);
    }

    public void onPersistentGroupInfoAvailable(WifiP2pGroupList wifiP2pGroupList) {
        this.mPersistentGroup.removeAll();
        for (WifiP2pGroup wifiP2pPersistentGroup : wifiP2pGroupList.getGroupList()) {
            this.mPersistentGroup.addPreference(new WifiP2pPersistentGroup(getActivity(), wifiP2pPersistentGroup));
        }
    }

    private void startSearch() {
        if (this.mWifiP2pManager != null && !this.mWifiP2pSearching) {
            this.mWifiP2pManager.discoverPeers(this.mChannel, new 1(this));
        }
    }

    public void onGroupInfoAvailable(WifiP2pGroup wifiP2pGroup) {
        this.mConnectedGroup = wifiP2pGroup;
        updateDevicePref();
    }

    public void onResume() {
        super.onResume();
        getActivity().registerReceiver(this.mReceiver, this.mIntentFilter);
    }
}