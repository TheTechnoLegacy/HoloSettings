package com.jellybyn.settings.nfc;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.NfcAdapter;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceScreen;

public class NfcEnabler implements OnPreferenceChangeListener {
    private final PreferenceScreen mAndroidBeam;
    private final CheckBoxPreference mCheckbox;
    private final Context mContext;
    private final IntentFilter mIntentFilter;
    private final NfcAdapter mNfcAdapter;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if ("android.nfc.action.ADAPTER_STATE_CHANGED".equals(intent.getAction())) {
                NfcEnabler.this.handleNfcStateChanged(intent.getIntExtra("android.nfc.extra.ADAPTER_STATE", 1));
            }
        }
    };

    private void handleNfcStateChanged(int i) {
        switch (i) {
            case 1:
                this.mCheckbox.setChecked(false);
                this.mCheckbox.setEnabled(true);
                this.mAndroidBeam.setEnabled(false);
                this.mAndroidBeam.setSummary(2131427793);
                return;
            case 2:
                this.mCheckbox.setChecked(true);
                this.mCheckbox.setEnabled(false);
                this.mAndroidBeam.setEnabled(false);
                return;
            case 3:
                this.mCheckbox.setChecked(true);
                this.mCheckbox.setEnabled(true);
                this.mAndroidBeam.setEnabled(true);
                if (this.mNfcAdapter.isNdefPushEnabled()) {
                    this.mAndroidBeam.setSummary(2131427791);
                    return;
                } else {
                    this.mAndroidBeam.setSummary(2131427792);
                    return;
                }
            case 4:
                this.mCheckbox.setChecked(false);
                this.mCheckbox.setEnabled(false);
                this.mAndroidBeam.setEnabled(false);
                return;
            default:
                return;
        }
    }

    public NfcEnabler(Context context, CheckBoxPreference checkBoxPreference, PreferenceScreen preferenceScreen) {
        this.mContext = context;
        this.mCheckbox = checkBoxPreference;
        this.mAndroidBeam = preferenceScreen;
        this.mNfcAdapter = NfcAdapter.getDefaultAdapter(context);
        if (this.mNfcAdapter == null) {
            this.mCheckbox.setEnabled(false);
            this.mAndroidBeam.setEnabled(false);
            this.mIntentFilter = null;
            return;
        }
        this.mIntentFilter = new IntentFilter("android.nfc.action.ADAPTER_STATE_CHANGED");
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        boolean desiredState = ((Boolean) obj).booleanValue();
        this.mCheckbox.setEnabled(false);
        if (desiredState) {
            this.mNfcAdapter.enable();
        } else {
            this.mNfcAdapter.disable();
        }
        return false;
    }

    public void resume() {
        if (this.mNfcAdapter != null) {
            handleNfcStateChanged(this.mNfcAdapter.getAdapterState());
            this.mContext.registerReceiver(this.mReceiver, this.mIntentFilter);
            this.mCheckbox.setOnPreferenceChangeListener(this);
        }
    }

    public void pause() {
        if (this.mNfcAdapter != null) {
            this.mContext.unregisterReceiver(this.mReceiver);
            this.mCheckbox.setOnPreferenceChangeListener(null);
        }
    }
}