package com.jellybyn.settings;

enum ChooseLockPattern$ChooseLockPatternFragment$RightButtonMode {
    Continue(2131428309, true),
    ContinueDisabled(2131428309, false),
    Confirm(2131428306, true),
    ConfirmDisabled(2131428306, false),
    Ok(17039370, true);
    
    final boolean enabled;
    final int text;

    private ChooseLockPattern$ChooseLockPatternFragment$RightButtonMode(int i, boolean z) {
        this.text = i;
        this.enabled = z;
    }
}