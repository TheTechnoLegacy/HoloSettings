package com.jellybyn.settings;

import android.app.Dialog;
import android.content.Context;
import android.preference.EditTextPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.EditText;

class EditPinPreference extends EditTextPreference {
    private OnPinEnteredListener mPinListener;

    protected void onBindDialogView(View view) {
        super.onBindDialogView(view);
        EditText editText = getEditText();
        if (editText != null) {
            editText.setInputType(18);
        }
    }

    protected void onDialogClosed(boolean z) {
        super.onDialogClosed(z);
        if (this.mPinListener != null) {
            this.mPinListener.onPinEntered(this, z);
        }
    }

    public void showPinDialog() {
        Dialog dialog = getDialog();
        if (dialog == null || !dialog.isShowing()) {
            showDialog(null);
        }
    }

    public EditPinPreference(Context context, AttributeSet attributeSet) {
    }

    public EditPinPreference(Context context, AttributeSet attributeSet, int i) {
    }

    public boolean isDialogOpen() {
        Dialog dialog = getDialog();
        return dialog != null && dialog.isShowing();
    }

    public void setOnPinEnteredListener(OnPinEnteredListener onPinEnteredListener) {
        this.mPinListener = onPinEnteredListener;
    }
}