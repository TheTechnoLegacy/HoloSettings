package com.jellybyn.settings;

import android.os.CountDownTimer;
import com.jellybyn.settings.ConfirmLockPattern.ConfirmLockPatternFragment;
import com.jellybyn.settings.ConfirmLockPattern.Stage;

class ConfirmLockPattern$ConfirmLockPatternFragment$3 extends CountDownTimer {
    final /* synthetic */ ConfirmLockPatternFragment this$0;

    public void onTick(long j) {
        ConfirmLockPatternFragment.access$700(this.this$0).setText(2131428319);
        int secondsCountdown = (int) (j / 1000);
        ConfirmLockPatternFragment.access$800(this.this$0).setText(this.this$0.getString(2131428320, new Object[]{Integer.valueOf(secondsCountdown)}));
    }

    public void onFinish() {
        ConfirmLockPatternFragment.access$302(this.this$0, 0);
        ConfirmLockPatternFragment.access$500(this.this$0, Stage.NeedToUnlock);
    }

    ConfirmLockPattern$ConfirmLockPatternFragment$3(ConfirmLockPatternFragment confirmLockPatternFragment, long j, long j2) {
        this.this$0 = confirmLockPatternFragment;
        super(j, j2);
    }
}