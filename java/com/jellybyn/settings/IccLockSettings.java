package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.widget.Toast;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneFactory;
import com.jellybyn.settings.EditPinPreference.OnPinEnteredListener;

public class IccLockSettings extends PreferenceActivity implements OnPinEnteredListener {
    private int mDialogState = 0;
    private String mError;
    private Handler mHandler = new 1(this);
    private String mNewPin;
    private String mOldPin;
    private Phone mPhone;
    private String mPin;
    private EditPinPreference mPinDialog;
    private CheckBoxPreference mPinToggle;
    private Resources mRes;
    private final BroadcastReceiver mSimStateReceiver = new 2(this);
    private boolean mToState;

    public void onPinEntered(EditPinPreference editPinPreference, boolean z) {
        if (z) {
            this.mPin = editPinPreference.getText();
            if (reasonablePin(this.mPin)) {
                switch (this.mDialogState) {
                    case 1:
                        tryChangeIccLockState();
                        return;
                    case 2:
                        this.mOldPin = this.mPin;
                        this.mDialogState = 3;
                        this.mError = null;
                        this.mPin = null;
                        showPinDialog();
                        return;
                    case 3:
                        this.mNewPin = this.mPin;
                        this.mDialogState = 4;
                        this.mPin = null;
                        showPinDialog();
                        return;
                    case 4:
                        if (this.mPin.equals(this.mNewPin)) {
                            this.mError = null;
                            tryChangePin();
                            return;
                        }
                        this.mError = this.mRes.getString(2131428070);
                        this.mDialogState = 3;
                        this.mPin = null;
                        showPinDialog();
                        return;
                    default:
                        return;
                }
            }
            this.mError = this.mRes.getString(2131428069);
            showPinDialog();
            return;
        }
        resetDialogState();
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (Utils.isMonkeyRunning()) {
            finish();
            return;
        }
        addPreferencesFromResource(2131034149);
        this.mPinDialog = (EditPinPreference) findPreference("sim_pin");
        this.mPinToggle = (CheckBoxPreference) findPreference("sim_toggle");
        if (bundle != null && bundle.containsKey("dialogState")) {
            this.mDialogState = bundle.getInt("dialogState");
            this.mPin = bundle.getString("dialogPin");
            this.mError = bundle.getString("dialogError");
            this.mToState = bundle.getBoolean("enableState");
            switch (this.mDialogState) {
                case 3:
                    this.mOldPin = bundle.getString("oldPinCode");
                    break;
                case 4:
                    this.mOldPin = bundle.getString("oldPinCode");
                    this.mNewPin = bundle.getString("newPinCode");
                    break;
            }
        }
        this.mPinDialog.setOnPinEnteredListener(this);
        getPreferenceScreen().setPersistent(false);
        this.mPhone = PhoneFactory.getDefaultPhone();
        this.mRes = getResources();
        updatePreferences();
    }

    private void setDialogValues() {
        this.mPinDialog.setText(this.mPin);
        String message = "";
        switch (this.mDialogState) {
            case 1:
                message = this.mRes.getString(2131428062);
                this.mPinDialog.setDialogTitle(this.mToState ? this.mRes.getString(2131428063) : this.mRes.getString(2131428064));
                break;
            case 2:
                message = this.mRes.getString(2131428065);
                this.mPinDialog.setDialogTitle(this.mRes.getString(2131428068));
                break;
            case 3:
                message = this.mRes.getString(2131428066);
                this.mPinDialog.setDialogTitle(this.mRes.getString(2131428068));
                break;
            case 4:
                message = this.mRes.getString(2131428067);
                this.mPinDialog.setDialogTitle(this.mRes.getString(2131428068));
                break;
        }
        if (this.mError != null) {
            message = this.mError + "\n" + message;
            this.mError = null;
        }
        this.mPinDialog.setDialogMessage(message);
    }

    protected void onSaveInstanceState(Bundle bundle) {
        if (this.mPinDialog.isDialogOpen()) {
            bundle.putInt("dialogState", this.mDialogState);
            bundle.putString("dialogPin", this.mPinDialog.getEditText().getText().toString());
            bundle.putString("dialogError", this.mError);
            bundle.putBoolean("enableState", this.mToState);
            switch (this.mDialogState) {
                case 3:
                    bundle.putString("oldPinCode", this.mOldPin);
                    return;
                case 4:
                    bundle.putString("oldPinCode", this.mOldPin);
                    bundle.putString("newPinCode", this.mNewPin);
                    return;
                default:
                    return;
            }
        }
        super.onSaveInstanceState(bundle);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        boolean z = false;
        if (preference == this.mPinToggle) {
            this.mToState = this.mPinToggle.isChecked();
            CheckBoxPreference checkBoxPreference = this.mPinToggle;
            if (!this.mToState) {
                z = true;
            }
            checkBoxPreference.setChecked(z);
            this.mDialogState = 1;
            showPinDialog();
        } else if (preference == this.mPinDialog) {
            this.mDialogState = 2;
            return false;
        }
        return true;
    }

    protected void onResume() {
        super.onResume();
        registerReceiver(this.mSimStateReceiver, new IntentFilter("android.intent.action.SIM_STATE_CHANGED"));
        if (this.mDialogState != 0) {
            showPinDialog();
        } else {
            resetDialogState();
        }
    }

    private void iccLockChanged(boolean z) {
        if (z) {
            this.mPinToggle.setChecked(this.mToState);
        } else {
            Toast.makeText(this, this.mRes.getString(2131428073), 0).show();
        }
        this.mPinToggle.setEnabled(true);
        resetDialogState();
    }

    private void resetDialogState() {
        this.mError = null;
        this.mDialogState = 2;
        this.mPin = "";
        setDialogValues();
        this.mDialogState = 0;
    }

    private void iccPinChanged(boolean z) {
        if (z) {
            Toast.makeText(this, this.mRes.getString(2131428072), 0).show();
        } else {
            Toast.makeText(this, this.mRes.getString(2131428071), 0).show();
        }
        resetDialogState();
    }

    private void showPinDialog() {
        if (this.mDialogState != 0) {
            setDialogValues();
            this.mPinDialog.showPinDialog();
        }
    }

    private void tryChangeIccLockState() {
        this.mPhone.getIccCard().setIccLockEnabled(this.mToState, this.mPin, Message.obtain(this.mHandler, 100));
        this.mPinToggle.setEnabled(false);
    }

    private boolean reasonablePin(String str) {
        return str != null && str.length() >= 4 && str.length() <= 8;
    }

    private void tryChangePin() {
        this.mPhone.getIccCard().changeIccLockPassword(this.mOldPin, this.mNewPin, Message.obtain(this.mHandler, 101));
    }

    protected void onPause() {
        super.onPause();
        unregisterReceiver(this.mSimStateReceiver);
    }

    private void updatePreferences() {
        this.mPinToggle.setChecked(this.mPhone.getIccCard().getIccLockEnabled());
    }
}