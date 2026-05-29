package com.jellybyn.settings;

import com.android.internal.widget.LockPatternView.Cell;
import com.android.internal.widget.LockPatternView.OnPatternListener;
import com.jellybyn.settings.ChooseLockPattern.ChooseLockPatternFragment;
import com.jellybyn.settings.ChooseLockPattern.ChooseLockPatternFragment.Stage;
import java.util.ArrayList;
import java.util.List;

class ChooseLockPattern$ChooseLockPatternFragment$1 implements OnPatternListener {
    final /* synthetic */ ChooseLockPatternFragment this$0;

    public void onPatternDetected(List<Cell> pattern) {
        if (ChooseLockPatternFragment.access$100(this.this$0) == Stage.NeedToConfirm || ChooseLockPatternFragment.access$100(this.this$0) == Stage.ConfirmWrong) {
            if (this.this$0.mChosenPattern == null) {
                throw new IllegalStateException("null chosen pattern in stage 'need to confirm");
            } else if (this.this$0.mChosenPattern.equals(pattern)) {
                this.this$0.updateStage(Stage.ChoiceConfirmed);
            } else {
                this.this$0.updateStage(Stage.ConfirmWrong);
            }
        } else if (ChooseLockPatternFragment.access$100(this.this$0) != Stage.Introduction && ChooseLockPatternFragment.access$100(this.this$0) != Stage.ChoiceTooShort) {
            throw new IllegalStateException("Unexpected stage " + ChooseLockPatternFragment.access$100(this.this$0) + " when " + "entering the pattern.");
        } else if (pattern.size() < 4) {
            this.this$0.updateStage(Stage.ChoiceTooShort);
        } else {
            this.this$0.mChosenPattern = new ArrayList(pattern);
            this.this$0.updateStage(Stage.FirstChoiceValid);
        }
    }

    private void patternInProgress() {
        this.this$0.mHeaderText.setText(2131428301);
        this.this$0.mFooterText.setText("");
        ChooseLockPatternFragment.access$200(this.this$0).setEnabled(false);
        ChooseLockPatternFragment.access$300(this.this$0).setEnabled(false);
    }

    public void onPatternStart() {
        this.this$0.mLockPatternView.removeCallbacks(ChooseLockPatternFragment.access$000(this.this$0));
        patternInProgress();
    }

    public void onPatternCleared() {
        this.this$0.mLockPatternView.removeCallbacks(ChooseLockPatternFragment.access$000(this.this$0));
    }

    ChooseLockPattern$ChooseLockPatternFragment$1(ChooseLockPatternFragment chooseLockPatternFragment) {
        this.this$0 = chooseLockPatternFragment;
    }

    public void onPatternCellAdded(List<Cell> list) {
    }
}