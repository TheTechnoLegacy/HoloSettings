package com.jellybyn.settings.inputmethod;

import android.content.Context;
import android.content.Intent;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.jellybyn.settings.SettingsPreferenceFragment;

public class CheckBoxAndSettingsPreference extends CheckBoxPreference {
    private SettingsPreferenceFragment mFragment;
    private ImageView mSettingsButton;
    private Intent mSettingsIntent;
    private TextView mSummaryText;
    private TextView mTitleText;

    private void enableSettingsButton() {
        if (this.mSettingsButton != null) {
            if (this.mSettingsIntent == null) {
                this.mSettingsButton.setVisibility(8);
            } else {
                boolean checked = isChecked();
                this.mSettingsButton.setEnabled(checked);
                this.mSettingsButton.setClickable(checked);
                this.mSettingsButton.setFocusable(checked);
                if (!checked) {
                    this.mSettingsButton.setAlpha(0.4f);
                }
            }
        }
        if (this.mTitleText != null) {
            this.mTitleText.setEnabled(true);
        }
        if (this.mSummaryText != null) {
            this.mSummaryText.setEnabled(true);
        }
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        view.findViewById(2131230943).setOnClickListener(new 1(this));
        this.mSettingsButton = (ImageView) view.findViewById(2131230944);
        this.mTitleText = (TextView) view.findViewById(16908310);
        this.mSummaryText = (TextView) view.findViewById(16908304);
        this.mSettingsButton.setOnClickListener(new 2(this));
        enableSettingsButton();
    }

    public CheckBoxAndSettingsPreference(Context context, AttributeSet attributeSet) {
        setLayoutResource(2130968667);
        setWidgetLayoutResource(2130968668);
    }

    protected void onCheckBoxClicked() {
        if (isChecked()) {
            setChecked(false);
        } else {
            setChecked(true);
        }
    }

    protected void onSettingsButtonClicked() {
        if (this.mFragment != null && this.mSettingsIntent != null) {
            this.mFragment.startActivity(this.mSettingsIntent);
        }
    }

    public void setEnabled(boolean z) {
        super.setEnabled(z);
        enableSettingsButton();
    }

    public void setFragmentIntent(SettingsPreferenceFragment settingsPreferenceFragment, Intent intent) {
        this.mFragment = settingsPreferenceFragment;
        this.mSettingsIntent = intent;
    }
}