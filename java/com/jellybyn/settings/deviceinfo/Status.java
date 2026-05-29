package com.jellybyn.settings.deviceinfo;

import android.bluetooth.BluetoothAdapter;
import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.telephony.PhoneNumberUtils;
import android.telephony.PhoneStateListener;
import android.telephony.ServiceState;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneFactory;
import com.android.internal.telephony.PhoneStateIntentReceiver;
import com.jellybyn.settings.Utils;

public class Status extends PreferenceActivity {
    private static final String[] PHONE_RELATED_ENTRIES = new String[]{"data_state", "service_state", "operator_name", "roaming_state", "network_type", "latest_area_info", "number", "imei", "imei_sv", "prl_version", "min_number", "meid_number", "signal_strength", "icc_id"};
    private BroadcastReceiver mAreaInfoReceiver = new 3(this);
    private BroadcastReceiver mBatteryInfoReceiver = new 1(this);
    private Preference mBatteryLevel;
    private Preference mBatteryStatus;
    private Handler mHandler;
    private Phone mPhone = null;
    private PhoneStateListener mPhoneStateListener = new 2(this);
    private PhoneStateIntentReceiver mPhoneStateReceiver;
    private Resources mRes;
    private boolean mShowLatestAreaInfo;
    private Preference mSignalStrength;
    private TelephonyManager mTelephonyManager;
    private Preference mUptime;
    private String sUnknown;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mHandler = new MyHandler(this);
        this.mTelephonyManager = (TelephonyManager) getSystemService("phone");
        addPreferencesFromResource(2131034127);
        this.mBatteryLevel = findPreference("battery_level");
        this.mBatteryStatus = findPreference("battery_status");
        this.mRes = getResources();
        this.sUnknown = this.mRes.getString(2131427339);
        if (UserHandle.myUserId() == 0) {
            this.mPhone = PhoneFactory.getDefaultPhone();
        }
        this.mSignalStrength = findPreference("signal_strength");
        this.mUptime = findPreference("up_time");
        if (this.mPhone == null || Utils.isWifiOnly(getApplicationContext())) {
            for (String removePreferenceFromScreen : PHONE_RELATED_ENTRIES) {
                removePreferenceFromScreen(removePreferenceFromScreen);
            }
        } else {
            if (this.mPhone.getPhoneName().equals("CDMA")) {
                setSummaryText("meid_number", this.mPhone.getMeid());
                setSummaryText("min_number", this.mPhone.getCdmaMin());
                if (getResources().getBoolean(2131296262)) {
                    findPreference("min_number").setTitle(2131428097);
                }
                setSummaryText("prl_version", this.mPhone.getCdmaPrlVersion());
                removePreferenceFromScreen("imei_sv");
                if (this.mPhone.getLteOnCdmaMode() == 1) {
                    setSummaryText("icc_id", this.mPhone.getIccSerialNumber());
                    setSummaryText("imei", this.mPhone.getImei());
                } else {
                    removePreferenceFromScreen("imei");
                    removePreferenceFromScreen("icc_id");
                }
            } else {
                setSummaryText("imei", this.mPhone.getDeviceId());
                setSummaryText("imei_sv", ((TelephonyManager) getSystemService("phone")).getDeviceSoftwareVersion());
                removePreferenceFromScreen("prl_version");
                removePreferenceFromScreen("meid_number");
                removePreferenceFromScreen("min_number");
                removePreferenceFromScreen("icc_id");
                if ("br".equals(this.mTelephonyManager.getSimCountryIso())) {
                    this.mShowLatestAreaInfo = true;
                }
            }
            String line1Number = this.mPhone.getLine1Number();
            String str = null;
            if (!TextUtils.isEmpty(line1Number)) {
                str = PhoneNumberUtils.formatNumber(line1Number);
            }
            setSummaryText("number", str);
            this.mPhoneStateReceiver = new PhoneStateIntentReceiver(this, this.mHandler);
            this.mPhoneStateReceiver.notifySignalStrength(200);
            this.mPhoneStateReceiver.notifyServiceState(300);
            if (!this.mShowLatestAreaInfo) {
                removePreferenceFromScreen("latest_area_info");
            }
        }
        setWimaxStatus();
        setWifiStatus();
        setBtStatus();
        setIpAddressStatus();
        String serial = Build.SERIAL;
        if (serial == null || serial.equals("")) {
            removePreferenceFromScreen("serial_number");
        } else {
            setSummaryText("serial_number", serial);
        }
    }

    private void updateServiceState(ServiceState serviceState) {
        int state = serviceState.getState();
        String display = this.mRes.getString(2131427371);
        switch (state) {
            case 0:
                display = this.mRes.getString(2131427358);
                break;
            case 1:
            case 2:
                display = this.mRes.getString(2131427359);
                break;
            case 3:
                display = this.mRes.getString(2131427361);
                break;
        }
        setSummaryText("service_state", display);
        if (serviceState.getRoaming()) {
            setSummaryText("roaming_state", this.mRes.getString(2131427362));
        } else {
            setSummaryText("roaming_state", this.mRes.getString(2131427363));
        }
        setSummaryText("operator_name", serviceState.getOperatorAlphaLong());
    }

    protected void onResume() {
        super.onResume();
        if (!(this.mPhone == null || Utils.isWifiOnly(getApplicationContext()))) {
            this.mPhoneStateReceiver.registerIntent();
            updateSignalStrength();
            updateServiceState(this.mPhone.getServiceState());
            updateDataState();
            this.mTelephonyManager.listen(this.mPhoneStateListener, 64);
            if (this.mShowLatestAreaInfo) {
                registerReceiver(this.mAreaInfoReceiver, new IntentFilter("android.cellbroadcastreceiver.CB_AREA_INFO_RECEIVED"), "android.permission.RECEIVE_EMERGENCY_BROADCAST", null);
                sendBroadcastAsUser(new IntentFilter("android.cellbroadcastreceiver.GET_LATEST_CB_AREA_INFO"), UserHandle.ALL, "android.permission.RECEIVE_EMERGENCY_BROADCAST");
            }
        }
        registerReceiver(this.mBatteryInfoReceiver, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        this.mHandler.sendEmptyMessage(500);
    }

    private void updateDataState() {
        int state = this.mTelephonyManager.getDataState();
        String display = this.mRes.getString(2131427371);
        switch (state) {
            case 0:
                display = this.mRes.getString(2131427367);
                break;
            case 1:
                display = this.mRes.getString(2131427368);
                break;
            case 2:
                display = this.mRes.getString(2131427369);
                break;
            case 3:
                display = this.mRes.getString(2131427370);
                break;
        }
        setSummaryText("data_state", display);
    }

    void updateSignalStrength() {
        if (this.mSignalStrength != null) {
            int state = this.mPhoneStateReceiver.getServiceState().getState();
            Resources resources = getResources();
            if (1 == state || 3 == state) {
                this.mSignalStrength.setSummary("0");
            }
            int signalStrengthDbm = this.mPhoneStateReceiver.getSignalStrengthDbm();
            if (-1 == signalStrengthDbm) {
                signalStrengthDbm = 0;
            }
            int signalStrengthLevelAsu = this.mPhoneStateReceiver.getSignalStrengthLevelAsu();
            if (-1 == signalStrengthLevelAsu) {
                signalStrengthLevelAsu = 0;
            }
            this.mSignalStrength.setSummary(String.valueOf(signalStrengthDbm) + " " + resources.getString(2131427374) + "   " + String.valueOf(signalStrengthLevelAsu) + " " + resources.getString(2131427375));
        }
    }

    private void setWimaxStatus() {
        if (((ConnectivityManager) getSystemService("connectivity")).getNetworkInfo(6) == null) {
            PreferenceScreen preferenceScreen = getPreferenceScreen();
            Preference findPreference = findPreference("wimax_mac_address");
            if (findPreference != null) {
                preferenceScreen.removePreference(findPreference);
                return;
            }
            return;
        }
        findPreference("wimax_mac_address").setSummary(SystemProperties.get("net.wimax.mac.address", getString(2131428111)));
    }

    private void setBtStatus() {
        BluetoothAdapter bluetooth = BluetoothAdapter.getDefaultAdapter();
        Preference btAddressPref = findPreference("bt_address");
        if (bluetooth == null) {
            getPreferenceScreen().removePreference(btAddressPref);
            return;
        }
        String address = bluetooth.isEnabled() ? bluetooth.getAddress() : null;
        if (TextUtils.isEmpty(address)) {
            address = getString(2131428111);
        }
        btAddressPref.setSummary(address);
    }

    public void onPause() {
        super.onPause();
        if (!(this.mPhone == null || Utils.isWifiOnly(getApplicationContext()))) {
            this.mPhoneStateReceiver.unregisterIntent();
            this.mTelephonyManager.listen(this.mPhoneStateListener, 0);
        }
        if (this.mShowLatestAreaInfo) {
            unregisterReceiver(this.mAreaInfoReceiver);
        }
        unregisterReceiver(this.mBatteryInfoReceiver);
        this.mHandler.removeMessages(500);
    }

    private void setWifiStatus() {
        WifiInfo wifiInfo = ((WifiManager) getSystemService("wifi")).getConnectionInfo();
        Preference wifiMacAddressPref = findPreference("wifi_mac_address");
        String macAddress = wifiInfo == null ? null : wifiInfo.getMacAddress();
        if (TextUtils.isEmpty(macAddress)) {
            macAddress = getString(2131428111);
        }
        wifiMacAddressPref.setSummary(macAddress);
    }

    private void setIpAddressStatus() {
        Preference ipAddressPref = findPreference("wifi_ip_address");
        String ipAddress = Utils.getDefaultIpAddresses(this);
        if (ipAddress != null) {
            ipAddressPref.setSummary(ipAddress);
        } else {
            ipAddressPref.setSummary(getString(2131428111));
        }
    }

    void updateTimes() {
        long at = SystemClock.uptimeMillis() / 1000;
        long ut = SystemClock.elapsedRealtime() / 1000;
        if (ut == 0) {
            ut = 1;
        }
        this.mUptime.setSummary(convert(ut));
    }

    private void setSummaryText(String str, String str2) {
        CharSequence str22;
        if (TextUtils.isEmpty(str22)) {
            str22 = this.sUnknown;
        }
        if (findPreference(str) != null) {
            findPreference(str).setSummary(str22);
        }
    }

    private void updateNetworkType() {
        String networktype = null;
        if (this.mTelephonyManager.getNetworkType() != 0) {
            networktype = this.mTelephonyManager.getNetworkTypeName();
        }
        setSummaryText("network_type", networktype);
    }

    private String convert(long j) {
        return ((int) (j / 3600)) + ":" + pad((int) ((j / 60) % 60)) + ":" + pad((int) (j % 60));
    }

    private void removePreferenceFromScreen(String str) {
        Preference pref = findPreference(str);
        if (pref != null) {
            getPreferenceScreen().removePreference(pref);
        }
    }

    private String pad(int i) {
        return i >= 10 ? String.valueOf(i) : "0" + String.valueOf(i);
    }

    private void updateAreaInfo(String str) {
        if (str != null) {
            setSummaryText("latest_area_info", str);
        }
    }
}