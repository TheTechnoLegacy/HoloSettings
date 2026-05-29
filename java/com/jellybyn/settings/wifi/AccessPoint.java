package com.jellybyn.settings.wifi;

import android.content.Context;
import android.net.NetworkInfo.DetailedState;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.preference.Preference;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

class AccessPoint extends Preference {
    private static final int[] STATE_NONE = new int[0];
    private static final int[] STATE_SECURED = new int[]{2130771968};
    String bssid;
    private WifiConfiguration mConfig;
    private WifiInfo mInfo;
    private int mRssi;
    ScanResult mScanResult;
    private DetailedState mState;
    int networkId;
    PskType pskType = PskType.UNKNOWN;
    int security;
    String ssid;
    boolean wpsAvailable = false;

    private void refresh() {
        setTitle(this.ssid);
        Context context = getContext();
        if (this.mConfig != null && this.mConfig.status == 1) {
            switch (this.mConfig.disableReason) {
                case 0:
                    setSummary(context.getString(2131427875));
                    return;
                case 1:
                case 2:
                    setSummary(context.getString(2131427876));
                    return;
                case 3:
                    setSummary(context.getString(2131427877));
                    return;
                default:
                    return;
            }
        } else if (this.mRssi == Integer.MAX_VALUE) {
            setSummary(context.getString(2131427878));
        } else if (this.mState != null) {
            setSummary(Summary.get(context, this.mState));
        } else {
            StringBuilder summary = new StringBuilder();
            if (this.mConfig != null) {
                summary.append(context.getString(2131427874));
            }
            if (this.security != 0) {
                summary.append(String.format(summary.length() == 0 ? context.getString(2131427881) : context.getString(2131427882), new Object[]{getSecurityString(true)}));
            }
            if (this.mConfig == null && this.wpsAvailable) {
                if (summary.length() == 0) {
                    summary.append(context.getString(2131427879));
                } else {
                    summary.append(context.getString(2131427880));
                }
            }
            setSummary(summary.toString());
        }
    }

    void update(WifiInfo wifiInfo, DetailedState detailedState) {
        boolean reorder = false;
        if (wifiInfo != null && this.networkId != -1 && this.networkId == wifiInfo.getNetworkId()) {
            reorder = this.mInfo == null;
            this.mRssi = wifiInfo.getRssi();
            this.mInfo = wifiInfo;
            this.mState = detailedState;
            refresh();
        } else if (this.mInfo != null) {
            reorder = true;
            this.mInfo = null;
            this.mState = null;
            refresh();
        }
        if (reorder) {
            notifyHierarchyChanged();
        }
    }

    AccessPoint(Context context, Bundle bundle) {
        super(context);
        setWidgetLayoutResource(2130968678);
        this.mConfig = (WifiConfiguration) bundle.getParcelable("key_config");
        if (this.mConfig != null) {
            loadConfig(this.mConfig);
        }
        this.mScanResult = (ScanResult) bundle.getParcelable("key_scanresult");
        if (this.mScanResult != null) {
            loadResult(this.mScanResult);
        }
        this.mInfo = (WifiInfo) bundle.getParcelable("key_wifiinfo");
        if (bundle.containsKey("key_detailedstate")) {
            this.mState = DetailedState.valueOf(bundle.getString("key_detailedstate"));
        }
        update(this.mInfo, this.mState);
    }

    public String getSecurityString(boolean z) {
        Context context = getContext();
        switch (this.security) {
            case 1:
                return z ? context.getString(2131427883) : context.getString(2131427890);
            case 2:
                switch (1.$SwitchMap$com$android$settings$wifi$AccessPoint$PskType[this.pskType.ordinal()]) {
                    case 1:
                        return z ? context.getString(2131427884) : context.getString(2131427891);
                    case 2:
                        return z ? context.getString(2131427885) : context.getString(2131427892);
                    case 3:
                        return z ? context.getString(2131427886) : context.getString(2131427893);
                    default:
                        return z ? context.getString(2131427887) : context.getString(2131427894);
                }
            case 3:
                return z ? context.getString(2131427888) : context.getString(2131427895);
            default:
                return z ? "" : context.getString(2131427889);
        }
    }

    public int compareTo(Preference preference) {
        if (!(preference instanceof AccessPoint)) {
            return 1;
        }
        AccessPoint other = (AccessPoint) preference;
        if (this.mInfo != null && other.mInfo == null) {
            return -1;
        }
        if (this.mInfo == null && other.mInfo != null) {
            return 1;
        }
        if (this.mRssi != Integer.MAX_VALUE && other.mRssi == Integer.MAX_VALUE) {
            return -1;
        }
        if (this.mRssi == Integer.MAX_VALUE && other.mRssi != Integer.MAX_VALUE) {
            return 1;
        }
        if (this.networkId != -1 && other.networkId == -1) {
            return -1;
        }
        if (this.networkId == -1 && other.networkId != -1) {
            return 1;
        }
        int difference = WifiManager.compareSignalLevel(other.mRssi, this.mRssi);
        return difference == 0 ? this.ssid.compareToIgnoreCase(other.ssid) : difference;
    }

    private static PskType getPskType(ScanResult scanResult) {
        boolean wpa = scanResult.capabilities.contains("WPA-PSK");
        boolean wpa2 = scanResult.capabilities.contains("WPA2-PSK");
        if (wpa2 && wpa) {
            return PskType.WPA_WPA2;
        }
        if (wpa2) {
            return PskType.WPA2;
        }
        if (wpa) {
            return PskType.WPA;
        }
        Log.w("Settings.AccessPoint", "Received abnormal flag string: " + scanResult.capabilities);
        return PskType.UNKNOWN;
    }

    private void loadResult(ScanResult scanResult) {
        this.ssid = scanResult.SSID;
        this.bssid = scanResult.BSSID;
        this.security = getSecurity(scanResult);
        boolean z = this.security != 3 && scanResult.capabilities.contains("WPS");
        this.wpsAvailable = z;
        if (this.security == 2) {
            this.pskType = getPskType(scanResult);
        }
        this.networkId = -1;
        this.mRssi = scanResult.level;
        this.mScanResult = scanResult;
    }

    boolean update(ScanResult scanResult) {
        if (!this.ssid.equals(scanResult.SSID) || this.security != getSecurity(scanResult)) {
            return false;
        }
        if (WifiManager.compareSignalLevel(scanResult.level, this.mRssi) > 0) {
            int level = getLevel();
            this.mRssi = scanResult.level;
            if (getLevel() != level) {
                notifyChanged();
            }
        }
        if (this.security == 2) {
            this.pskType = getPskType(scanResult);
        }
        refresh();
        return true;
    }

    private static int getSecurity(ScanResult scanResult) {
        if (scanResult.capabilities.contains("WEP")) {
            return 1;
        }
        if (scanResult.capabilities.contains("PSK")) {
            return 2;
        }
        return scanResult.capabilities.contains("EAP") ? 3 : 0;
    }

    private void loadConfig(WifiConfiguration wifiConfiguration) {
        this.ssid = wifiConfiguration.SSID == null ? "" : removeDoubleQuotes(wifiConfiguration.SSID);
        this.bssid = wifiConfiguration.BSSID;
        this.security = getSecurity(wifiConfiguration);
        this.networkId = wifiConfiguration.networkId;
        this.mRssi = Integer.MAX_VALUE;
        this.mConfig = wifiConfiguration;
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        ImageView signal = (ImageView) view.findViewById(2131230965);
        if (this.mRssi == Integer.MAX_VALUE) {
            signal.setImageDrawable(null);
            return;
        }
        signal.setImageLevel(getLevel());
        signal.setImageResource(2130837673);
        signal.setImageState(this.security != 0 ? STATE_SECURED : STATE_NONE, true);
    }

    AccessPoint(Context context, ScanResult scanResult) {
        super(context);
        setWidgetLayoutResource(2130968678);
        loadResult(scanResult);
        refresh();
    }

    AccessPoint(Context context, WifiConfiguration wifiConfiguration) {
        super(context);
        setWidgetLayoutResource(2130968678);
        loadConfig(wifiConfiguration);
        refresh();
    }

    protected void generateOpenNetworkConfig() {
        if (this.security != 0) {
            throw new IllegalStateException();
        } else if (this.mConfig == null) {
            this.mConfig = new WifiConfiguration();
            this.mConfig.SSID = convertToQuotedString(this.ssid);
            this.mConfig.allowedKeyManagement.set(0);
        }
    }

    public int hashCode() {
        int result = 0;
        if (this.mInfo != null) {
            result = 0 + (this.mInfo.hashCode() * 13);
        }
        return ((result + (this.mRssi * 19)) + (this.networkId * 23)) + (this.ssid.hashCode() * 29);
    }

    public void saveWifiState(Bundle bundle) {
        bundle.putParcelable("key_config", this.mConfig);
        bundle.putParcelable("key_scanresult", this.mScanResult);
        bundle.putParcelable("key_wifiinfo", this.mInfo);
        if (this.mState != null) {
            bundle.putString("key_detailedstate", this.mState.toString());
        }
    }

    static int getSecurity(WifiConfiguration wifiConfiguration) {
        if (wifiConfiguration.allowedKeyManagement.get(1)) {
            return 2;
        }
        if (wifiConfiguration.allowedKeyManagement.get(2) || wifiConfiguration.allowedKeyManagement.get(3)) {
            return 3;
        }
        return wifiConfiguration.wepKeys[0] == null ? 0 : 1;
    }

    static String removeDoubleQuotes(String str) {
        int length = str.length();
        return (length > 1 && str.charAt(0) == '\"' && str.charAt(length - 1) == '\"') ? str.substring(1, length - 1) : str;
    }

    int getLevel() {
        return this.mRssi == Integer.MAX_VALUE ? -1 : WifiManager.calculateSignalLevel(this.mRssi, 4);
    }

    public boolean equals(Object obj) {
        return (obj instanceof AccessPoint) && compareTo((AccessPoint) obj) == 0;
    }

    static String convertToQuotedString(String str) {
        return "\"" + str + "\"";
    }

    WifiConfiguration getConfig() {
        return this.mConfig;
    }

    WifiInfo getInfo() {
        return this.mInfo;
    }

    DetailedState getState() {
        return this.mState;
    }
}