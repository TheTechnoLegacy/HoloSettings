package com.jellybyn.settings;

import android.content.Context;
import android.content.Intent;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.provider.Settings.Global;
import com.android.internal.telephony.PhoneStateIntentReceiver;

public class AirplaneModeEnabler implements OnPreferenceChangeListener {
    private ContentObserver mAirplaneModeObserver = new 2(this, new Handler());
    private final CheckBoxPreference mCheckBoxPref;
    private final Context mContext;
    private Handler mHandler = new 1(this);
    private PhoneStateIntentReceiver mPhoneStateReceiver;

    public AirplaneModeEnabler(Context context, CheckBoxPreference checkBoxPreference) {
        this.mContext = context;
        this.mCheckBoxPref = checkBoxPreference;
        checkBoxPreference.setPersistent(false);
        this.mPhoneStateReceiver = new PhoneStateIntentReceiver(this.mContext, this.mHandler);
        this.mPhoneStateReceiver.notifyServiceState(3);
    }

    private void setAirplaneModeOn(boolean z) {
        Global.putInt(this.mContext.getContentResolver(), "airplane_mode_on", z ? 1 : 0);
        this.mCheckBoxPref.setChecked(z);
        Intent intent = new Intent("android.intent.action.AIRPLANE_MODE");
        intent.putExtra("state", z);
        this.mContext.sendBroadcastAsUser(intent, UserHandle.ALL);
    }

    public void resume() {
        this.mCheckBoxPref.setChecked(isAirplaneModeOn(this.mContext));
        this.mPhoneStateReceiver.registerIntent();
        this.mCheckBoxPref.setOnPreferenceChangeListener(this);
        this.mContext.getContentResolver().registerContentObserver(Global.getUriFor("airplane_mode_on"), true, this.mAirplaneModeObserver);
    }

    public void pause() {
        this.mPhoneStateReceiver.unregisterIntent();
        this.mCheckBoxPref.setOnPreferenceChangeListener(null);
        this.mContext.getContentResolver().unregisterContentObserver(this.mAirplaneModeObserver);
    }

    public void setAirplaneModeInECM(boolean z, boolean z2) {
        if (z) {
            setAirplaneModeOn(z2);
        } else {
            onAirplaneModeChanged();
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (!Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode"))) {
            setAirplaneModeOn(((Boolean) obj).booleanValue());
        }
        return true;
    }

    private void onAirplaneModeChanged() {
        this.mCheckBoxPref.setChecked(isAirplaneModeOn(this.mContext));
    }

    public static boolean isAirplaneModeOn(Context context) {
        return Global.getInt(context.getContentResolver(), "airplane_mode_on", 0) != 0;
    }
}