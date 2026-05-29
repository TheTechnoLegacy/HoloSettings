package com.jellybyn.settings.tts;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.speech.tts.TextToSpeech.EngineInfo;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Checkable;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.RadioButton;

public class TtsEnginePreference extends Preference {
    private final EngineInfo mEngineInfo;
    private final PreferenceActivity mPreferenceActivity;
    private volatile boolean mPreventRadioButtonCallbacks;
    private RadioButton mRadioButton;
    private final OnCheckedChangeListener mRadioChangeListener = new 1(this);
    private View mSettingsIcon;
    private final RadioButtonGroupState mSharedState;
    private Intent mVoiceCheckData;

    public View getView(View view, ViewGroup viewGroup) {
        boolean z = true;
        if (this.mSharedState == null) {
            throw new IllegalStateException("Call to getView() before a call tosetSharedState()");
        }
        View view2 = super.getView(view, viewGroup);
        RadioButton rb = (RadioButton) view2.findViewById(2131230955);
        rb.setOnCheckedChangeListener(this.mRadioChangeListener);
        boolean isChecked = getKey().equals(this.mSharedState.getCurrentKey());
        if (isChecked) {
            this.mSharedState.setCurrentChecked(rb);
        }
        this.mPreventRadioButtonCallbacks = true;
        rb.setChecked(isChecked);
        this.mPreventRadioButtonCallbacks = false;
        this.mRadioButton = rb;
        view2.findViewById(2131230956).setOnClickListener(new 2(this, rb));
        this.mSettingsIcon = view2.findViewById(2131230957);
        View view3 = this.mSettingsIcon;
        if (!isChecked || this.mVoiceCheckData == null) {
            z = false;
        }
        view3.setEnabled(z);
        if (!isChecked) {
            this.mSettingsIcon.setAlpha(0.4f);
        }
        this.mSettingsIcon.setOnClickListener(new 1(this));
        if (this.mVoiceCheckData != null) {
            this.mSettingsIcon.setEnabled(this.mRadioButton.isChecked());
        }
        return view2;
    }

    private void displayDataAlert(OnClickListener onClickListener, OnClickListener onClickListener2) {
        Log.i("TtsEnginePreference", "Displaying data alert for :" + this.mEngineInfo.name);
        Builder builder = new Builder(getContext());
        builder.setTitle(17039380);
        builder.setIconAttribute(16843605);
        builder.setMessage(getContext().getString(2131428721, new Object[]{this.mEngineInfo.label}));
        builder.setCancelable(true);
        builder.setPositiveButton(17039370, onClickListener);
        builder.setNegativeButton(17039360, onClickListener2);
        builder.create().show();
    }

    public TtsEnginePreference(Context context, EngineInfo engineInfo, RadioButtonGroupState radioButtonGroupState, PreferenceActivity preferenceActivity) {
        super(context);
        setLayoutResource(2130968674);
        this.mSharedState = radioButtonGroupState;
        this.mPreferenceActivity = preferenceActivity;
        this.mEngineInfo = engineInfo;
        this.mPreventRadioButtonCallbacks = false;
        setKey(this.mEngineInfo.name);
        setTitle(this.mEngineInfo.label);
    }

    private void makeCurrentEngine(Checkable checkable) {
        if (this.mSharedState.getCurrentChecked() != null) {
            this.mSharedState.getCurrentChecked().setChecked(false);
        }
        this.mSharedState.setCurrentChecked(checkable);
        this.mSharedState.setCurrentKey(getKey());
        callChangeListener(this.mSharedState.getCurrentKey());
        this.mSettingsIcon.setEnabled(true);
    }

    private void onRadioButtonClicked(CompoundButton compoundButton, boolean z) {
        if (!this.mPreventRadioButtonCallbacks && this.mSharedState.getCurrentChecked() != compoundButton) {
            if (!z) {
                this.mSettingsIcon.setEnabled(false);
            } else if (shouldDisplayDataAlert()) {
                displayDataAlert(new 4(this, compoundButton), new 4(this, compoundButton));
            } else {
                makeCurrentEngine(compoundButton);
            }
        }
    }

    public void setVoiceDataDetails(Intent intent) {
        this.mVoiceCheckData = intent;
        if (this.mSettingsIcon != null && this.mRadioButton != null) {
            if (this.mRadioButton.isChecked()) {
                this.mSettingsIcon.setEnabled(true);
                return;
            }
            this.mSettingsIcon.setEnabled(false);
            this.mSettingsIcon.setAlpha(0.4f);
        }
    }

    private boolean shouldDisplayDataAlert() {
        return !this.mEngineInfo.system;
    }
}