package com.jellybyn.settings.inputmethod;

import android.content.Context;
import android.util.AttributeSet;
import android.view.textservice.TextServicesManager;

public class SpellCheckersPreference extends CheckBoxAndSettingsPreference {
    private final TextServicesManager mTsm;

    public SpellCheckersPreference(Context context, AttributeSet attributeSet) {
        this.mTsm = (TextServicesManager) context.getSystemService("textservices");
        setChecked(this.mTsm.isSpellCheckerEnabled());
    }

    protected void onCheckBoxClicked() {
        super.onCheckBoxClicked();
        this.mTsm.setSpellCheckerEnabled(isChecked());
    }
}