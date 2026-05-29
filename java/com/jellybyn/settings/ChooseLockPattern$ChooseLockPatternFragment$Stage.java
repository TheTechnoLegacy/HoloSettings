package com.jellybyn.settings;

import com.jellybyn.settings.ChooseLockPattern.ChooseLockPatternFragment.LeftButtonMode;
import com.jellybyn.settings.ChooseLockPattern.ChooseLockPatternFragment.RightButtonMode;

protected enum ChooseLockPattern$ChooseLockPatternFragment$Stage {
    Introduction(2131428299, LeftButtonMode.Cancel, RightButtonMode.ContinueDisabled, -1, true),
    HelpScreen(2131428318, LeftButtonMode.Gone, RightButtonMode.Ok, -1, false),
    ChoiceTooShort(2131428302, LeftButtonMode.Retry, RightButtonMode.ContinueDisabled, -1, true),
    FirstChoiceValid(2131428303, LeftButtonMode.Retry, RightButtonMode.Continue, -1, false),
    NeedToConfirm(2131428304, LeftButtonMode.Cancel, RightButtonMode.ConfirmDisabled, -1, true),
    ConfirmWrong(2131428297, LeftButtonMode.Cancel, RightButtonMode.ConfirmDisabled, -1, true),
    ChoiceConfirmed(2131428305, LeftButtonMode.Cancel, RightButtonMode.Confirm, -1, false);
    
    final int footerMessage;
    final int headerMessage;
    final LeftButtonMode leftMode;
    final boolean patternEnabled;
    final RightButtonMode rightMode;

    private ChooseLockPattern$ChooseLockPatternFragment$Stage(int i, LeftButtonMode leftButtonMode, RightButtonMode rightButtonMode, int i2, boolean z) {
        this.headerMessage = i;
        this.leftMode = leftButtonMode;
        this.rightMode = rightButtonMode;
        this.footerMessage = i2;
        this.patternEnabled = z;
    }
}