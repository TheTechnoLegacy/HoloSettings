package com.jellybyn.settings;

enum ChooseLockPattern$ChooseLockPatternFragment$LeftButtonMode {
    Cancel(2131427562, true),
    CancelDisabled(2131427562, false),
    Retry(2131428308, true),
    RetryDisabled(2131428308, false),
    Gone(-1, false);
    
    final boolean enabled;
    final int text;

    private ChooseLockPattern$ChooseLockPatternFragment$LeftButtonMode(int i, boolean z) {
        this.text = i;
        this.enabled = z;
    }
}