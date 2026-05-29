package com.jellybyn.settings;

import com.jellybyn.settings.ConfirmLockPattern.Stage;

/* synthetic */ class ConfirmLockPattern$1 {
    static final /* synthetic */ int[] $SwitchMap$com$android$settings$ConfirmLockPattern$Stage = new int[Stage.values().length];

    static {
        try {
            $SwitchMap$com$android$settings$ConfirmLockPattern$Stage[Stage.NeedToUnlock.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            $SwitchMap$com$android$settings$ConfirmLockPattern$Stage[Stage.NeedToUnlockWrong.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            $SwitchMap$com$android$settings$ConfirmLockPattern$Stage[Stage.LockedOut.ordinal()] = 3;
        } catch (NoSuchFieldError e3) {
        }
    }
}