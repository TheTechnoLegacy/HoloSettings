package com.jellybyn.settings;

import android.content.Intent;
import com.android.internal.widget.LockPatternUtils;
import com.android.internal.widget.LockPatternView.Cell;
import com.android.internal.widget.LockPatternView.OnPatternListener;
import com.jellybyn.settings.ConfirmLockPattern.ConfirmLockPatternFragment;
import com.jellybyn.settings.ConfirmLockPattern.Stage;
import java.util.List;

class ConfirmLockPattern$ConfirmLockPatternFragment$2 implements OnPatternListener {
    final /* synthetic */ ConfirmLockPatternFragment this$0;

    public void onPatternDetected(List<Cell> pattern) {
        if (ConfirmLockPatternFragment.access$200(this.this$0).checkPattern(pattern)) {
            Intent intent = new Intent();
            intent.putExtra("password", LockPatternUtils.patternToString(pattern));
            this.this$0.getActivity().setResult(-1, intent);
            this.this$0.getActivity().finish();
        } else if (pattern.size() < 4 || ConfirmLockPatternFragment.access$304(this.this$0) < 5) {
            ConfirmLockPatternFragment.access$500(this.this$0, Stage.NeedToUnlockWrong);
            ConfirmLockPatternFragment.access$600(this.this$0);
        } else {
            ConfirmLockPatternFragment.access$400(this.this$0, ConfirmLockPatternFragment.access$200(this.this$0).setLockoutAttemptDeadline());
        }
    }

    public void onPatternCleared() {
        ConfirmLockPatternFragment.access$000(this.this$0).removeCallbacks(ConfirmLockPatternFragment.access$100(this.this$0));
    }

    public void onPatternStart() {
        ConfirmLockPatternFragment.access$000(this.this$0).removeCallbacks(ConfirmLockPatternFragment.access$100(this.this$0));
    }

    ConfirmLockPattern$ConfirmLockPatternFragment$2(ConfirmLockPatternFragment confirmLockPatternFragment) {
        this.this$0 = confirmLockPatternFragment;
    }

    public void onPatternCellAdded(List<Cell> list) {
    }
}