package com.jellybyn.settings;

import com.jellybyn.settings.ConfirmLockPattern.ConfirmLockPatternFragment;

class ConfirmLockPattern$ConfirmLockPatternFragment$1 implements Runnable {
    final /* synthetic */ ConfirmLockPatternFragment this$0;

    public void run() {
        ConfirmLockPatternFragment.access$000(this.this$0).clearPattern();
    }

    ConfirmLockPattern$ConfirmLockPatternFragment$1(ConfirmLockPatternFragment confirmLockPatternFragment) {
        this.this$0 = confirmLockPatternFragment;
    }
}