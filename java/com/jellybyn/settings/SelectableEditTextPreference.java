package com.jellybyn.settings;

import android.content.Context;
import android.preference.EditTextPreference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.EditText;

public class SelectableEditTextPreference extends EditTextPreference {
    private int mSelectionMode;

    protected void onBindDialogView(View view) {
        super.onBindDialogView(view);
        EditText editText = getEditText();
        int length = editText.getText() != null ? editText.getText().length() : 0;
        if (!TextUtils.isEmpty(editText.getText())) {
            switch (this.mSelectionMode) {
                case 0:
                    editText.setSelection(length);
                    return;
                case 1:
                    editText.setSelection(0);
                    return;
                case 2:
                    editText.setSelection(0, length);
                    return;
                default:
                    return;
            }
        }
    }

    public SelectableEditTextPreference(Context context, AttributeSet attributeSet) {
    }
}