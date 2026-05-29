package com.jellybyn.settings.wifi;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.net.NetworkInfo;
import android.net.wifi.ScanResult;
import android.net.wifi.SupplicantState;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class WifiStatusTest extends Activity {
    private TextView mBSSID;
    private TextView mHiddenSSID;
    private TextView mHttpClientTest;
    private String mHttpClientTestResult;
    private TextView mIPAddr;
    private TextView mLinkSpeed;
    private TextView mMACAddr;
    private TextView mNetworkId;
    private TextView mNetworkState;
    OnClickListener mPingButtonHandler = new 1(this);
    private TextView mPingHostname;
    private String mPingHostnameResult;
    private TextView mPingIpAddr;
    private String mPingIpAddrResult;
    private TextView mRSSI;
    private TextView mSSID;
    private TextView mScanList;
    private TextView mSupplicantState;
    private WifiManager mWifiManager;
    private TextView mWifiState;
    private IntentFilter mWifiStateFilter;
    private final BroadcastReceiver mWifiStateReceiver = new 1(this);
    private Button pingTestButton;
    private Button updateButton;
    OnClickListener updateButtonHandler = new 1(this);

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mWifiManager = (WifiManager) getSystemService("wifi");
        this.mWifiStateFilter = new HttpGet("android.net.wifi.WIFI_STATE_CHANGED");
        this.mWifiStateFilter.addAction("android.net.wifi.STATE_CHANGE");
        this.mWifiStateFilter.addAction("android.net.wifi.SCAN_RESULTS");
        this.mWifiStateFilter.addAction("android.net.wifi.supplicant.STATE_CHANGE");
        this.mWifiStateFilter.addAction("android.net.wifi.RSSI_CHANGED");
        this.mWifiStateFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        registerReceiver(this.mWifiStateReceiver, this.mWifiStateFilter);
        setContentView(2130968726);
        this.updateButton = (Button) findViewById(2131231191);
        this.updateButton.setOnClickListener(this.updateButtonHandler);
        this.mWifiState = (TextView) findViewById(2131231192);
        this.mNetworkState = (TextView) findViewById(2131231193);
        this.mSupplicantState = (TextView) findViewById(2131231194);
        this.mRSSI = (TextView) findViewById(2131231195);
        this.mBSSID = (TextView) findViewById(2131231196);
        this.mSSID = (TextView) findViewById(2131231122);
        this.mHiddenSSID = (TextView) findViewById(2131231197);
        this.mIPAddr = (TextView) findViewById(2131231198);
        this.mMACAddr = (TextView) findViewById(2131231199);
        this.mNetworkId = (TextView) findViewById(2131231200);
        this.mLinkSpeed = (TextView) findViewById(2131231201);
        this.mScanList = (TextView) findViewById(2131231202);
        this.mPingIpAddr = (TextView) findViewById(2131230976);
        this.mPingHostname = (TextView) findViewById(2131230977);
        this.mHttpClientTest = (TextView) findViewById(2131230978);
        this.pingTestButton = (Button) findViewById(2131230975);
        this.pingTestButton.setOnClickListener(this.mPingButtonHandler);
    }

    private void setSupplicantStateText(SupplicantState supplicantState) {
        if (SupplicantState.FOUR_WAY_HANDSHAKE.equals(supplicantState)) {
            this.mSupplicantState.setText("FOUR WAY HANDSHAKE");
        } else if (SupplicantState.ASSOCIATED.equals(supplicantState)) {
            this.mSupplicantState.setText("ASSOCIATED");
        } else if (SupplicantState.ASSOCIATING.equals(supplicantState)) {
            this.mSupplicantState.setText("ASSOCIATING");
        } else if (SupplicantState.COMPLETED.equals(supplicantState)) {
            this.mSupplicantState.setText("COMPLETED");
        } else if (SupplicantState.DISCONNECTED.equals(supplicantState)) {
            this.mSupplicantState.setText("DISCONNECTED");
        } else if (SupplicantState.DORMANT.equals(supplicantState)) {
            this.mSupplicantState.setText("DORMANT");
        } else if (SupplicantState.GROUP_HANDSHAKE.equals(supplicantState)) {
            this.mSupplicantState.setText("GROUP HANDSHAKE");
        } else if (SupplicantState.INACTIVE.equals(supplicantState)) {
            this.mSupplicantState.setText("INACTIVE");
        } else if (SupplicantState.INVALID.equals(supplicantState)) {
            this.mSupplicantState.setText("INVALID");
        } else if (SupplicantState.SCANNING.equals(supplicantState)) {
            this.mSupplicantState.setText("SCANNING");
        } else if (SupplicantState.UNINITIALIZED.equals(supplicantState)) {
            this.mSupplicantState.setText("UNINITIALIZED");
        } else {
            this.mSupplicantState.setText("BAD");
            Log.e("WifiStatusTest", "supplicant state is bad");
        }
    }

    private void setWifiStateText(int i) {
        String wifiStateString;
        switch (i) {
            case 0:
                wifiStateString = getString(2131427977);
                break;
            case 1:
                wifiStateString = getString(2131427978);
                break;
            case 2:
                wifiStateString = getString(2131427979);
                break;
            case 3:
                wifiStateString = getString(2131427980);
                break;
            case 4:
                wifiStateString = getString(2131427981);
                break;
            default:
                wifiStateString = "BAD";
                Log.e("WifiStatusTest", "wifi state is bad");
                break;
        }
        this.mWifiState.setText(wifiStateString);
    }

    private final void updatePingState() {
        Handler handler = new Handler();
        this.mPingIpAddrResult = getResources().getString(2131427371);
        this.mPingHostnameResult = getResources().getString(2131427371);
        this.mHttpClientTestResult = getResources().getString(2131427371);
        this.mPingIpAddr.setText(this.mPingIpAddrResult);
        this.mPingHostname.setText(this.mPingHostnameResult);
        this.mHttpClientTest.setText(this.mHttpClientTestResult);
        Runnable updatePingResults = new 1(this);
        new 5(this, handler, updatePingResults).start();
        new 5(this, handler, updatePingResults).start();
        new 5(this, handler, updatePingResults).start();
    }

    private final void pingHostname() {
        try {
            if (Runtime.getRuntime().exec("ping -c 1 -w 100 www.google.com").waitFor() == 0) {
                this.mPingHostnameResult = "Pass";
            } else {
                this.mPingHostnameResult = "Fail: Host unreachable";
            }
        } catch (UnknownHostException e) {
            this.mPingHostnameResult = "Fail: Unknown Host";
        } catch (IOException e2) {
            this.mPingHostnameResult = "Fail: IOException";
        } catch (InterruptedException e3) {
            this.mPingHostnameResult = "Fail: InterruptedException";
        }
    }

    private void handleScanResultsAvailable() {
        List<ScanResult> list = this.mWifiManager.getScanResults();
        StringBuffer scanList = new StringBuffer();
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                ScanResult scanResult = (ScanResult) list.get(size);
                if (!(scanResult == null || TextUtils.isEmpty(scanResult.SSID))) {
                    scanList.append(scanResult.SSID + " ");
                }
            }
        }
        this.mScanList.setText(scanList);
    }

    private final void pingIpAddr() {
        try {
            if (Runtime.getRuntime().exec("ping -c 1 -w 100 " + "74.125.47.104").waitFor() == 0) {
                this.mPingIpAddrResult = "Pass";
            } else {
                this.mPingIpAddrResult = "Fail: IP addr not reachable";
            }
        } catch (IOException e) {
            this.mPingIpAddrResult = "Fail: IOException";
        } catch (InterruptedException e2) {
            this.mPingIpAddrResult = "Fail: InterruptedException";
        }
    }

    private void httpClientTest() {
        HttpClient client = new DefaultHttpClient();
        try {
            HttpGet httpGet = new HttpGet("http://www.google.com");
            HttpResponse execute = client.execute(httpGet);
            if (execute.getStatusLine().getStatusCode() == 200) {
                this.mHttpClientTestResult = "Pass";
            } else {
                this.mHttpClientTestResult = "Fail: Code: " + String.valueOf(execute);
            }
            httpGet.abort();
        } catch (IOException e) {
            this.mHttpClientTestResult = "Fail: IOException";
        }
    }

    private void handleNetworkStateChanged(NetworkInfo networkInfo) {
        if (this.mWifiManager.isWifiEnabled()) {
            this.mNetworkState.setText(Summary.get(this, this.mWifiManager.getConnectionInfo().getSSID(), networkInfo.getDetailedState()));
        }
    }

    private void handleSupplicantStateChanged(SupplicantState supplicantState, boolean z, int i) {
        if (z) {
            this.mSupplicantState.setText("ERROR AUTHENTICATING");
        } else {
            setSupplicantStateText(supplicantState);
        }
    }

    protected void onPause() {
        super.onPause();
        unregisterReceiver(this.mWifiStateReceiver);
    }

    protected void onResume() {
        super.onResume();
        registerReceiver(this.mWifiStateReceiver, this.mWifiStateFilter);
    }

    private void handleSignalChanged(int i) {
        this.mRSSI.setText(String.valueOf(i));
    }

    private void handleWifiStateChanged(int i) {
        setWifiStateText(i);
    }
}