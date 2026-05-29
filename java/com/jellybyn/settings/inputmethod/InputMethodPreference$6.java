package com.jellybyn.settings.inputmethod;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class InputMethodPreference$6 implements OnClickListener {
    final /* synthetic */ InputMethodPreference this$0;
    final /* synthetic */ InputMethodPreference val$chkPref;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.val$chkPref.setChecked(true, true);
    }

    InputMethodPreference$6(InputMethodPreference inputMethodPreference, InputMethodPreference inputMethodPreference2) {
        this.this$0 = inputMethodPreference;
        this.val$chkPref = inputMethodPreference2;
    }
}