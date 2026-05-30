package com.jellybyn.settings;

import android.app.Activity;
import android.content.res.Resources;
import android.net.TrafficStats;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemProperties;
import android.telephony.CellInfo;
import android.telephony.CellLocation;
import android.telephony.NeighboringCellInfo;
import android.telephony.PhoneStateListener;
import android.telephony.ServiceState;
import android.telephony.TelephonyManager;
import android.telephony.cdma.CdmaCellLocation;
import android.telephony.gsm.GsmCellLocation;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.View.OnClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneConstants.State;
import com.android.internal.telephony.PhoneFactory;
import com.android.internal.telephony.PhoneStateIntentReceiver;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class RadioInfo extends Activity {
    private final String TAG = "phone";
    private TextView attempts;
    private TextView callState;
    private Button cellInfoListRateButton;
    private TextView dBm;
    private TextView disconnects;
    private TextView dnsCheckState;
    private Button dnsCheckToggleButton;
    private TextView gprsState;
    private TextView gsmState;
    private Button imsRegRequiredButton;
    private Button lteRamDumpButton;
    private TextView mCellInfo;
    CellInfoListRateHandler mCellInfoListRateHandler = new 1(this);
    private List<CellInfo> mCellInfoValue;
    private TextView mCfi;
    private boolean mCfiValue = false;
    private TextView mDeviceId;
    OnClickListener mDnsCheckButtonHandler = new 1(this);
    private OnMenuItemClickListener mGetPdpList = new 1(this);
    private Handler mHandler = new 1(this);
    private TextView mHttpClientTest;
    private String mHttpClientTestResult;
    OnClickListener mImsRegRequiredHandler = new 1(this);
    private TextView mLocation;
    OnClickListener mLteRamDumpHandler = new 1(this);
    private TextView mMwi;
    private boolean mMwiValue = false;
    private TextView mNeighboringCids;
    OnClickListener mOemInfoButtonHandler = new 1(this);
    private PhoneStateListener mPhoneStateListener = new 1(this);
    private PhoneStateIntentReceiver mPhoneStateReceiver;
    OnClickListener mPingButtonHandler = new 1(this);
    private TextView mPingHostname;
    private String mPingHostnameResult;
    private TextView mPingIpAddr;
    private String mPingIpAddrResult;
    OnClickListener mPowerButtonHandler = new 1(this);
    OnItemSelectedListener mPreferredNetworkHandler = new 1(this);
    private String[] mPreferredNetworkLabels = new String[]{"WCDMA preferred", "GSM only", "WCDMA only", "GSM auto (PRL)", "CDMA auto (PRL)", "CDMA only", "EvDo only", "GSM/CDMA auto (PRL)", "LTE/CDMA auto (PRL)", "LTE/GSM auto (PRL)", "LTE/GSM/CDMA auto (PRL)", "LTE only", "Unknown"};
    OnClickListener mRefreshSmscButtonHandler = new 1(this);
    private OnMenuItemClickListener mSelectBandCallback = new 1(this);
    OnClickListener mSmsOverImsHandler = new 1(this);
    private TelephonyManager mTelephonyManager;
    private OnMenuItemClickListener mToggleData = new 1(this);
    OnClickListener mUpdateSmscButtonHandler = new 1(this);
    private OnMenuItemClickListener mViewADNCallback = new 1(this);
    private OnMenuItemClickListener mViewFDNCallback = new 1(this);
    private OnMenuItemClickListener mViewSDNCallback = new 1(this);
    private TextView network;
    private TextView number;
    private Button oemInfoButton;
    private TextView operatorName;
    private Phone phone = null;
    private Button pingTestButton;
    private Spinner preferredNetworkType;
    private Button radioPowerButton;
    private TextView received;
    private Button refreshSmscButton;
    private TextView resets;
    private TextView roamingState;
    private TextView sent;
    private TextView sentSinceReceived;
    private Button smsOverImsButton;
    private EditText smsc;
    private TextView successes;
    private Button updateSmscButton;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(2130968681);
        this.mTelephonyManager = (TelephonyManager) getSystemService("phone");
        this.phone = PhoneFactory.getDefaultPhone();
        this.mDeviceId = (TextView) findViewById(2131230972);
        this.number = (TextView) findViewById(2131230973);
        this.callState = (TextView) findViewById(2131230989);
        this.operatorName = (TextView) findViewById(2131230974);
        this.roamingState = (TextView) findViewById(2131230983);
        this.gsmState = (TextView) findViewById(2131230984);
        this.gprsState = (TextView) findViewById(2131230985);
        this.network = (TextView) findViewById(2131230986);
        this.dBm = (TextView) findViewById(2131230979);
        this.mMwi = (TextView) findViewById(2131230987);
        this.mCfi = (TextView) findViewById(2131230988);
        this.mLocation = (TextView) findViewById(2131230980);
        this.mNeighboringCids = (TextView) findViewById(2131230981);
        this.mCellInfo = (TextView) findViewById(2131230982);
        this.resets = (TextView) findViewById(2131230990);
        this.attempts = (TextView) findViewById(2131230991);
        this.successes = (TextView) findViewById(2131230992);
        this.disconnects = (TextView) findViewById(2131230993);
        this.sentSinceReceived = (TextView) findViewById(2131230996);
        this.sent = (TextView) findViewById(2131230994);
        this.received = (TextView) findViewById(2131230995);
        this.smsc = (EditText) findViewById(2131231006);
        this.dnsCheckState = (TextView) findViewById(2131231008);
        this.mPingIpAddr = (TextView) findViewById(2131230976);
        this.mPingHostname = (TextView) findViewById(2131230977);
        this.mHttpClientTest = (TextView) findViewById(2131230978);
        this.preferredNetworkType = (Spinner) findViewById(2131230997);
        ArrayAdapter<String> adapter = new ArrayAdapter(this, 17367048, this.mPreferredNetworkLabels);
        adapter.setDropDownViewResource(17367049);
        this.preferredNetworkType.setAdapter(adapter);
        this.preferredNetworkType.setOnItemSelectedListener(this.mPreferredNetworkHandler);
        this.radioPowerButton = (Button) findViewById(2131230998);
        this.radioPowerButton.setOnClickListener(this.mPowerButtonHandler);
        this.cellInfoListRateButton = (Button) findViewById(2131230999);
        this.cellInfoListRateButton.setOnClickListener(this.mCellInfoListRateHandler);
        this.imsRegRequiredButton = (Button) findViewById(2131231000);
        this.imsRegRequiredButton.setOnClickListener(this.mImsRegRequiredHandler);
        this.smsOverImsButton = (Button) findViewById(2131231001);
        this.smsOverImsButton.setOnClickListener(this.mSmsOverImsHandler);
        this.lteRamDumpButton = (Button) findViewById(2131231002);
        this.lteRamDumpButton.setOnClickListener(this.mLteRamDumpHandler);
        this.pingTestButton = (Button) findViewById(2131230975);
        this.pingTestButton.setOnClickListener(this.mPingButtonHandler);
        this.updateSmscButton = (Button) findViewById(2131231004);
        this.updateSmscButton.setOnClickListener(this.mUpdateSmscButtonHandler);
        this.refreshSmscButton = (Button) findViewById(2131231005);
        this.refreshSmscButton.setOnClickListener(this.mRefreshSmscButtonHandler);
        this.dnsCheckToggleButton = (Button) findViewById(2131231007);
        this.dnsCheckToggleButton.setOnClickListener(this.mDnsCheckButtonHandler);
        this.oemInfoButton = (Button) findViewById(2131231009);
        this.oemInfoButton.setOnClickListener(this.mOemInfoButtonHandler);
        if (getPackageManager().queryIntentActivities(new HttpGet("com.jellybyn.settings.OEM_RADIO_INFO"), 0).size() == 0) {
            this.oemInfoButton.setEnabled(false);
        }
        this.mPhoneStateReceiver = new PhoneStateIntentReceiver(this, this.mHandler);
        this.mPhoneStateReceiver.notifySignalStrength(200);
        this.mPhoneStateReceiver.notifyServiceState(300);
        this.mPhoneStateReceiver.notifyPhoneCallState(100);
        this.phone.getPreferredNetworkType(this.mHandler.obtainMessage(1000));
        this.phone.getNeighboringCids(this.mHandler.obtainMessage(1002));
        CellLocation.requestLocationUpdate();
        this.mCellInfoValue = this.mTelephonyManager.getAllCellInfo();
        log("onCreate: mCellInfoValue=" + this.mCellInfoValue);
    }

    protected void onResume() {
        super.onResume();
        updatePhoneState();
        updateSignalStrength();
        updateMessageWaiting();
        updateCallRedirect();
        updateServiceState();
        updateLocation(this.mTelephonyManager.getCellLocation());
        updateDataState();
        updateDataStats();
        updateDataStats2();
        updatePowerState();
        updateCellInfoListRate();
        updateImsRegRequiredState();
        updateSmsOverImsState();
        updateLteRamDumpState();
        updateProperties();
        updateDnsCheckState();
        log("onResume: register phone & data intents");
        this.mPhoneStateReceiver.registerIntent();
        this.mTelephonyManager.listen(this.mPhoneStateListener, 1244);
    }

    private final void updateLocation(CellLocation cellLocation) {
        Resources resources = getResources();
        int lac;
        int cid;
        if (cellLocation instanceof GsmCellLocation) {
            GsmCellLocation gsmCellLocation = (GsmCellLocation) cellLocation;
            lac = gsmCellLocation.getLac();
            cid = gsmCellLocation.getCid();
            this.mLocation.setText(resources.getString(2131427376) + " = " + (lac == -1 ? "unknown" : Integer.toHexString(lac)) + "   " + resources.getString(2131427377) + " = " + (cid == -1 ? "unknown" : Integer.toHexString(cid)));
        } else if (cellLocation instanceof CdmaCellLocation) {
            CdmaCellLocation cdmaCellLocation = (CdmaCellLocation) cellLocation;
            lac = cdmaCellLocation.getBaseStationId();
            int systemId = cdmaCellLocation.getSystemId();
            cid = cdmaCellLocation.getNetworkId();
            int baseStationLatitude = cdmaCellLocation.getBaseStationLatitude();
            int baseStationLongitude = cdmaCellLocation.getBaseStationLongitude();
            this.mLocation.setText("BID = " + (lac == -1 ? "unknown" : Integer.toHexString(lac)) + "   " + "SID = " + (systemId == -1 ? "unknown" : Integer.toHexString(systemId)) + "   " + "NID = " + (cid == -1 ? "unknown" : Integer.toHexString(cid)) + "\n" + "LAT = " + (baseStationLatitude == -1 ? "unknown" : Integer.toHexString(baseStationLatitude)) + "   " + "LONG = " + (baseStationLongitude == -1 ? "unknown" : Integer.toHexString(baseStationLongitude)));
        } else {
            this.mLocation.setText("unknown");
        }
    }

    private final void updatePingState() {
        Handler handler = new Handler();
        this.mPingIpAddrResult = getResources().getString(2131427371);
        this.mPingHostnameResult = getResources().getString(2131427371);
        this.mHttpClientTestResult = getResources().getString(2131427371);
        this.mPingIpAddr.setText(this.mPingIpAddrResult);
        this.mPingHostname.setText(this.mPingHostnameResult);
        this.mHttpClientTest.setText(this.mHttpClientTestResult);
        3 1 = new 1(this);
        new 4(this, handler, 1).start();
        new 4(this, handler, 1).start();
        new 4(this, handler, 1).start();
    }

    private final void updateServiceState() {
        ServiceState serviceState = this.mPhoneStateReceiver.getServiceState();
        int state = serviceState.getState();
        Resources resources = getResources();
        CharSequence string = resources.getString(2131427371);
        switch (state) {
            case 0:
                string = resources.getString(2131427358);
                break;
            case 1:
            case 2:
                string = resources.getString(2131427360);
                break;
            case 3:
                string = resources.getString(2131427361);
                break;
        }
        this.gsmState.setText(string);
        if (serviceState.getRoaming()) {
            this.roamingState.setText(2131427362);
        } else {
            this.roamingState.setText(2131427363);
        }
        this.operatorName.setText(serviceState.getOperatorAlphaLong());
    }

    private final void updateCellInfoTv(List<CellInfo> list) {
        this.mCellInfoValue = list;
        StringBuilder stringBuilder = new StringBuilder();
        if (this.mCellInfoValue != null) {
            int i = 0;
            for (CellInfo cellInfo : this.mCellInfoValue) {
                stringBuilder.append('[');
                stringBuilder.append(i);
                stringBuilder.append("]=");
                stringBuilder.append(cellInfo.toString());
                int i2 = i + 1;
                if (i2 < this.mCellInfoValue.size()) {
                    stringBuilder.append("\n");
                }
                i = i2;
            }
        }
        this.mCellInfo.setText(stringBuilder.toString());
    }

    private final void pingHostname() {
        try {
            if (Runtime.getRuntime().exec("ping -c 1 www.google.com").waitFor() == 0) {
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

    private final void pingIpAddr() {
        try {
            if (Runtime.getRuntime().exec("ping -c 1 " + "74.125.47.104").waitFor() == 0) {
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

    private final void updateDataState() {
        int dataState = this.mTelephonyManager.getDataState();
        Resources resources = getResources();
        CharSequence string = resources.getString(2131427371);
        switch (dataState) {
            case 0:
                string = resources.getString(2131427367);
                break;
            case 1:
                string = resources.getString(2131427368);
                break;
            case 2:
                string = resources.getString(2131427369);
                break;
            case 3:
                string = resources.getString(2131427370);
                break;
        }
        this.gprsState.setText(string);
    }

    private void httpClientTest() {
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        try {
            HttpGet httpGet = new HttpGet("http://www.google.com");
            HttpResponse execute = defaultHttpClient.execute(httpGet);
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

    private final void updateDataStats2() {
        Resources resources = getResources();
        long mobileTxPackets = TrafficStats.getMobileTxPackets();
        long mobileRxPackets = TrafficStats.getMobileRxPackets();
        long mobileTxBytes = TrafficStats.getMobileTxBytes();
        long mobileRxBytes = TrafficStats.getMobileRxBytes();
        String string = resources.getString(2131427372);
        String string2 = resources.getString(2131427373);
        this.sent.setText(mobileTxPackets + " " + string + ", " + mobileTxBytes + " " + string2);
        this.received.setText(mobileRxPackets + " " + string + ", " + mobileRxBytes + " " + string2);
    }

    private final void updatePhoneState() {
        State phoneState = this.mPhoneStateReceiver.getPhoneState();
        Resources resources = getResources();
        CharSequence string = resources.getString(2131427371);
        switch (23.$SwitchMap$com$android$internal$telephony$PhoneConstants$State[phoneState.ordinal()]) {
            case 1:
                string = resources.getString(2131427364);
                break;
            case 2:
                string = resources.getString(2131427365);
                break;
            case 3:
                string = resources.getString(2131427366);
                break;
        }
        this.callState.setText(string);
    }

    private final void updateSignalStrength() {
        int i = 0;
        int state = this.mPhoneStateReceiver.getServiceState().getState();
        Resources resources = getResources();
        if (1 == state || 3 == state) {
            this.dBm.setText("0");
        }
        state = this.mPhoneStateReceiver.getSignalStrengthDbm();
        if (-1 == state) {
            state = 0;
        }
        int signalStrengthLevelAsu = this.mPhoneStateReceiver.getSignalStrengthLevelAsu();
        if (-1 != signalStrengthLevelAsu) {
            i = signalStrengthLevelAsu;
        }
        this.dBm.setText(String.valueOf(state) + " " + resources.getString(2131427374) + "   " + String.valueOf(i) + " " + resources.getString(2131427375));
    }

    public boolean onPrepareOptionsMenu(Menu menu) {
        MenuItem item = menu.findItem(5);
        boolean visible = true;
        switch (this.mTelephonyManager.getDataState()) {
            case 0:
                item.setTitle("Enable data connection");
                break;
            case 2:
            case 3:
                item.setTitle("Disable data connection");
                break;
            default:
                visible = false;
                break;
        }
        item.setVisible(visible);
        return true;
    }

    private final void updateDataStats() {
        this.resets.setText(SystemProperties.get("net.gsm.radio-reset", "0"));
        this.attempts.setText(SystemProperties.get("net.gsm.attempt-gprs", "0"));
        this.successes.setText(SystemProperties.get("net.gsm.succeed-gprs", "0"));
        this.sentSinceReceived.setText(SystemProperties.get("net.ppp.reset-by-timeout", "0"));
    }

    private final void updateNeighboringCids(ArrayList<NeighboringCellInfo> arrayList) {
        StringBuilder stringBuilder = new StringBuilder();
        if (arrayList == null) {
            stringBuilder.append("unknown");
        } else if (arrayList.isEmpty()) {
            stringBuilder.append("no neighboring cells");
        } else {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                stringBuilder.append(((NeighboringCellInfo) it.next()).toString()).append(" ");
            }
        }
        this.mNeighboringCids.setText(stringBuilder.toString());
    }

    private final void updateProperties() {
        Resources resources = getResources();
        CharSequence deviceId = this.phone.getDeviceId();
        if (deviceId == null) {
            deviceId = resources.getString(2131427371);
        }
        this.mDeviceId.setText(deviceId);
        deviceId = this.phone.getLine1Number();
        if (deviceId == null) {
            deviceId = resources.getString(2131427371);
        }
        this.number.setText(deviceId);
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        menu.add(0, 0, 0, 2131427523).setOnMenuItemClickListener(this.mSelectBandCallback).setAlphabeticShortcut('b');
        menu.add(1, 1, 0, 2131427354).setOnMenuItemClickListener(this.mViewADNCallback);
        menu.add(1, 2, 0, 2131427355).setOnMenuItemClickListener(this.mViewFDNCallback);
        menu.add(1, 3, 0, 2131427356).setOnMenuItemClickListener(this.mViewSDNCallback);
        menu.add(1, 4, 0, 2131427357).setOnMenuItemClickListener(this.mGetPdpList);
        menu.add(1, 5, 0, "Disable data connection").setOnMenuItemClickListener(this.mToggleData);
        return true;
    }

    private void updateImsRegRequiredState() {
        log("updateImsRegRequiredState isImsRegRequired()=" + isImsRegRequired());
        this.imsRegRequiredButton.setText(isImsRegRequired() ? getString(2131427351) : getString(2131427350));
    }

    private void updateLteRamDumpState() {
        log("updateLteRamDumpState isLteRamDumpEnabled()=" + isLteRamDumpEnabled());
        this.lteRamDumpButton.setText(isLteRamDumpEnabled() ? getString(2131427353) : getString(2131427352));
    }

    private void updateSmsOverImsState() {
        log("updateSmsOverImsState isSmsOverImsEnabled()=" + isSmsOverImsEnabled());
        this.smsOverImsButton.setText(isSmsOverImsEnabled() ? getString(2131427349) : getString(2131427348));
    }

    public void onPause() {
        super.onPause();
        log("onPause: unregister phone & data intents");
        this.mPhoneStateReceiver.unregisterIntent();
        this.mTelephonyManager.listen(this.mPhoneStateListener, 0);
    }

    private final void updateNetworkType() {
        this.network.setText(SystemProperties.get("gsm.network.type", getResources().getString(2131427371)));
    }

    private void updatePowerState() {
        this.radioPowerButton.setText(isRadioOn() ? getString(2131427347) : getString(2131427346));
    }

    private void updateCellInfoListRate() {
        this.cellInfoListRateButton.setText("CellInfoListRate " + this.mCellInfoListRateHandler.getRate());
        updateCellInfoTv(this.mTelephonyManager.getAllCellInfo());
    }

    private void updateDnsCheckState() {
        this.dnsCheckState.setText(this.phone.isDnsCheckDisabled() ? "0.0.0.0 allowed" : "0.0.0.0 not allowed");
    }

    private final void updatePdpList() {
        this.disconnects.setText(new HttpGet("========DATA=======\n").toString());
    }

    private void log(String str) {
        Log.d("phone", "[RadioInfo] " + str);
    }

    private void refreshSmsc() {
        this.phone.getSmscAddress(this.mHandler.obtainMessage(1005));
    }

    private final void updateCallRedirect() {
        this.mCfi.setText(String.valueOf(this.mCfiValue));
    }

    private final void updateMessageWaiting() {
        this.mMwi.setText(String.valueOf(this.mMwiValue));
    }

    private boolean isImsRegRequired() {
        return SystemProperties.getBoolean("persist.radio.imsregrequired", false);
    }

    private boolean isLteRamDumpEnabled() {
        return SystemProperties.getBoolean("persist.radio.ramdump", false);
    }

    private boolean isRadioOn() {
        return this.phone.getServiceState().getState() != 3;
    }

    private boolean isSmsOverImsEnabled() {
        return SystemProperties.getBoolean("persist.radio.imsallowmtsms", false);
    }
}