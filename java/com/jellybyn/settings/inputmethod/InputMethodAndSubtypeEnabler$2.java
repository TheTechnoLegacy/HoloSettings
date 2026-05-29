package com.jellybyn.settings.inputmethod;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.preference.CheckBoxPreference;

class InputMethodAndSubtypeEnabler$2 implements OnClickListener {
    final /* synthetic */ InputMethodAndSubtypeEnabler this$0;
    final /* synthetic */ CheckBoxPreference val$chkPref;
    final /* synthetic */ String val$id;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.val$chkPref.setChecked(true);
        InputMethodAndSubtypeUtil.setSubtypesPreferenceEnabled(this.this$0, InputMethodAndSubtypeEnabler.access$000(this.this$0), this.val$id, true);
    }

    InputMethodAndSubtypeEnabler$2(InputMethodAndSubtypeEnabler inputMethodAndSubtypeEnabler, CheckBoxPreference checkBoxPreference, String str) {
        this.this$0 = inputMethodAndSubtypeEnabler;
        this.val$chkPref = checkBoxPreference;
        this.val$id = str;
    }
}