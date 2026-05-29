package com.jellybyn.settings;

protected enum ChooseLockPassword$ChooseLockPasswordFragment$Stage {
    Introduction(2131428280, 2131428282, 2131427671),
    NeedToConfirm(2131428283, 2131428285, 2131427681),
    ConfirmWrong(2131428286, 2131428287, 2131427671);
    
    public final int alphaHint;
    public final int buttonText;
    public final int numericHint;

    private ChooseLockPassword$ChooseLockPasswordFragment$Stage(int i, int i2, int i3) {
        this.alphaHint = i;
        this.numericHint = i2;
        this.buttonText = i3;
    }
}