package com.jellybyn.settings;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.admin.DevicePolicyManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.nfc.NfcAdapter;
import android.os.Bundle;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.provider.Settings.Global;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import com.jellybyn.settings.nfc.NfcEnabler;

public class WirelessSettings extends SettingsPreferenceFragment {
    private AirplaneModeEnabler mAirplaneModeEnabler;
    private CheckBoxPreference mAirplaneModePreference;
    private ConnectivityManager mCm;
    private String mManageMobilePlanMessage;
    private NfcAdapter mNfcAdapter;
    private NfcEnabler mNfcEnabler;
    private NsdEnabler mNsdEnabler;
    private TelephonyManager mTm;

    public void onCreate(Bundle bundle) {
        PreferenceScreen preferenceScreen;
        Preference findPreference;
        super.onCreate(bundle);
        if (bundle != null) {
            this.mManageMobilePlanMessage = bundle.getString("mManageMobilePlanMessage");
        }
        log("onCreate: mManageMobilePlanMessage=" + this.mManageMobilePlanMessage);
        this.mCm = (ConnectivityManager) getSystemService("connectivity");
        this.mTm = (TelephonyManager) getSystemService("phone");
        addPreferencesFromResource(2131034169);
        boolean isSecondaryUser = UserHandle.myUserId() != 0;
        Activity activity = getActivity();
        this.mAirplaneModePreference = (CheckBoxPreference) findPreference("toggle_airplane");
        CheckBoxPreference nfc = (CheckBoxPreference) findPreference("toggle_nfc");
        PreferenceScreen androidBeam = (PreferenceScreen) findPreference("android_beam_settings");
        CheckBoxPreference nsd = (CheckBoxPreference) findPreference("toggle_nsd");
        this.mAirplaneModeEnabler = new AirplaneModeEnabler(activity, this.mAirplaneModePreference);
        this.mNfcEnabler = new NfcEnabler(activity, nfc, androidBeam);
        getPreferenceScreen().removePreference(nsd);
        String toggleable = Global.getString(activity.getContentResolver(), "airplane_mode_toggleable_radios");
        boolean isWimaxEnabled = !isSecondaryUser && getResources().getBoolean(17891393);
        if (!isWimaxEnabled) {
            preferenceScreen = getPreferenceScreen();
            findPreference = findPreference("wimax_settings");
            if (findPreference != null) {
                preferenceScreen.removePreference(findPreference);
            }
        } else if (toggleable == null || (!toggleable.contains("wimax") && isWimaxEnabled)) {
            findPreference("wimax_settings").setDependency("toggle_airplane");
        }
        if (toggleable == null || !toggleable.contains("wifi")) {
            findPreference("vpn_settings").setDependency("toggle_airplane");
        }
        if (isSecondaryUser) {
            removePreference("vpn_settings");
        }
        if (toggleable == null || !toggleable.contains("bluetooth")) {
        }
        if (toggleable == null || !toggleable.contains("nfc")) {
            findPreference("toggle_nfc").setDependency("toggle_airplane");
            findPreference("android_beam_settings").setDependency("toggle_airplane");
        }
        this.mNfcAdapter = NfcAdapter.getDefaultAdapter(activity);
        if (this.mNfcAdapter == null) {
            getPreferenceScreen().removePreference(nfc);
            getPreferenceScreen().removePreference(androidBeam);
            this.mNfcEnabler = null;
        }
        if (isSecondaryUser || Utils.isWifiOnly(getActivity())) {
            removePreference("mobile_network_settings");
            removePreference("manage_mobile_plan");
        }
        Preference mGlobalProxy = findPreference("proxy_settings");
        DevicePolicyManager mDPM = (DevicePolicyManager) activity.getSystemService("device_policy");
        getPreferenceScreen().removePreference(mGlobalProxy);
        mGlobalProxy.setEnabled(mDPM.getGlobalProxyAdmin() == null);
        ConnectivityManager cm = (ConnectivityManager) activity.getSystemService("connectivity");
        if (isSecondaryUser || !cm.isTetheringSupported()) {
            getPreferenceScreen().removePreference(findPreference("tether_settings"));
        } else {
            findPreference("tether_settings").setTitle(Utils.getTetheringLabel(cm));
        }
        boolean isCellBroadcastAppLinkEnabled = getResources().getBoolean(17891398);
        if (isCellBroadcastAppLinkEnabled) {
            try {
                if (getPackageManager().getApplicationEnabledSetting("com.android.cellbroadcastreceiver") == 2) {
                    isCellBroadcastAppLinkEnabled = false;
                }
            } catch (IllegalArgumentException e) {
                isCellBroadcastAppLinkEnabled = false;
            }
        }
        if (isSecondaryUser || !isCellBroadcastAppLinkEnabled) {
            preferenceScreen = getPreferenceScreen();
            findPreference = findPreference("cell_broadcast_settings");
            if (findPreference != null) {
                preferenceScreen.removePreference(findPreference);
            }
        }
    }

    public void onManageMobilePlanClick() {
        log("onManageMobilePlanClick:");
        this.mManageMobilePlanMessage = null;
        Resources resources = getActivity().getResources();
        NetworkInfo ni = this.mCm.getProvisioningOrActiveNetworkInfo();
        if (this.mTm.hasIccCard() && ni != null) {
            String mobileProvisioningUrl = this.mCm.getMobileProvisioningUrl();
            if (TextUtils.isEmpty(mobileProvisioningUrl)) {
                if (TextUtils.isEmpty(this.mTm.getSimOperatorName())) {
                    if (TextUtils.isEmpty(this.mTm.getNetworkOperatorName())) {
                        this.mManageMobilePlanMessage = resources.getString(2131428247);
                    } else {
                        this.mManageMobilePlanMessage = resources.getString(2131428248, new Object[]{this.mTm.getNetworkOperatorName()});
                    }
                } else {
                    this.mManageMobilePlanMessage = resources.getString(2131428248, new Object[]{this.mTm.getSimOperatorName()});
                }
            } else {
                Intent intent = new Intent("com.android.server.connectivityservice.CONNECTED_TO_PROVISIONING_NETWORK_ACTION");
                intent.putExtra("EXTRA_URL", mobileProvisioningUrl);
                getActivity().getBaseContext().sendBroadcast(intent);
                this.mManageMobilePlanMessage = null;
            }
        } else if (this.mTm.hasIccCard()) {
            this.mManageMobilePlanMessage = resources.getString(2131428250);
        } else {
            this.mManageMobilePlanMessage = resources.getString(2131428249);
        }
        if (!TextUtils.isEmpty(this.mManageMobilePlanMessage)) {
            log("onManageMobilePlanClick: message=" + this.mManageMobilePlanMessage);
            showDialog(1);
        }
    }

    public void onPause() {
        super.onPause();
        this.mAirplaneModeEnabler.pause();
        if (this.mNfcEnabler != null) {
            this.mNfcEnabler.pause();
        }
        if (this.mNsdEnabler != null) {
            this.mNsdEnabler.pause();
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        log("onPreferenceTreeClick: preference=" + preference);
        if (preference == this.mAirplaneModePreference && Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode"))) {
            startActivityForResult(new Intent("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS", null), 1);
            return true;
        }
        if (preference == findPreference("manage_mobile_plan")) {
            onManageMobilePlanClick();
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    public void onResume() {
        super.onResume();
        this.mAirplaneModeEnabler.resume();
        if (this.mNfcEnabler != null) {
            this.mNfcEnabler.resume();
        }
        if (this.mNsdEnabler != null) {
            this.mNsdEnabler.resume();
        }
    }

    public Dialog onCreateDialog(int i) {
        log("onCreateDialog: dialogId=" + i);
        switch (i) {
            case 1:
                return new Builder(getActivity()).setMessage(this.mManageMobilePlanMessage).setCancelable(false).setPositiveButton(17039370, new 1(this)).create();
            default:
                return super.onCreateDialog(i);
        }
    }

    public static boolean isRadioAllowed(Context context, String str) {
        if (!AirplaneModeEnabler.isAirplaneModeOn(context)) {
            return true;
        }
        String toggleable = Global.getString(context.getContentResolver(), "airplane_mode_toggleable_radios");
        return toggleable != null && toggleable.contains(str);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 1) {
            this.mAirplaneModeEnabler.setAirplaneModeInECM(Boolean.valueOf(intent.getBooleanExtra("exit_ecm_result", false)).booleanValue(), this.mAirplaneModePreference.isChecked());
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (!TextUtils.isEmpty(this.mManageMobilePlanMessage)) {
            bundle.putString("mManageMobilePlanMessage", this.mManageMobilePlanMessage);
        }
    }

    private void log(String str) {
        Log.d("WirelessSettings", str);
    }

    protected int getHelpResource() {
        return 2131429117;
    }
}