package com.jellybyn.settings.bluetooth;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.SystemProperties;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.util.Log;

final class BluetoothDiscoverableEnabler implements OnPreferenceClickListener {
    private final Context mContext;
    private boolean mDiscoverable;
    private final Preference mDiscoveryPreference;
    private final LocalBluetoothAdapter mLocalAdapter;
    private int mNumberOfPairedDevices;
    private final BroadcastReceiver mReceiver = new 1(this);
    private final SharedPreferences mSharedPreferences;
    private int mTimeoutSecs = -1;
    private final Handler mUiHandler;
    private final Runnable mUpdateCountdownSummaryRunnable = new 2(this);

    void setDiscoverableTimeout(int i) {
        String timeoutValue;
        switch (i) {
            case 1:
                this.mTimeoutSecs = 300;
                timeoutValue = "fivemin";
                break;
            case 2:
                this.mTimeoutSecs = 3600;
                timeoutValue = "onehour";
                break;
            case 3:
                this.mTimeoutSecs = 0;
                timeoutValue = "never";
                break;
            default:
                this.mTimeoutSecs = 120;
                timeoutValue = "twomin";
                break;
        }
        this.mSharedPreferences.edit().putString("bt_discoverable_timeout", timeoutValue).apply();
        setEnabled(true);
    }

    private int getDiscoverableTimeout() {
        if (this.mTimeoutSecs != -1) {
            return this.mTimeoutSecs;
        }
        int timeout = SystemProperties.getInt("debug.bt.discoverable_time", -1);
        if (timeout < 0) {
            String timeoutValue = this.mSharedPreferences.getString("bt_discoverable_timeout", "twomin");
            timeout = timeoutValue.equals("never") ? 0 : timeoutValue.equals("onehour") ? 3600 : timeoutValue.equals("fivemin") ? 300 : 120;
        }
        this.mTimeoutSecs = timeout;
        return timeout;
    }

    private void updateCountdownSummary() {
        if (this.mLocalAdapter.getScanMode() == 23) {
            long currentTimestamp = System.currentTimeMillis();
            long endTimestamp = LocalBluetoothPreferences.getDiscoverableEndTimestamp(this.mContext);
            if (currentTimestamp > endTimestamp) {
                updateTimerDisplay(0);
                return;
            }
            updateTimerDisplay((int) ((endTimestamp - currentTimestamp) / 1000));
            synchronized (this) {
                this.mUiHandler.removeCallbacks(this.mUpdateCountdownSummaryRunnable);
                this.mUiHandler.postDelayed(this.mUpdateCountdownSummaryRunnable, 1000);
            }
        }
    }

    private void setEnabled(boolean z) {
        if (z) {
            int discoverableTimeout = getDiscoverableTimeout();
            long currentTimeMillis = System.currentTimeMillis() + (((long) discoverableTimeout) * 1000);
            LocalBluetoothPreferences.persistDiscoverableEndTimestamp(this.mContext, currentTimeMillis);
            this.mLocalAdapter.setScanMode(23, discoverableTimeout);
            updateCountdownSummary();
            Log.d("BluetoothDiscoverableEnabler", "setEnabled(): enabled = " + z + "timeout = " + discoverableTimeout);
            if (discoverableTimeout > 0) {
                BluetoothDiscoverableTimeoutReceiver.setDiscoverableAlarm(this.mContext, currentTimeMillis);
                return;
            }
            return;
        }
        this.mLocalAdapter.setScanMode(21);
        BluetoothDiscoverableTimeoutReceiver.cancelDiscoverableAlarm(this.mContext);
    }

    BluetoothDiscoverableEnabler(Context context, LocalBluetoothAdapter localBluetoothAdapter, Preference preference) {
        this.mContext = context;
        this.mUiHandler = new Handler();
        this.mLocalAdapter = localBluetoothAdapter;
        this.mDiscoveryPreference = preference;
        this.mSharedPreferences = preference.getSharedPreferences();
        preference.setPersistent(false);
    }

    private static String formatTimeRemaining(int i) {
        StringBuilder sb = new StringBuilder(6);
        int min = i / 60;
        sb.append(min).append(':');
        int sec = i - (min * 60);
        if (sec < 10) {
            sb.append('0');
        }
        sb.append(sec);
        return sb.toString();
    }

    int getDiscoverableTimeoutIndex() {
        switch (getDiscoverableTimeout()) {
            case 0:
                return 3;
            case 300:
                return 1;
            case 3600:
                return 2;
            default:
                return 0;
        }
    }

    void handleModeChanged(int i) {
        Log.d("BluetoothDiscoverableEnabler", "handleModeChanged(): mode = " + i);
        if (i == 23) {
            this.mDiscoverable = true;
            updateCountdownSummary();
            return;
        }
        this.mDiscoverable = false;
        setSummaryNotDiscoverable();
    }

    public void resume() {
        if (this.mLocalAdapter != null) {
            this.mContext.registerReceiver(this.mReceiver, new IntentFilter("android.bluetooth.adapter.action.SCAN_MODE_CHANGED"));
            this.mDiscoveryPreference.setOnPreferenceClickListener(this);
            handleModeChanged(this.mLocalAdapter.getScanMode());
        }
    }

    private void updateTimerDisplay(int i) {
        if (getDiscoverableTimeout() == 0) {
            this.mDiscoveryPreference.setSummary(2131427423);
            return;
        }
        String textTimeout = formatTimeRemaining(i);
        this.mDiscoveryPreference.setSummary(this.mContext.getString(2131427422, new Object[]{textTimeout}));
    }

    public void pause() {
        if (this.mLocalAdapter != null) {
            this.mUiHandler.removeCallbacks(this.mUpdateCountdownSummaryRunnable);
            this.mContext.unregisterReceiver(this.mReceiver);
            this.mDiscoveryPreference.setOnPreferenceClickListener(null);
        }
    }

    private void setSummaryNotDiscoverable() {
        if (this.mNumberOfPairedDevices != 0) {
            this.mDiscoveryPreference.setSummary(2131427425);
        } else {
            this.mDiscoveryPreference.setSummary(2131427424);
        }
    }

    public boolean onPreferenceClick(Preference preference) {
        this.mDiscoverable = !this.mDiscoverable;
        setEnabled(this.mDiscoverable);
        return true;
    }

    void setNumberOfPairedDevices(int i) {
        this.mNumberOfPairedDevices = i;
        handleModeChanged(this.mLocalAdapter.getScanMode());
    }
}