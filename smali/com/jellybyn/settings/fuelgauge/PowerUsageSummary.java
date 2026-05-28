package com.jellybyn.settings.fuelgauge;

import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.content.pm.UserInfo;
import android.graphics.drawable.Drawable;
import android.hardware.SensorManager;
import android.os.BatteryStats.Timer;
import android.os.BatteryStats.Uid;
import android.os.BatteryStats.Uid.Proc;
import android.os.BatteryStats.Uid.Sensor;
import android.os.BatteryStats.Uid.Wakelock;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemClock;
import android.os.UserHandle;
import android.os.UserManager;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceFragment;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import com.android.internal.app.IBatteryStats;
import com.android.internal.app.IBatteryStats.Stub;
import com.android.internal.os.BatteryStatsImpl;
import com.android.internal.os.PowerProfile;
import com.jellybyn.settings.HelpUtils;
import com.jellybyn.settings.Utils;
import com.jellybyn.settings.fuelgauge.PowerUsageDetail.DrainType;
import com.jellybyn.settings.users.UserUtils;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class PowerUsageSummary extends PreferenceFragment implements Runnable {
    private static BatteryStatsImpl sStatsXfer;
    private boolean mAbort;
    private PreferenceGroup mAppListGroup;
    private long mAppWifiRunning;
    IBatteryStats mBatteryInfo;
    private BroadcastReceiver mBatteryInfoReceiver = new 1(this);
    private Preference mBatteryStatusPref;
    private double mBluetoothPower;
    private final List<BatterySipper> mBluetoothSippers = new ArrayList();
    Handler mHandler = new 2(this);
    private double mMaxPower = 1.0d;
    private PowerProfile mPowerProfile;
    private ArrayList<BatterySipper> mRequestQueue = new ArrayList();
    private Thread mRequestThread;
    BatteryStatsImpl mStats;
    private long mStatsPeriod = 0;
    private int mStatsType = 0;
    private double mTotalPower;
    UserManager mUm;
    private final List<BatterySipper> mUsageList = new ArrayList();
    private final SparseArray<Double> mUserPower = new SparseArray();
    private final SparseArray<List<BatterySipper>> mUserSippers = new SparseArray();
    private double mWifiPower;
    private final List<BatterySipper> mWifiSippers = new ArrayList();

    private void processAppUsage() {
        double d;
        SensorManager sensorManager = (SensorManager) getActivity().getSystemService("sensor");
        int which = this.mStatsType;
        int speedSteps = this.mPowerProfile.getNumSpeedSteps();
        double[] powerCpuNormal = new double[speedSteps];
        long[] cpuSpeedStepTimes = new long[speedSteps];
        for (int i = 0; i < speedSteps; i++) {
            powerCpuNormal[i] = this.mPowerProfile.getAveragePower("cpu.active", i);
        }
        double averageCostPerByte = getAverageDataCost();
        long uSecTime = this.mStats.computeBatteryRealtime(SystemClock.elapsedRealtime() * 1000, which);
        long appWakelockTime = 0;
        BatterySipper osApp = null;
        this.mStatsPeriod = uSecTime;
        SparseArray<? extends Uid> uidStats = this.mStats.getUidStats();
        int NU = uidStats.size();
        for (int iu = 0; iu < NU; iu++) {
            Uid uid = (Uid) uidStats.valueAt(iu);
            d = 0.0d;
            double d2 = 0.0d;
            String str = null;
            Map processStats = uid.getProcessStats();
            long j = 0;
            long j2 = 0;
            long j3 = 0;
            long j4 = 0;
            if (processStats.size() > 0) {
                for (Entry entry : processStats.entrySet()) {
                    int i2;
                    Proc proc = (Proc) entry.getValue();
                    j2 += 10 * proc.getForegroundTime(which);
                    long userTime = (proc.getUserTime(which) + proc.getSystemTime(which)) * 10;
                    int i3 = 0;
                    for (i2 = 0; i2 < speedSteps; i2++) {
                        cpuSpeedStepTimes[i2] = proc.getTimeAtCpuSpeedStep(i2, which);
                        i3 = (int) (((long) i3) + cpuSpeedStepTimes[i2]);
                    }
                    if (i3 == 0) {
                        i3 = 1;
                    }
                    double d3 = 0.0d;
                    for (i2 = 0; i2 < speedSteps; i2++) {
                        d3 += (((double) userTime) * (((double) cpuSpeedStepTimes[i2]) / ((double) i3))) * powerCpuNormal[i2];
                    }
                    j += userTime;
                    d += d3;
                    if (str == null || str.startsWith("*")) {
                        d2 = d3;
                        str = (String) entry.getKey();
                    } else if (d2 < d3 && !((String) entry.getKey()).startsWith("*")) {
                        d2 = d3;
                        str = (String) entry.getKey();
                    }
                }
            }
            if (j2 > j) {
                j = j2;
            }
            d /= 1000.0d;
            for (Entry value : uid.getWakelockStats().entrySet()) {
                Timer wakeTime = ((Wakelock) value.getValue()).getWakeTime(0);
                if (wakeTime != null) {
                    j3 += wakeTime.getTotalTimeLocked(uSecTime, which);
                }
            }
            j3 /= 1000;
            appWakelockTime += j3;
            d += (((double) j3) * this.mPowerProfile.getAveragePower("cpu.awake")) / 1000.0d;
            long tcpBytesReceived = uid.getTcpBytesReceived(this.mStatsType);
            long tcpBytesSent = uid.getTcpBytesSent(this.mStatsType);
            d += ((double) (tcpBytesReceived + tcpBytesSent)) * averageCostPerByte;
            long wifiRunningTime = uid.getWifiRunningTime(uSecTime, which) / 1000;
            this.mAppWifiRunning += wifiRunningTime;
            d = (d + ((((double) wifiRunningTime) * this.mPowerProfile.getAveragePower("wifi.on")) / 1000.0d)) + ((((double) (uid.getWifiScanTime(uSecTime, which) / 1000)) * this.mPowerProfile.getAveragePower("wifi.scan")) / 1000.0d);
            for (Entry value2 : uid.getSensorStats().entrySet()) {
                Sensor sensor = (Sensor) value2.getValue();
                int handle = sensor.getHandle();
                long totalTimeLocked = sensor.getSensorTime().getTotalTimeLocked(uSecTime, which) / 1000;
                double d4 = 0.0d;
                switch (handle) {
                    case -10000:
                        d4 = this.mPowerProfile.getAveragePower("gps.on");
                        j4 = totalTimeLocked;
                        break;
                    default:
                        for (android.hardware.Sensor sensor2 : sensorManager.getSensorList(-1)) {
                            if (sensor2.getHandle() == handle) {
                                d4 = (double) sensor2.getPower();
                                break;
                            }
                        }
                        break;
                }
                d += (((double) totalTimeLocked) * d4) / 1000.0d;
            }
            Object obj = null;
            int userId = UserHandle.getUserId(uid.getUid());
            if (d != 0.0d || uid.getUid() == 0) {
                BatterySipper batterySipper = new BatterySipper(getActivity(), this.mRequestQueue, this.mHandler, str, DrainType.APP, 0, uid, new double[]{d});
                batterySipper.cpuTime = j;
                batterySipper.gpsTime = j4;
                batterySipper.wifiRunningTime = wifiRunningTime;
                batterySipper.cpuFgTime = j2;
                batterySipper.wakeLockTime = j3;
                batterySipper.tcpBytesReceived = tcpBytesReceived;
                batterySipper.tcpBytesSent = tcpBytesSent;
                if (uid.getUid() == 1010) {
                    this.mWifiSippers.add(batterySipper);
                } else if (uid.getUid() == 1002) {
                    this.mBluetoothSippers.add(batterySipper);
                } else if (userId == UserHandle.myUserId() || UserHandle.getAppId(uid.getUid()) < 10000) {
                    this.mUsageList.add(batterySipper);
                } else {
                    obj = 1;
                    List list = (List) this.mUserSippers.get(userId);
                    if (list == null) {
                        list = new ArrayList();
                        this.mUserSippers.put(userId, list);
                    }
                    list.add(batterySipper);
                }
                if (uid.getUid() == 0) {
                    osApp = batterySipper;
                }
            }
            if (d != 0.0d) {
                if (uid.getUid() == 1010) {
                    this.mWifiPower += d;
                } else if (uid.getUid() == 1002) {
                    this.mBluetoothPower += d;
                } else if (obj != null) {
                    Double d5 = (Double) this.mUserPower.get(userId);
                    this.mUserPower.put(userId, d5 == null ? Double.valueOf(d) : Double.valueOf(d5.doubleValue() + d));
                } else {
                    if (d > this.mMaxPower) {
                        this.mMaxPower = d;
                    }
                    this.mTotalPower += d;
                }
            }
        }
        if (osApp != null) {
            long computeBatteryUptime = (this.mStats.computeBatteryUptime(SystemClock.uptimeMillis() * 1000, which) / 1000) - ((this.mStats.getScreenOnTime(SystemClock.elapsedRealtime(), which) / 1000) + appWakelockTime);
            if (computeBatteryUptime > 0) {
                d = (((double) computeBatteryUptime) * this.mPowerProfile.getAveragePower("cpu.awake")) / 1000.0d;
                osApp.wakeLockTime += computeBatteryUptime;
                osApp.value += d;
                double[] dArr = osApp.values;
                dArr[0] = dArr[0] + d;
                if (osApp.value > this.mMaxPower) {
                    this.mMaxPower = osApp.value;
                }
                this.mTotalPower += d;
            }
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        Bundle bundle;
        if (preference instanceof BatteryHistoryPreference) {
            Parcel obtain = Parcel.obtain();
            this.mStats.writeToParcelWithoutUids(obtain, 0);
            byte[] marshall = obtain.marshall();
            bundle = new Bundle();
            bundle.putByteArray("stats", marshall);
            ((PreferenceActivity) getActivity()).startPreferencePanel(BatteryHistoryDetail.class.getName(), bundle, 2131428640, null, null, 0);
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        } else if (!(preference instanceof PowerGaugePreference)) {
            return false;
        } else {
            int[] iArr;
            double[] dArr;
            BatterySipper info = ((PowerGaugePreference) preference).getInfo();
            bundle = new Bundle();
            bundle.putString("title", info.name);
            bundle.putInt("percent", (int) Math.ceil((info.getSortValue() * 100.0d) / this.mTotalPower));
            bundle.putInt("gauge", (int) Math.ceil((info.getSortValue() * 100.0d) / this.mMaxPower));
            bundle.putLong("duration", this.mStatsPeriod);
            bundle.putString("iconPackage", info.defaultPackageName);
            bundle.putInt("iconId", info.iconId);
            bundle.putDouble("noCoverage", info.noCoveragePercent);
            if (info.uidObj != null) {
                bundle.putInt("uid", info.uidObj.getUid());
            }
            bundle.putSerializable("drainType", info.drainType);
            switch (3.$SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[info.drainType.ordinal()]) {
                case 1:
                case 2:
                    Uid uid = info.uidObj;
                    iArr = new int[]{2131428651, 2131428652, 2131428653, 2131428654, 2131428655, 2131428657, 2131428658, 2131428659, 2131428660};
                    dArr = new double[]{(double) info.cpuTime, (double) info.cpuFgTime, (double) info.wakeLockTime, (double) info.gpsTime, (double) info.wifiRunningTime, (double) info.tcpBytesSent, (double) info.tcpBytesReceived, 0.0d, 0.0d};
                    if (info.drainType == DrainType.APP) {
                        StringWriter stringWriter = new StringWriter();
                        this.mStats.dumpLocked(new PrintWriter(stringWriter), "", this.mStatsType, uid.getUid());
                        bundle.putString("report_details", stringWriter.toString());
                        stringWriter = new StringWriter();
                        this.mStats.dumpCheckinLocked(new PrintWriter(stringWriter), this.mStatsType, uid.getUid());
                        bundle.putString("report_checkin_details", stringWriter.toString());
                        break;
                    }
                    break;
                case 3:
                    iArr = new int[]{2131428661, 2131428662};
                    dArr = new double[]{(double) info.usageTime, info.noCoveragePercent};
                    break;
                case 4:
                    iArr = new int[]{2131428655, 2131428651, 2131428652, 2131428653, 2131428657, 2131428658};
                    dArr = new double[]{(double) info.usageTime, (double) info.cpuTime, (double) info.cpuFgTime, (double) info.wakeLockTime, (double) info.tcpBytesSent, (double) info.tcpBytesReceived};
                    break;
                case 5:
                    iArr = new int[]{2131428661, 2131428651, 2131428652, 2131428653, 2131428657, 2131428658};
                    dArr = new double[]{(double) info.usageTime, (double) info.cpuTime, (double) info.cpuFgTime, (double) info.wakeLockTime, (double) info.tcpBytesSent, (double) info.tcpBytesReceived};
                    break;
                default:
                    iArr = new int[]{2131428661};
                    dArr = new double[]{(double) info.usageTime};
                    break;
            }
            bundle.putIntArray("types", iArr);
            bundle.putDoubleArray("values", dArr);
            ((PreferenceActivity) getActivity()).startPreferencePanel(PowerUsageDetail.class.getName(), bundle, 2131428641, null, null, 0);
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        }
    }

    private void refreshStats() {
        if (this.mStats == null) {
            load();
        }
        this.mMaxPower = 0.0d;
        this.mTotalPower = 0.0d;
        this.mWifiPower = 0.0d;
        this.mBluetoothPower = 0.0d;
        this.mAppWifiRunning = 0;
        this.mAppListGroup.removeAll();
        this.mUsageList.clear();
        this.mWifiSippers.clear();
        this.mBluetoothSippers.clear();
        this.mUserSippers.clear();
        this.mUserPower.clear();
        this.mAppListGroup.setOrderingAsAdded(false);
        this.mBatteryStatusPref.setOrder(-2);
        this.mAppListGroup.addPreference(this.mBatteryStatusPref);
        BatteryHistoryPreference hist = new BatteryHistoryPreference(getActivity(), this.mStats);
        hist.setOrder(-1);
        this.mAppListGroup.addPreference(hist);
        if (this.mPowerProfile.getAveragePower("screen.full") < 10.0d) {
            addNotAvailableMessage();
            return;
        }
        processAppUsage();
        processMiscUsage();
        Collections.sort(this.mUsageList);
        for (BatterySipper batterySipper : this.mUsageList) {
            if (batterySipper.getSortValue() >= 5.0d) {
                double sortValue = (batterySipper.getSortValue() / this.mTotalPower) * 100.0d;
                if (sortValue >= 1.0d) {
                    PowerGaugePreference powerGaugePreference = new PowerGaugePreference(getActivity(), batterySipper.getIcon(), batterySipper);
                    double sortValue2 = (batterySipper.getSortValue() * 100.0d) / this.mMaxPower;
                    batterySipper.percent = sortValue;
                    powerGaugePreference.setTitle(batterySipper.name);
                    powerGaugePreference.setOrder(Integer.MAX_VALUE - ((int) batterySipper.getSortValue()));
                    powerGaugePreference.setPercent(sortValue2, sortValue);
                    if (batterySipper.uidObj != null) {
                        powerGaugePreference.setKey(Integer.toString(batterySipper.uidObj.getUid()));
                    }
                    this.mAppListGroup.addPreference(powerGaugePreference);
                    if (this.mAppListGroup.getPreferenceCount() > 11) {
                        break;
                    }
                } else {
                    continue;
                }
            }
        }
        synchronized (this.mRequestQueue) {
            if (!this.mRequestQueue.isEmpty()) {
                if (this.mRequestThread == null) {
                    this.mRequestThread = new Thread(this, "BatteryUsage Icon Loader");
                    this.mRequestThread.setPriority(1);
                    this.mRequestThread.start();
                }
                this.mRequestQueue.notify();
            }
        }
    }

    private void addUserUsage() {
        for (int i = 0; i < this.mUserSippers.size(); i++) {
            String string;
            Drawable drawable;
            int keyAt = this.mUserSippers.keyAt(i);
            List list = (List) this.mUserSippers.valueAt(i);
            UserInfo userInfo = this.mUm.getUserInfo(keyAt);
            if (userInfo != null) {
                Drawable userIcon = UserUtils.getUserIcon(this.mUm, userInfo, getResources());
                String str = userInfo != null ? userInfo.name : null;
                if (str == null) {
                    str = Integer.toString(userInfo.id);
                }
                string = getActivity().getResources().getString(2131428447, new Object[]{str});
                drawable = userIcon;
            } else {
                string = getActivity().getResources().getString(2131428448);
                drawable = null;
            }
            BatterySipper addEntry = addEntry(string, DrainType.USER, 0, 0, ((Double) this.mUserPower.get(keyAt)).doubleValue());
            addEntry.icon = drawable;
            aggregateSippers(addEntry, list, "User");
        }
    }

    private double getAverageDataCost() {
        long mobileTcpBytesSent = this.mStats.getMobileTcpBytesSent(this.mStatsType) + this.mStats.getMobileTcpBytesReceived(this.mStatsType);
        long totalTcpBytesReceived = (this.mStats.getTotalTcpBytesReceived(this.mStatsType) + this.mStats.getTotalTcpBytesSent(this.mStatsType)) - mobileTcpBytesSent;
        long radioDataUptime = this.mStats.getRadioDataUptime() / 1000;
        return totalTcpBytesReceived + mobileTcpBytesSent != 0 ? ((((this.mPowerProfile.getAveragePower("radio.active") / 3600.0d) / ((double) ((radioDataUptime != 0 ? ((8 * mobileTcpBytesSent) * 1000) / radioDataUptime : 200000) / 8))) * ((double) mobileTcpBytesSent)) + (((this.mPowerProfile.getAveragePower("wifi.active") / 3600.0d) / 125000.0d) * ((double) totalTcpBytesReceived))) / ((double) (mobileTcpBytesSent + totalTcpBytesReceived)) : 0.0d;
    }

    private void addRadioUsage(long j) {
        double d = 0.0d;
        long j2 = 0;
        for (int i = 0; i < 5; i++) {
            long phoneSignalStrengthTime = this.mStats.getPhoneSignalStrengthTime(i, j, this.mStatsType) / 1000;
            d += ((double) (phoneSignalStrengthTime / 1000)) * this.mPowerProfile.getAveragePower("radio.on", i);
            j2 += phoneSignalStrengthTime;
        }
        BatterySipper addEntry = addEntry(getActivity().getString(2131428648), DrainType.CELL, j2, 2130837603, d + (((double) ((this.mStats.getPhoneSignalScanningTime(j, this.mStatsType) / 1000) / 1000)) * this.mPowerProfile.getAveragePower("radio.scanning")));
        if (j2 != 0) {
            addEntry.noCoveragePercent = (((double) (this.mStats.getPhoneSignalStrengthTime(0, j, this.mStatsType) / 1000)) * 100.0d) / ((double) j2);
        }
    }

    private void processMiscUsage() {
        long uSecTime = SystemClock.elapsedRealtime() * 1000;
        long uSecNow = this.mStats.computeBatteryRealtime(uSecTime, this.mStatsType);
        long timeSinceUnplugged = uSecNow;
        addUserUsage();
        addPhoneUsage(uSecNow);
        addScreenUsage(uSecNow);
        addWiFiUsage(uSecNow);
        addBluetoothUsage(uSecNow);
        addIdleUsage(uSecNow);
        if (!Utils.isWifiOnly(getActivity())) {
            addRadioUsage(uSecNow);
        }
    }

    private void addScreenUsage(long j) {
        long screenOnTime = this.mStats.getScreenOnTime(j, this.mStatsType) / 1000;
        double averagePower = 0.0d + (((double) screenOnTime) * this.mPowerProfile.getAveragePower("screen.on"));
        double averagePower2 = this.mPowerProfile.getAveragePower("screen.full");
        for (int i = 0; i < 5; i++) {
            averagePower += ((((double) (((float) i) + 0.5f)) * averagePower2) / 5.0d) * ((double) (this.mStats.getScreenBrightnessTime(i, j, this.mStatsType) / 1000));
        }
        addEntry(getActivity().getString(2131428645), DrainType.SCREEN, screenOnTime, 2130837607, averagePower / 1000.0d);
    }

    private void aggregateSippers(BatterySipper batterySipper, List<BatterySipper> from, String str) {
        for (int i = 0; i < from.size(); i++) {
            BatterySipper batterySipper2 = (BatterySipper) from.get(i);
            batterySipper.cpuTime += batterySipper2.cpuTime;
            batterySipper.gpsTime += batterySipper2.gpsTime;
            batterySipper.wifiRunningTime += batterySipper2.wifiRunningTime;
            batterySipper.cpuFgTime += batterySipper2.cpuFgTime;
            batterySipper.wakeLockTime += batterySipper2.wakeLockTime;
            batterySipper.tcpBytesReceived += batterySipper2.tcpBytesReceived;
            batterySipper.tcpBytesSent += batterySipper2.tcpBytesSent;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.mStats = sStatsXfer;
        }
        addPreferencesFromResource(2131034134);
        this.mBatteryInfo = Stub.asInterface(ServiceManager.getService("batteryinfo"));
        this.mUm = (UserManager) getActivity().getSystemService("user");
        this.mAppListGroup = (PreferenceGroup) findPreference("app_list");
        this.mBatteryStatusPref = this.mAppListGroup.findPreference("battery_status");
        this.mPowerProfile = new PowerProfile(getActivity());
        setHasOptionsMenu(true);
    }

    private void load() {
        try {
            byte[] statistics = this.mBatteryInfo.getStatistics();
            Parcel obtain = Parcel.obtain();
            obtain.unmarshall(statistics, 0, statistics.length);
            obtain.setDataPosition(0);
            this.mStats = (BatteryStatsImpl) BatteryStatsImpl.CREATOR.createFromParcel(obtain);
            this.mStats.distributeWorkLocked(0);
        } catch (RemoteException e) {
            Log.e("PowerUsageSummary", "RemoteException:", e);
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 1:
                if (this.mStatsType == 0) {
                    this.mStatsType = 3;
                } else {
                    this.mStatsType = 0;
                }
                refreshStats();
                return true;
            case 2:
                this.mStats = null;
                refreshStats();
                return true;
            default:
                return false;
        }
    }

    private void addWiFiUsage(long j) {
        long wifiOnTime = this.mStats.getWifiOnTime(j, this.mStatsType) / 1000;
        long globalWifiRunningTime = (this.mStats.getGlobalWifiRunningTime(j, this.mStatsType) / 1000) - this.mAppWifiRunning;
        if (globalWifiRunningTime < 0) {
            globalWifiRunningTime = 0;
        }
        aggregateSippers(addEntry(getActivity().getString(2131428646), DrainType.WIFI, globalWifiRunningTime, 2130837619, (((((double) (0 * wifiOnTime)) * this.mPowerProfile.getAveragePower("wifi.on")) + (((double) globalWifiRunningTime) * this.mPowerProfile.getAveragePower("wifi.on"))) / 1000.0d) + this.mWifiPower), this.mWifiSippers, "WIFI");
    }

    public void onPause() {
        synchronized (this.mRequestQueue) {
            this.mAbort = true;
        }
        this.mHandler.removeMessages(1);
        getActivity().unregisterReceiver(this.mBatteryInfoReceiver);
        super.onPause();
    }

    public void run() {
        while (true) {
            BatterySipper batterySipper;
            synchronized (this.mRequestQueue) {
                if (this.mRequestQueue.isEmpty() || this.mAbort) {
                    this.mRequestThread = null;
                } else {
                    batterySipper = (BatterySipper) this.mRequestQueue.remove(0);
                }
            }
            batterySipper.getNameIcon();
        }
        this.mRequestThread = null;
    }

    private void addBluetoothUsage(long j) {
        long bluetoothOnTime = this.mStats.getBluetoothOnTime(j, this.mStatsType) / 1000;
        aggregateSippers(addEntry(getActivity().getString(2131428647), DrainType.BLUETOOTH, bluetoothOnTime, 2130837601, (((((double) bluetoothOnTime) * this.mPowerProfile.getAveragePower("bluetooth.on")) / 1000.0d) + ((((double) this.mStats.getBluetoothPingCount()) * this.mPowerProfile.getAveragePower("bluetooth.at")) / 1000.0d)) + this.mBluetoothPower), this.mBluetoothSippers, "Bluetooth");
    }

    private BatterySipper addEntry(String str, DrainType drainType, long j, int i, double d) {
        if (d > this.mMaxPower) {
            this.mMaxPower = d;
        }
        this.mTotalPower += d;
        BatterySipper bs = new BatterySipper(getActivity(), this.mRequestQueue, this.mHandler, str, drainType, i, null, new double[]{d});
        bs.usageTime = j;
        bs.iconId = i;
        this.mUsageList.add(bs);
        return bs;
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menu.add(0, 2, 0, 2131428688).setIcon(2130837588).setAlphabeticShortcut('r').setShowAsAction(5);
        String helpUrl = getResources().getString(2131429120);
        if (!TextUtils.isEmpty(helpUrl)) {
            HelpUtils.prepareHelpMenuItem(getActivity(), menu.add(0, 3, 0, 2131429113), helpUrl);
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (getActivity().isChangingConfigurations()) {
            sStatsXfer = this.mStats;
        } else {
            BatterySipper.sUidCache.clear();
        }
    }

    public void onResume() {
        super.onResume();
        this.mAbort = false;
        getActivity().registerReceiver(this.mBatteryInfoReceiver, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        refreshStats();
    }

    private void addIdleUsage(long j) {
        long screenOnTime = (j - this.mStats.getScreenOnTime(j, this.mStatsType)) / 1000;
        addEntry(getActivity().getString(2131428650), DrainType.IDLE, screenOnTime, 2130837613, (((double) screenOnTime) * this.mPowerProfile.getAveragePower("cpu.idle")) / 1000.0d);
    }

    private void addNotAvailableMessage() {
        Preference notAvailable = new Preference(getActivity());
        notAvailable.setTitle(2131428623);
        this.mAppListGroup.addPreference(notAvailable);
    }

    private void addPhoneUsage(long j) {
        long phoneOnTime = this.mStats.getPhoneOnTime(j, this.mStatsType) / 1000;
        addEntry(getActivity().getString(2131428649), DrainType.PHONE, phoneOnTime, 2130837618, (this.mPowerProfile.getAveragePower("radio.active") * ((double) phoneOnTime)) / 1000.0d);
    }
}