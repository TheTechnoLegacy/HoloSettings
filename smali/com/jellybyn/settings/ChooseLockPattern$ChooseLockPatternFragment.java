package com.jellybyn.settings;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.internal.widget.LinearLayoutWithDefaultTouchRecepient;
import com.android.internal.widget.LockPatternUtils;
import com.android.internal.widget.LockPatternView;
import com.android.internal.widget.LockPatternView.Cell;
import com.android.internal.widget.LockPatternView.DisplayMode;
import com.android.internal.widget.LockPatternView.OnPatternListener;
import com.google.android.collect.Lists;
import com.jellybyn.settings.ChooseLockPattern.1;
import java.util.Collections;
import java.util.List;

public class ChooseLockPattern$ChooseLockPatternFragment extends Fragment implements OnClickListener {
    private final List<Cell> mAnimatePattern = Collections.unmodifiableList(Lists.newArrayList(new Cell[]{Cell.of(0, 0), Cell.of(0, 1), Cell.of(1, 1), Cell.of(2, 1)}));
    private ChooseLockSettingsHelper mChooseLockSettingsHelper;
    protected OnPatternListener mChooseNewLockPatternListener = new 1(this);
    protected List<Cell> mChosenPattern = null;
    private Runnable mClearPatternRunnable = new 2(this);
    private TextView mFooterLeftButton;
    private TextView mFooterRightButton;
    protected TextView mFooterText;
    protected TextView mHeaderText;
    protected LockPatternView mLockPatternView;
    private Stage mUiStage = Stage.Introduction;

    protected void updateStage(Stage stage) {
        Stage previousStage = this.mUiStage;
        this.mUiStage = stage;
        if (stage == Stage.ChoiceTooShort) {
            this.mHeaderText.setText(getResources().getString(stage.headerMessage, new Object[]{Integer.valueOf(4)}));
        } else {
            this.mHeaderText.setText(stage.headerMessage);
        }
        if (stage.footerMessage == -1) {
            this.mFooterText.setText("");
        } else {
            this.mFooterText.setText(stage.footerMessage);
        }
        if (stage.leftMode == LeftButtonMode.Gone) {
            this.mFooterLeftButton.setVisibility(8);
        } else {
            this.mFooterLeftButton.setVisibility(0);
            this.mFooterLeftButton.setText(stage.leftMode.text);
            this.mFooterLeftButton.setEnabled(stage.leftMode.enabled);
        }
        this.mFooterRightButton.setText(stage.rightMode.text);
        this.mFooterRightButton.setEnabled(stage.rightMode.enabled);
        if (stage.patternEnabled) {
            this.mLockPatternView.enableInput();
        } else {
            this.mLockPatternView.disableInput();
        }
        this.mLockPatternView.setDisplayMode(DisplayMode.Correct);
        switch (1.$SwitchMap$com$android$settings$ChooseLockPattern$ChooseLockPatternFragment$Stage[this.mUiStage.ordinal()]) {
            case 1:
                this.mLockPatternView.clearPattern();
                break;
            case 2:
                this.mLockPatternView.setPattern(DisplayMode.Animate, this.mAnimatePattern);
                break;
            case 3:
                this.mLockPatternView.setDisplayMode(DisplayMode.Wrong);
                postClearPatternRunnable();
                break;
            case 5:
                this.mLockPatternView.clearPattern();
                break;
            case 6:
                this.mLockPatternView.setDisplayMode(DisplayMode.Wrong);
                postClearPatternRunnable();
                break;
        }
        if (previousStage != stage) {
            this.mHeaderText.announceForAccessibility(this.mHeaderText.getText());
        }
    }

    public void onClick(View view) {
        if (view == this.mFooterLeftButton) {
            if (this.mUiStage.leftMode == LeftButtonMode.Retry) {
                this.mChosenPattern = null;
                this.mLockPatternView.clearPattern();
                updateStage(Stage.Introduction);
            } else if (this.mUiStage.leftMode == LeftButtonMode.Cancel) {
                getActivity().setResult(1);
                getActivity().finish();
            } else {
                throw new IllegalStateException("left footer button pressed, but stage of " + this.mUiStage + " doesn't make sense");
            }
        } else if (view != this.mFooterRightButton) {
        } else {
            if (this.mUiStage.rightMode == RightButtonMode.Continue) {
                if (this.mUiStage != Stage.FirstChoiceValid) {
                    throw new IllegalStateException("expected ui stage " + Stage.FirstChoiceValid + " when button is " + RightButtonMode.Continue);
                }
                updateStage(Stage.NeedToConfirm);
            } else if (this.mUiStage.rightMode == RightButtonMode.Confirm) {
                if (this.mUiStage != Stage.ChoiceConfirmed) {
                    throw new IllegalStateException("expected ui stage " + Stage.ChoiceConfirmed + " when button is " + RightButtonMode.Confirm);
                }
                saveChosenPatternAndFinish();
            } else if (this.mUiStage.rightMode != RightButtonMode.Ok) {
            } else {
                if (this.mUiStage != Stage.HelpScreen) {
                    throw new IllegalStateException("Help screen is only mode with ok button, but stage is " + this.mUiStage);
                }
                this.mLockPatternView.clearPattern();
                this.mLockPatternView.setDisplayMode(DisplayMode.Correct);
                updateStage(Stage.Introduction);
            }
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = layoutInflater.inflate(2130968598, null);
        this.mHeaderText = (TextView) view.findViewById(2131230758);
        this.mLockPatternView = (LockPatternView) view.findViewById(2131230765);
        this.mLockPatternView.setOnPatternListener(this.mChooseNewLockPatternListener);
        this.mLockPatternView.setTactileFeedbackEnabled(this.mChooseLockSettingsHelper.utils().isTactileFeedbackEnabled());
        this.mFooterText = (TextView) view.findViewById(2131230766);
        this.mFooterLeftButton = (TextView) view.findViewById(2131230767);
        this.mFooterRightButton = (TextView) view.findViewById(2131230768);
        this.mFooterLeftButton.setOnClickListener(this);
        this.mFooterRightButton.setOnClickListener(this);
        ((LinearLayoutWithDefaultTouchRecepient) view.findViewById(2131230764)).setDefaultTouchRecepient(this.mLockPatternView);
        boolean confirmCredentials = getActivity().getIntent().getBooleanExtra("confirm_credentials", false);
        if (bundle != null) {
            String patternString = bundle.getString("chosenPattern");
            if (patternString != null) {
                this.mChosenPattern = LockPatternUtils.stringToPattern(patternString);
            }
            updateStage(Stage.values()[bundle.getInt("uiStage")]);
        } else if (confirmCredentials) {
            updateStage(Stage.NeedToConfirm);
            if (!this.mChooseLockSettingsHelper.launchConfirmationActivity(55, null, null)) {
                updateStage(Stage.Introduction);
            }
        } else {
            updateStage(Stage.Introduction);
        }
        return view;
    }

    private void saveChosenPatternAndFinish() {
        LockPatternUtils utils = this.mChooseLockSettingsHelper.utils();
        boolean z = !utils.isPatternEverChosen();
        utils.saveLockPattern(this.mChosenPattern, getActivity().getIntent().getBooleanExtra("lockscreen.biometric_weak_fallback", false));
        utils.setLockPatternEnabled(true);
        if (z) {
            utils.setVisiblePatternEnabled(true);
        }
        getActivity().setResult(1);
        getActivity().finish();
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        switch (i) {
            case 55:
                if (i2 != -1) {
                    getActivity().setResult(1);
                    getActivity().finish();
                }
                updateStage(Stage.Introduction);
                return;
            default:
                return;
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt("uiStage", this.mUiStage.ordinal());
        if (this.mChosenPattern != null) {
            bundle.putString("chosenPattern", LockPatternUtils.patternToString(this.mChosenPattern));
        }
    }

    private void postClearPatternRunnable() {
        this.mLockPatternView.removeCallbacks(this.mClearPatternRunnable);
        this.mLockPatternView.postDelayed(this.mClearPatternRunnable, 2000);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mChooseLockSettingsHelper = new ChooseLockSettingsHelper(getActivity());
    }
}