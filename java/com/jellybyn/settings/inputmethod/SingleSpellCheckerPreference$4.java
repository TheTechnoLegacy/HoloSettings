package com.jellybyn.settings.inputmethod;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class SingleSpellCheckerPreference$4 implements OnClickListener {
    final /* synthetic */ SingleSpellCheckerPreference this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        if (i == 0) {
            SingleSpellCheckerPreference.access$300(this.this$0).setSpellCheckerSubtype(null);
        } else {
            SingleSpellCheckerPreference.access$300(this.this$0).setSpellCheckerSubtype(SingleSpellCheckerPreference.access$400(this.this$0).getSubtypeAt(i - 1));
        }
        dialogInterface.dismiss();
    }

    SingleSpellCheckerPreference$4(SingleSpellCheckerPreference singleSpellCheckerPreference) {
        this.this$0 = singleSpellCheckerPreference;
    }
}