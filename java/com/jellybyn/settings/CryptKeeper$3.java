package com.jellybyn.settings;

import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodManager;

class CryptKeeper$3 implements OnClickListener {
    final /* synthetic */ CryptKeeper this$0;
    final /* synthetic */ InputMethodManager val$imm;

    public void onClick(View view) {
        this.val$imm.showInputMethodPicker();
    }

    CryptKeeper$3(CryptKeeper cryptKeeper, InputMethodManager inputMethodManager) {
        this.this$0 = cryptKeeper;
        this.val$imm = inputMethodManager;
    }
}