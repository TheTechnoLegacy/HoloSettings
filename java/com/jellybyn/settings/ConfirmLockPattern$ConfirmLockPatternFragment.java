package com.jellybyn.settings;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.SystemClock;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.internal.widget.LinearLayoutWithDefaultTouchRecepient;
import com.android.internal.widget.LockPatternUtils;
import com.android.internal.widget.LockPatternView;
import com.android.internal.widget.LockPatternView.DisplayMode;
import com.android.internal.widget.LockPatternView.OnPatternListener;
import com.jellybyn.settings.ConfirmLockPattern.1;
import com.jellybyn.settings.ConfirmLockPattern.Stage;

public class ConfirmLockPattern$ConfirmLockPatternFragment extends Fragment {
    private Runnable mClearPatternRunnable = new 1(this);
    private OnPatternListener mConfirmExistingLockPatternListener = new 1(this);
    private CountDownTimer mCountdownTimer;
    private CharSequence mFooterText;
    private TextView mFooterTextView;
    private CharSequence mFooterWrongText;
    private CharSequence mHeaderText;
    private TextView mHeaderTextView;
    private CharSequence mHeaderWrongText;
    private LockPatternUtils mLockPatternUtils;
    private LockPatternView mLockPatternView;
    private int mNumWrongConfirmAttempts;

    private void updateStage(Stage stage) {
        switch (1.$SwitchMap$com$android$settings$ConfirmLockPattern$Stage[stage.ordinal()]) {
            case 1:
                if (this.mHeaderText != null) {
                    this.mHeaderTextView.setText(this.mHeaderText);
                } else {
                    this.mHeaderTextView.setText(2131428295);
                }
                if (this.mFooterText != null) {
                    this.mFooterTextView.setText(this.mFooterText);
                } else {
                    this.mFooterTextView.setText(2131428296);
                }
                this.mLockPatternView.setEnabled(true);
                this.mLockPatternView.enableInput();
                break;
            case 2:
                if (this.mHeaderWrongText != null) {
                    this.mHeaderTextView.setText(this.mHeaderWrongText);
                } else {
                    this.mHeaderTextView.setText(2131428297);
                }
                if (this.mFooterWrongText != null) {
                    this.mFooterTextView.setText(this.mFooterWrongText);
                } else {
                    this.mFooterTextView.setText(2131428298);
                }
                this.mLockPatternView.setDisplayMode(DisplayMode.Wrong);
                this.mLockPatternView.setEnabled(true);
                this.mLockPatternView.enableInput();
                break;
            case 3:
                this.mLockPatternView.clearPattern();
                this.mLockPatternView.setEnabled(false);
                break;
        }
        this.mHeaderTextView.announceForAccessibility(this.mHeaderTextView.getText());
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = layoutInflater.inflate(2130968600, null);
        this.mHeaderTextView = (TextView) view.findViewById(2131230758);
        this.mLockPatternView = (LockPatternView) view.findViewById(2131230765);
        this.mFooterTextView = (TextView) view.findViewById(2131230766);
        ((LinearLayoutWithDefaultTouchRecepient) view.findViewById(2131230764)).setDefaultTouchRecepient(this.mLockPatternView);
        Intent intent = getActivity().getIntent();
        if (intent != null) {
            this.mHeaderText = intent.getCharSequenceExtra("com.jellybyn.settings.ConfirmLockPattern.header");
            this.mFooterText = intent.getCharSequenceExtra("com.jellybyn.settings.ConfirmLockPattern.footer");
            this.mHeaderWrongText = intent.getCharSequenceExtra("com.jellybyn.settings.ConfirmLockPattern.header_wrong");
            this.mFooterWrongText = intent.getCharSequenceExtra("com.jellybyn.settings.ConfirmLockPattern.footer_wrong");
        }
        this.mLockPatternView.setTactileFeedbackEnabled(this.mLockPatternUtils.isTactileFeedbackEnabled());
        this.mLockPatternView.setOnPatternListener(this.mConfirmExistingLockPatternListener);
        updateStage(Stage.NeedToUnlock);
        if (bundle != null) {
            this.mNumWrongConfirmAttempts = bundle.getInt("num_wrong_attempts");
        } else if (!this.mLockPatternUtils.savedPatternExists()) {
            getActivity().setResult(-1);
            getActivity().finish();
        }
        return view;
    }

    public void onResume() {
        super.onResume();
        long deadline = this.mLockPatternUtils.getLockoutAttemptDeadline();
        if (deadline != 0) {
            handleAttemptLockout(deadline);
        } else if (!this.mLockPatternView.isEnabled()) {
            this.mNumWrongConfirmAttempts = 0;
            updateStage(Stage.NeedToUnlock);
        }
    }

    private void handleAttemptLockout(long j) {
        updateStage(Stage.LockedOut);
        this.mCountdownTimer = new 3(this, j - SystemClock.elapsedRealtime(), 1000).start();
    }

    public void onPause() {
        super.onPause();
        if (this.mCountdownTimer != null) {
            this.mCountdownTimer.cancel();
        }
    }

    private void postClearPatternRunnable() {
        this.mLockPatternView.removeCallbacks(this.mClearPatternRunnable);
        this.mLockPatternView.postDelayed(this.mClearPatternRunnable, 2000);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mLockPatternUtils = new LockPatternUtils(getActivity());
    }

    public void onSaveInstanceState(Bundle bundle) {
        bundle.putInt("num_wrong_attempts", this.mNumWrongConfirmAttempts);
    }

    static /* synthetic */ int access$304(ConfirmLockPattern$ConfirmLockPatternFragment confirmLockPattern$ConfirmLockPatternFragment) {
        int i = confirmLockPattern$ConfirmLockPatternFragment.mNumWrongConfirmAttempts + 1;
        confirmLockPattern$ConfirmLockPatternFragment.mNumWrongConfirmAttempts = i;
        return i;
    }
}