package com.jellybyn.settings;

import android.view.inputmethod.InputMethodManager;

class CryptKeeper$4 implements Runnable {
    final /* synthetic */ CryptKeeper this$0;
    final /* synthetic */ InputMethodManager val$imm;

    public void run() {
        this.val$imm.showSoftInputUnchecked(0, null);
    }

    CryptKeeper$4(CryptKeeper cryptKeeper, InputMethodManager inputMethodManager) {
        this.this$0 = cryptKeeper;
        this.val$imm = inputMethodManager;
    }
}