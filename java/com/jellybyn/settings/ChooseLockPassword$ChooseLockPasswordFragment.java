package com.jellybyn.settings;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.inputmethodservice.KeyboardView;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.preference.PreferenceActivity;
import android.text.Editable;
import android.text.Selection;
import android.text.Spannable;
import android.text.TextUtils;
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

public class ChooseLockPassword$ChooseLockPasswordFragment extends Fragment implements TextWatcher, OnClickListener, OnEditorActionListener {
    private Button mCancelButton;
    private ChooseLockSettingsHelper mChooseLockSettingsHelper;
    private String mFirstPin;
    private Handler mHandler = new 1(this);
    private TextView mHeaderText;
    private boolean mIsAlphaMode;
    private PasswordEntryKeyboardHelper mKeyboardHelper;
    private KeyboardView mKeyboardView;
    private LockPatternUtils mLockPatternUtils;
    private Button mNextButton;
    private TextView mPasswordEntry;
    private int mPasswordMaxLength = 16;
    private int mPasswordMinLength = 4;
    private int mPasswordMinLetters = 0;
    private int mPasswordMinLowerCase = 0;
    private int mPasswordMinNonLetter = 0;
    private int mPasswordMinNumeric = 0;
    private int mPasswordMinSymbols = 0;
    private int mPasswordMinUpperCase = 0;
    private int mRequestedQuality = 131072;
    private Stage mUiStage = Stage.Introduction;

    private String validatePassword(String str) {
        if (str.length() < this.mPasswordMinLength) {
            return getString(this.mIsAlphaMode ? 2131427668 : 2131427669, new Object[]{Integer.valueOf(this.mPasswordMinLength)});
        } else if (str.length() > this.mPasswordMaxLength) {
            return getString(this.mIsAlphaMode ? 2131427672 : 2131427673, new Object[]{Integer.valueOf(this.mPasswordMaxLength + 1)});
        } else {
            int letters = 0;
            int numbers = 0;
            int lowercase = 0;
            int symbols = 0;
            int uppercase = 0;
            int nonletter = 0;
            for (int i = 0; i < str.length(); i++) {
                char charAt = str.charAt(i);
                if (charAt < ' ' || charAt > 127) {
                    return getString(2131427676);
                }
                if (charAt >= '0' && charAt <= '9') {
                    numbers++;
                    nonletter++;
                } else if (charAt >= 'A' && charAt <= 'Z') {
                    letters++;
                    uppercase++;
                } else if (charAt < 'a' || charAt > 'z') {
                    symbols++;
                    nonletter++;
                } else {
                    letters++;
                    lowercase++;
                }
            }
            if (131072 == this.mRequestedQuality && (letters > 0 || symbols > 0)) {
                return getString(2131427674);
            }
            if (393216 != this.mRequestedQuality) {
                Object obj = 262144 == this.mRequestedQuality ? 1 : null;
                Object obj2 = 327680 == this.mRequestedQuality ? 1 : null;
                if ((obj != null || obj2 != null) && letters == 0) {
                    return getString(2131427677);
                }
                if (obj2 != null && numbers == 0) {
                    return getString(2131427678);
                }
            } else if (letters < this.mPasswordMinLetters) {
                return String.format(getResources().getQuantityString(2131623937, this.mPasswordMinLetters), new Object[]{Integer.valueOf(this.mPasswordMinLetters)});
            } else if (numbers < this.mPasswordMinNumeric) {
                return String.format(getResources().getQuantityString(2131623940, this.mPasswordMinNumeric), new Object[]{Integer.valueOf(this.mPasswordMinNumeric)});
            } else if (lowercase < this.mPasswordMinLowerCase) {
                return String.format(getResources().getQuantityString(2131623938, this.mPasswordMinLowerCase), new Object[]{Integer.valueOf(this.mPasswordMinLowerCase)});
            } else if (uppercase < this.mPasswordMinUpperCase) {
                return String.format(getResources().getQuantityString(2131623939, this.mPasswordMinUpperCase), new Object[]{Integer.valueOf(this.mPasswordMinUpperCase)});
            } else if (symbols < this.mPasswordMinSymbols) {
                return String.format(getResources().getQuantityString(2131623941, this.mPasswordMinSymbols), new Object[]{Integer.valueOf(this.mPasswordMinSymbols)});
            } else if (nonletter < this.mPasswordMinNonLetter) {
                return String.format(getResources().getQuantityString(2131623942, this.mPasswordMinNonLetter), new Object[]{Integer.valueOf(this.mPasswordMinNonLetter)});
            }
            if (!this.mLockPatternUtils.checkPasswordHistory(str)) {
                return null;
            }
            return getString(this.mIsAlphaMode ? 2131427680 : 2131427675);
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = layoutInflater.inflate(2130968597, null);
        this.mCancelButton = (Button) view.findViewById(2131230761);
        this.mCancelButton.setOnClickListener(this);
        this.mNextButton = (Button) view.findViewById(2131230762);
        this.mNextButton.setOnClickListener(this);
        boolean z = 262144 == this.mRequestedQuality || 327680 == this.mRequestedQuality || 393216 == this.mRequestedQuality;
        this.mIsAlphaMode = z;
        this.mKeyboardView = (PasswordEntryKeyboardView) view.findViewById(2131230763);
        this.mPasswordEntry = (TextView) view.findViewById(2131230760);
        this.mPasswordEntry.setOnEditorActionListener(this);
        this.mPasswordEntry.addTextChangedListener(this);
        Activity activity = getActivity();
        this.mKeyboardHelper = new PasswordEntryKeyboardHelper(activity, this.mKeyboardView, this.mPasswordEntry);
        this.mKeyboardHelper.setKeyboardMode(this.mIsAlphaMode ? 0 : 1);
        this.mHeaderText = (TextView) view.findViewById(2131230758);
        this.mKeyboardView.requestFocus();
        int inputType = this.mPasswordEntry.getInputType();
        TextView textView = this.mPasswordEntry;
        if (!this.mIsAlphaMode) {
            inputType = 18;
        }
        textView.setInputType(inputType);
        boolean confirmCredentials = getActivity().getIntent().getBooleanExtra("confirm_credentials", true);
        if (bundle == null) {
            updateStage(Stage.Introduction);
            if (confirmCredentials) {
                this.mChooseLockSettingsHelper.launchConfirmationActivity(58, null, null);
            }
        } else {
            this.mFirstPin = bundle.getString("first_pin");
            String string = bundle.getString("ui_stage");
            if (string != null) {
                this.mUiStage = Stage.valueOf(string);
                updateStage(this.mUiStage);
            }
        }
        if (activity instanceof PreferenceActivity) {
            PreferenceActivity preferenceActivity = (PreferenceActivity) activity;
            CharSequence text = getText(this.mIsAlphaMode ? 2131428280 : 2131428282);
            preferenceActivity.showBreadCrumbs(text, text);
        }
        return view;
    }

    private void handleNext() {
        String pin = this.mPasswordEntry.getText().toString();
        if (!TextUtils.isEmpty(pin)) {
            String errorMsg = null;
            if (this.mUiStage == Stage.Introduction) {
                errorMsg = validatePassword(pin);
                if (errorMsg == null) {
                    this.mFirstPin = pin;
                    this.mPasswordEntry.setText("");
                    updateStage(Stage.NeedToConfirm);
                }
            } else if (this.mUiStage == Stage.NeedToConfirm) {
                if (this.mFirstPin.equals(pin)) {
                    boolean booleanExtra = getActivity().getIntent().getBooleanExtra("lockscreen.biometric_weak_fallback", false);
                    this.mLockPatternUtils.clearLock(booleanExtra);
                    this.mLockPatternUtils.saveLockPassword(pin, this.mRequestedQuality, booleanExtra);
                    getActivity().setResult(1);
                    getActivity().finish();
                } else {
                    CharSequence tmp = this.mPasswordEntry.getText();
                    if (tmp != null) {
                        Selection.setSelection((Spannable) tmp, 0, tmp.length());
                    }
                    updateStage(Stage.ConfirmWrong);
                }
            }
            if (errorMsg != null) {
                showError(errorMsg, this.mUiStage);
            }
        }
    }

    private void updateUi() {
        String password = this.mPasswordEntry.getText().toString();
        int length = password.length();
        if (this.mUiStage != Stage.Introduction || length <= 0) {
            this.mHeaderText.setText(this.mIsAlphaMode ? this.mUiStage.alphaHint : this.mUiStage.numericHint);
            this.mNextButton.setEnabled(length > 0);
        } else if (length < this.mPasswordMinLength) {
            this.mHeaderText.setText(getString(this.mIsAlphaMode ? 2131427668 : 2131427669, new Object[]{Integer.valueOf(this.mPasswordMinLength)}));
            this.mNextButton.setEnabled(false);
        } else {
            String validatePassword = validatePassword(password);
            if (validatePassword != null) {
                this.mHeaderText.setText(validatePassword);
                this.mNextButton.setEnabled(false);
            } else {
                this.mHeaderText.setText(2131427670);
                this.mNextButton.setEnabled(true);
            }
        }
        this.mNextButton.setText(this.mUiStage.buttonText);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mLockPatternUtils = new LockPatternUtils(getActivity());
        Intent intent = getActivity().getIntent();
        this.mRequestedQuality = Math.max(intent.getIntExtra("lockscreen.password_type", this.mRequestedQuality), this.mLockPatternUtils.getRequestedPasswordQuality());
        this.mPasswordMinLength = Math.max(intent.getIntExtra("lockscreen.password_min", this.mPasswordMinLength), this.mLockPatternUtils.getRequestedMinimumPasswordLength());
        this.mPasswordMaxLength = intent.getIntExtra("lockscreen.password_max", this.mPasswordMaxLength);
        this.mPasswordMinLetters = Math.max(intent.getIntExtra("lockscreen.password_min_letters", this.mPasswordMinLetters), this.mLockPatternUtils.getRequestedPasswordMinimumLetters());
        this.mPasswordMinUpperCase = Math.max(intent.getIntExtra("lockscreen.password_min_uppercase", this.mPasswordMinUpperCase), this.mLockPatternUtils.getRequestedPasswordMinimumUpperCase());
        this.mPasswordMinLowerCase = Math.max(intent.getIntExtra("lockscreen.password_min_lowercase", this.mPasswordMinLowerCase), this.mLockPatternUtils.getRequestedPasswordMinimumLowerCase());
        this.mPasswordMinNumeric = Math.max(intent.getIntExtra("lockscreen.password_min_numeric", this.mPasswordMinNumeric), this.mLockPatternUtils.getRequestedPasswordMinimumNumeric());
        this.mPasswordMinSymbols = Math.max(intent.getIntExtra("lockscreen.password_min_symbols", this.mPasswordMinSymbols), this.mLockPatternUtils.getRequestedPasswordMinimumSymbols());
        this.mPasswordMinNonLetter = Math.max(intent.getIntExtra("lockscreen.password_min_nonletter", this.mPasswordMinNonLetter), this.mLockPatternUtils.getRequestedPasswordMinimumNonLetter());
        this.mChooseLockSettingsHelper = new ChooseLockSettingsHelper(getActivity());
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        switch (i) {
            case 58:
                if (i2 != -1) {
                    getActivity().setResult(1);
                    getActivity().finish();
                    return;
                }
                return;
            default:
                return;
        }
    }

    private void showError(String str, Stage stage) {
        this.mHeaderText.setText(str);
        this.mHeaderText.announceForAccessibility(this.mHeaderText.getText());
        Message mesg = this.mHandler.obtainMessage(1, stage);
        this.mHandler.removeMessages(1);
        this.mHandler.sendMessageDelayed(mesg, 3000);
    }

    protected void updateStage(Stage stage) {
        Stage previousStage = this.mUiStage;
        this.mUiStage = stage;
        updateUi();
        if (previousStage != stage) {
            this.mHeaderText.announceForAccessibility(this.mHeaderText.getText());
        }
    }

    public void onClick(View view) {
        switch (view.getId()) {
            case 2131230761:
                getActivity().finish();
                return;
            case 2131230762:
                handleNext();
                return;
            default:
                return;
        }
    }

    public void afterTextChanged(Editable editable) {
        if (this.mUiStage == Stage.ConfirmWrong) {
            this.mUiStage = Stage.NeedToConfirm;
        }
        updateUi();
    }

    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        if (i != 0 && i != 6 && i != 5) {
            return false;
        }
        handleNext();
        return true;
    }

    public void onResume() {
        super.onResume();
        updateStage(this.mUiStage);
        this.mKeyboardView.requestFocus();
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putString("ui_stage", this.mUiStage.name());
        bundle.putString("first_pin", this.mFirstPin);
    }

    public void onPause() {
        this.mHandler.removeMessages(1);
        super.onPause();
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}