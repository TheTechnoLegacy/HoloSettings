package com.jellybyn.settings.inputmethod;

import android.os.Bundle;
import android.view.View;
import android.view.View.OnLongClickListener;

class InputMethodPreference$4 implements OnLongClickListener {
    final /* synthetic */ InputMethodPreference this$0;
    final /* synthetic */ String val$imiId;

    public boolean onLongClick(View view) {
        Bundle bundle = new Bundle();
        bundle.putString("input_method_id", this.val$imiId);
        InputMethodPreference.startFragment(InputMethodPreference.access$300(this.this$0), InputMethodAndSubtypeEnabler.class.getName(), 0, bundle);
        return true;
    }

    InputMethodPreference$4(InputMethodPreference inputMethodPreference, String str) {
        this.this$0 = inputMethodPreference;
        this.val$imiId = str;
    }
}