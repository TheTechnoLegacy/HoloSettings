package com.jellybyn.settings;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.IPowerManager;
import android.os.ServiceManager;
import android.os.SystemClock;
import android.text.format.DateUtils;
import android.widget.TextView;
import com.android.internal.app.IBatteryStats;
import com.android.internal.app.IBatteryStats.Stub;

public class BatteryInfo extends Activity {
    private IBatteryStats mBatteryStats;
    private Handler mHandler = new 1(this);
    private TextView mHealth;
    private IntentFilter mIntentFilter;
    private BroadcastReceiver mIntentReceiver = new 2(this);
    private TextView mLevel;
    private TextView mPower;
    private TextView mScale;
    private IPowerManager mScreenStats;
    private TextView mStatus;
    private TextView mTechnology;
    private TextView mTemperature;
    private TextView mUptime;
    private TextView mVoltage;

    public void onResume() {
        super.onResume();
        this.mStatus = (TextView) findViewById(2131230740);
        this.mPower = (TextView) findViewById(2131230741);
        this.mLevel = (TextView) findViewById(2131230742);
        this.mScale = (TextView) findViewById(2131230743);
        this.mHealth = (TextView) findViewById(2131230744);
        this.mTechnology = (TextView) findViewById(2131230747);
        this.mVoltage = (TextView) findViewById(2131230745);
        this.mTemperature = (TextView) findViewById(2131230746);
        this.mUptime = (TextView) findViewById(2131230748);
        this.mBatteryStats = Stub.asInterface(ServiceManager.getService("batteryinfo"));
        this.mScreenStats = Stub.asInterface(ServiceManager.getService("power"));
        this.mHandler.sendEmptyMessageDelayed(1, 1000);
        registerReceiver(this.mIntentReceiver, this.mIntentFilter);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(2130968590);
        this.mIntentFilter = new IntentFilter();
        this.mIntentFilter.addAction("android.intent.action.BATTERY_CHANGED");
    }

    public void onPause() {
        super.onPause();
        this.mHandler.removeMessages(1);
        unregisterReceiver(this.mIntentReceiver);
    }

    private void updateBatteryStats() {
        this.mUptime.setText(DateUtils.formatElapsedTime(SystemClock.elapsedRealtime() / 1000));
    }

    private final String tenthsToFixedString(int i) {
        int tens = i / 10;
        return Integer.toString(tens) + "." + Math.abs(i - (tens * 10));
    }
}