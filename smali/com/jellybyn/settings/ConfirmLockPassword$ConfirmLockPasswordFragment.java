package com.jellybyn.settings;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceActivity;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.android.internal.widget.LockPatternUtils;
import com.android.internal.widget.PasswordEntryKeyboardHelper;
import com.android.internal.widget.PasswordEntryKeyboardView;

public class ConfirmLockPassword$ConfirmLockPasswordFragment extends Fragment implements TextWatcher, OnClickListener, OnEditorActionListener {
    private Button mContinueButton;
    private Handler mHandler = new Handler();
    private TextView mHeaderText;
    private PasswordEntryKeyboardHelper mKeyboardHelper;
    private PasswordEntryKeyboardView mKeyboardView;
    private LockPatternUtils mLockPatternUtils;
    private TextView mPasswordEntry;

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        int storedQuality = this.mLockPatternUtils.getKeyguardStoredPasswordQuality();
        View view = layoutInflater.inflate(2130968599, null);
        view.findViewById(2131230761).setOnClickListener(this);
        this.mContinueButton = (Button) view.findViewById(2131230762);
        this.mContinueButton.setOnClickListener(this);
        this.mContinueButton.setEnabled(false);
        this.mPasswordEntry = (TextView) view.findViewById(2131230760);
        this.mPasswordEntry.setOnEditorActionListener(this);
        this.mPasswordEntry.addTextChangedListener(this);
        this.mKeyboardView = (PasswordEntryKeyboardView) view.findViewById(2131230763);
        this.mHeaderText = (TextView) view.findViewById(2131230758);
        boolean isAlpha = 262144 == storedQuality || 327680 == storedQuality || 393216 == storedQuality;
        this.mHeaderText.setText(isAlpha ? 2131428283 : 2131428285);
        Activity activity = getActivity();
        this.mKeyboardHelper = new PasswordEntryKeyboardHelper(activity, this.mKeyboardView, this.mPasswordEntry);
        this.mKeyboardHelper.setKeyboardMode(isAlpha ? 0 : 1);
        this.mKeyboardView.requestFocus();
        int inputType = this.mPasswordEntry.getInputType();
        TextView textView = this.mPasswordEntry;
        if (!isAlpha) {
            inputType = 18;
        }
        textView.setInputType(inputType);
        if (activity instanceof PreferenceActivity) {
            PreferenceActivity preferenceActivity = (PreferenceActivity) activity;
            CharSequence text = getText(isAlpha ? 2131428283 : 2131428285);
            preferenceActivity.showBreadCrumbs(text, text);
        }
        return view;
    }

    private void handleNext() {
        String pin = this.mPasswordEntry.getText().toString();
        if (this.mLockPatternUtils.checkPassword(pin)) {
            Intent intent = new Intent();
            intent.putExtra("password", pin);
            getActivity().setResult(-1, intent);
            getActivity().finish();
            return;
        }
        showError(2131428297);
    }

    public void onClick(View view) {
        switch (view.getId()) {
            case 2131230761:
                getActivity().setResult(0);
                getActivity().finish();
                return;
            case 2131230762:
                handleNext();
                return;
            default:
                return;
        }
    }

    private void showError(int i) {
        this.mHeaderText.setText(i);
        this.mHeaderText.announceForAccessibility(this.mHeaderText.getText());
        this.mPasswordEntry.setText(null);
        this.mHandler.postDelayed(new 1(this), 3000);
    }

    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        if (i != 0 && i != 6 && i != 5) {
            return false;
        }
        handleNext();
        return true;
    }

    public void afterTextChanged(Editable editable) {
        this.mContinueButton.setEnabled(this.mPasswordEntry.getText().length() > 0);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mLockPatternUtils = new LockPatternUtils(getActivity());
    }

    public void onPause() {
        super.onPause();
        this.mKeyboardView.requestFocus();
    }

    public void onResume() {
        super.onResume();
        this.mKeyboardView.requestFocus();
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}