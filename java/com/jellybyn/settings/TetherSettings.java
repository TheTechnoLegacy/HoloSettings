package com.jellybyn.settings;

import android.app.Activity;
import android.app.Dialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothPan;
import android.bluetooth.BluetoothProfile.ServiceListener;
import android.content.BroadcastReceiver;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Environment;
import android.os.SystemProperties;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceScreen;
import android.webkit.WebView;
import com.jellybyn.settings.wifi.WifiApDialog;
import com.jellybyn.settings.wifi.WifiApEnabler;
import java.util.concurrent.atomic.AtomicReference;

public class TetherSettings extends SettingsPreferenceFragment implements OnClickListener, OnPreferenceChangeListener {
    private boolean mBluetoothEnableForTether;
    private AtomicReference<BluetoothPan> mBluetoothPan = new AtomicReference();
    private String[] mBluetoothRegexs;
    private CheckBoxPreference mBluetoothTether;
    private Preference mCreateNetwork;
    private WifiApDialog mDialog;
    private CheckBoxPreference mEnableWifiAp;
    private boolean mMassStorageActive;
    private ServiceListener mProfileServiceListener = new 1(this);
    private String[] mProvisionApp;
    private String[] mSecurityType;
    private BroadcastReceiver mTetherChangeReceiver;
    private int mTetherChoice = -1;
    private boolean mUsbConnected;
    private String[] mUsbRegexs;
    private CheckBoxPreference mUsbTether;
    private WebView mView;
    private WifiApEnabler mWifiApEnabler;
    private WifiConfiguration mWifiConfig = null;
    private WifiManager mWifiManager;
    private String[] mWifiRegexs;

    private void updateUsbState(String[] strArr, String[] strArr2, String[] strArr3) {
        ConnectivityManager cm = (ConnectivityManager) getSystemService("connectivity");
        boolean usbAvailable = this.mUsbConnected && !this.mMassStorageActive;
        int usbError = 0;
        for (String str : strArr) {
            for (String matches : this.mUsbRegexs) {
                if (str.matches(matches) && usbError == 0) {
                    usbError = cm.getLastTetherError(str);
                }
            }
        }
        boolean usbTethered = false;
        for (String str2 : strArr2) {
            for (String matches2 : this.mUsbRegexs) {
                if (str2.matches(matches2)) {
                    usbTethered = true;
                }
            }
        }
        boolean usbErrored = false;
        for (String str22 : strArr3) {
            for (String matches22 : this.mUsbRegexs) {
                if (str22.matches(matches22)) {
                    usbErrored = true;
                }
            }
        }
        if (usbTethered) {
            this.mUsbTether.setSummary(2131428232);
            this.mUsbTether.setEnabled(true);
            this.mUsbTether.setChecked(true);
        } else if (usbAvailable) {
            if (usbError == 0) {
                this.mUsbTether.setSummary(2131428231);
            } else {
                this.mUsbTether.setSummary(2131428235);
            }
            this.mUsbTether.setEnabled(true);
            this.mUsbTether.setChecked(false);
        } else if (usbErrored) {
            this.mUsbTether.setSummary(2131428235);
            this.mUsbTether.setEnabled(false);
            this.mUsbTether.setChecked(false);
        } else if (this.mMassStorageActive) {
            this.mUsbTether.setSummary(2131428233);
            this.mUsbTether.setEnabled(false);
            this.mUsbTether.setChecked(false);
        } else {
            this.mUsbTether.setSummary(2131428234);
            this.mUsbTether.setEnabled(false);
            this.mUsbTether.setChecked(false);
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034155);
        Activity activity = getActivity();
        BluetoothAdapter adapter = BluetoothAdapter.getDefaultAdapter();
        if (adapter != null) {
            adapter.getProfileProxy(activity.getApplicationContext(), this.mProfileServiceListener, 5);
        }
        this.mEnableWifiAp = (CheckBoxPreference) findPreference("enable_wifi_ap");
        Preference wifiApSettings = findPreference("wifi_ap_ssid_and_security");
        this.mUsbTether = (CheckBoxPreference) findPreference("usb_tether_settings");
        this.mBluetoothTether = (CheckBoxPreference) findPreference("enable_bluetooth_tethering");
        ConnectivityManager cm = (ConnectivityManager) getSystemService("connectivity");
        this.mUsbRegexs = cm.getTetherableUsbRegexs();
        this.mWifiRegexs = cm.getTetherableWifiRegexs();
        this.mBluetoothRegexs = cm.getTetherableBluetoothRegexs();
        boolean usbAvailable = this.mUsbRegexs.length != 0;
        boolean wifiAvailable = this.mWifiRegexs.length != 0;
        boolean bluetoothAvailable = this.mBluetoothRegexs.length != 0;
        if (!usbAvailable || Utils.isMonkeyRunning()) {
            getPreferenceScreen().removePreference(this.mUsbTether);
        }
        if (!wifiAvailable || Utils.isMonkeyRunning()) {
            getPreferenceScreen().removePreference(this.mEnableWifiAp);
            getPreferenceScreen().removePreference(wifiApSettings);
        } else {
            this.mWifiApEnabler = new WifiApEnabler(activity, this.mEnableWifiAp);
            initWifiTethering();
        }
        if (bluetoothAvailable) {
            BluetoothPan pan = (BluetoothPan) this.mBluetoothPan.get();
            if (pan == null || !pan.isTetheringOn()) {
                this.mBluetoothTether.setChecked(false);
            } else {
                this.mBluetoothTether.setChecked(true);
            }
        } else {
            getPreferenceScreen().removePreference(this.mBluetoothTether);
        }
        this.mProvisionApp = getResources().getStringArray(17235998);
        this.mView = new WebView(activity);
    }

    private void updateBluetoothState(String[] strArr, String[] strArr2, String[] strArr3) {
        boolean bluetoothErrored = false;
        for (String str : strArr3) {
            for (String matches : this.mBluetoothRegexs) {
                if (str.matches(matches)) {
                    bluetoothErrored = true;
                }
            }
        }
        int btState = BluetoothAdapter.getDefaultAdapter().getState();
        if (btState == 13) {
            this.mBluetoothTether.setEnabled(false);
            this.mBluetoothTether.setSummary(2131427465);
        } else if (btState == 11) {
            this.mBluetoothTether.setEnabled(false);
            this.mBluetoothTether.setSummary(2131427464);
        } else {
            BluetoothPan bluetoothPan = (BluetoothPan) this.mBluetoothPan.get();
            if (btState == 12 && bluetoothPan != null && bluetoothPan.isTetheringOn()) {
                this.mBluetoothTether.setChecked(true);
                this.mBluetoothTether.setEnabled(true);
                int size = bluetoothPan.getConnectedDevices().size();
                if (size > 1) {
                    this.mBluetoothTether.setSummary(getString(2131428239, new Object[]{Integer.valueOf(size)}));
                    return;
                } else if (size == 1) {
                    this.mBluetoothTether.setSummary(2131428238);
                    return;
                } else if (bluetoothErrored) {
                    this.mBluetoothTether.setSummary(2131428241);
                    return;
                } else {
                    this.mBluetoothTether.setSummary(2131428237);
                    return;
                }
            }
            this.mBluetoothTether.setEnabled(true);
            this.mBluetoothTether.setChecked(false);
            this.mBluetoothTether.setSummary(2131428240);
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        ConnectivityManager cm = (ConnectivityManager) getSystemService("connectivity");
        if (preference == this.mUsbTether) {
            boolean isChecked = this.mUsbTether.isChecked();
            if (isChecked) {
                startProvisioningIfNecessary(1);
            } else {
                setUsbTethering(isChecked);
            }
        } else if (preference == this.mBluetoothTether) {
            if (this.mBluetoothTether.isChecked()) {
                startProvisioningIfNecessary(2);
            } else {
                Object obj = null;
                String findIface = findIface(cm.getTetheredIfaces(), this.mBluetoothRegexs);
                if (!(findIface == null || cm.untether(findIface) == 0)) {
                    obj = 1;
                }
                BluetoothPan bluetoothPan = (BluetoothPan) this.mBluetoothPan.get();
                if (bluetoothPan != null) {
                    bluetoothPan.setBluetoothTethering(false);
                }
                if (obj != null) {
                    this.mBluetoothTether.setSummary(2131428241);
                } else {
                    this.mBluetoothTether.setSummary(2131428240);
                }
            }
        } else if (preference == this.mCreateNetwork) {
            showDialog(1);
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    public void onStart() {
        super.onStart();
        Activity activity = getActivity();
        this.mMassStorageActive = "shared".equals(Environment.getExternalStorageState());
        this.mTetherChangeReceiver = new TetherChangeReceiver(this, null);
        Intent intent = activity.registerReceiver(this.mTetherChangeReceiver, new Intent("android.net.conn.TETHER_STATE_CHANGED"));
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.hardware.usb.action.USB_STATE");
        activity.registerReceiver(this.mTetherChangeReceiver, filter);
        filter = new IntentFilter();
        filter.addAction("android.intent.action.MEDIA_SHARED");
        filter.addAction("android.intent.action.MEDIA_UNSHARED");
        filter.addDataScheme("file");
        activity.registerReceiver(this.mTetherChangeReceiver, filter);
        filter = new IntentFilter();
        filter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        activity.registerReceiver(this.mTetherChangeReceiver, filter);
        if (intent != null) {
            this.mTetherChangeReceiver.onReceive(activity, intent);
        }
        if (this.mWifiApEnabler != null) {
            this.mEnableWifiAp.setOnPreferenceChangeListener(this);
            this.mWifiApEnabler.resume();
        }
        updateState();
    }

    private void startTethering() {
        switch (this.mTetherChoice) {
            case 0:
                this.mWifiApEnabler.setSoftapEnabled(true);
                return;
            case 1:
                setUsbTethering(true);
                return;
            case 2:
                BluetoothAdapter defaultAdapter = BluetoothAdapter.getDefaultAdapter();
                if (defaultAdapter.getState() == 10) {
                    this.mBluetoothEnableForTether = true;
                    defaultAdapter.enable();
                    this.mBluetoothTether.setSummary(2131427464);
                    this.mBluetoothTether.setEnabled(false);
                    return;
                }
                BluetoothPan bluetoothPan = (BluetoothPan) this.mBluetoothPan.get();
                if (bluetoothPan != null) {
                    bluetoothPan.setBluetoothTethering(true);
                }
                this.mBluetoothTether.setSummary(2131428237);
                return;
            default:
                return;
        }
    }

    private void initWifiTethering() {
        Activity activity = getActivity();
        this.mWifiManager = (WifiManager) getSystemService("wifi");
        this.mWifiConfig = this.mWifiManager.getWifiApConfiguration();
        this.mSecurityType = getResources().getStringArray(2131165204);
        this.mCreateNetwork = findPreference("wifi_ap_ssid_and_security");
        if (this.mWifiConfig == null) {
            String string = activity.getString(17040436);
            this.mCreateNetwork.setSummary(String.format(activity.getString(2131427954), new Object[]{string, this.mSecurityType[0]}));
            return;
        }
        int index = WifiApDialog.getSecurityTypeIndex(this.mWifiConfig);
        this.mCreateNetwork.setSummary(String.format(activity.getString(2131427954), new Object[]{this.mWifiConfig.SSID, this.mSecurityType[index]}));
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i != 0) {
            return;
        }
        if (i2 == -1) {
            startTethering();
            return;
        }
        switch (this.mTetherChoice) {
            case 1:
                this.mUsbTether.setChecked(false);
                break;
            case 2:
                this.mBluetoothTether.setChecked(false);
                break;
        }
        this.mTetherChoice = -1;
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (i == -1) {
            this.mWifiConfig = this.mDialog.getConfig();
            if (this.mWifiConfig != null) {
                if (this.mWifiManager.getWifiApState() == 13) {
                    this.mWifiManager.setWifiApEnabled(null, false);
                    this.mWifiManager.setWifiApEnabled(this.mWifiConfig, true);
                } else {
                    this.mWifiManager.setWifiApConfiguration(this.mWifiConfig);
                }
                int securityTypeIndex = WifiApDialog.getSecurityTypeIndex(this.mWifiConfig);
                this.mCreateNetwork.setSummary(String.format(getActivity().getString(2131427954), new Object[]{this.mWifiConfig.SSID, this.mSecurityType[securityTypeIndex]}));
            }
        }
    }

    private static String findIface(String[] strArr, String[] strArr2) {
        for (String str : strArr) {
            for (String matches : strArr2) {
                if (str.matches(matches)) {
                    return str;
                }
            }
        }
        return null;
    }

    private void startProvisioningIfNecessary(int i) {
        this.mTetherChoice = i;
        if (isProvisioningNeeded()) {
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.setClassName(this.mProvisionApp[0], this.mProvisionApp[1]);
            startActivityForResult(intent, 0);
            return;
        }
        startTethering();
    }

    public void onStop() {
        super.onStop();
        getActivity().unregisterReceiver(this.mTetherChangeReceiver);
        this.mTetherChangeReceiver = null;
        if (this.mWifiApEnabler != null) {
            this.mEnableWifiAp.setOnPreferenceChangeListener(null);
            this.mWifiApEnabler.pause();
        }
    }

    private void setUsbTethering(boolean z) {
        ConnectivityManager cm = (ConnectivityManager) getSystemService("connectivity");
        this.mUsbTether.setChecked(false);
        if (cm.setUsbTethering(z) != 0) {
            this.mUsbTether.setSummary(2131428235);
        } else {
            this.mUsbTether.setSummary("");
        }
    }

    private void updateState() {
        ConnectivityManager cm = (ConnectivityManager) getSystemService("connectivity");
        updateState(cm.getTetherableIfaces(), cm.getTetheredIfaces(), cm.getTetheringErroredIfaces());
    }

    public Dialog onCreateDialog(int i) {
        if (i != 1) {
            return null;
        }
        this.mDialog = new WifiApDialog(getActivity(), this, this.mWifiConfig);
        return this.mDialog;
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (((Boolean) obj).booleanValue()) {
            startProvisioningIfNecessary(0);
        } else {
            this.mWifiApEnabler.setSoftapEnabled(false);
        }
        return false;
    }

    private void updateState(String[] strArr, String[] strArr2, String[] strArr3) {
        updateUsbState(strArr, strArr2, strArr3);
        updateBluetoothState(strArr, strArr2, strArr3);
    }

    boolean isProvisioningNeeded() {
        return !SystemProperties.getBoolean("net.tethering.noprovisioning", false) && this.mProvisionApp.length == 2;
    }

    public int getHelpResource() {
        return 2131429124;
    }
}