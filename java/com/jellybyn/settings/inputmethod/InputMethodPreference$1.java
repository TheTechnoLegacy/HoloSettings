package com.jellybyn.settings.inputmethod;

import android.view.View;
import android.view.View.OnClickListener;

class InputMethodPreference$1 implements OnClickListener {
    final /* synthetic */ InputMethodPreference this$0;

    public void onClick(View view) {
        if (!this.this$0.isEnabled()) {
            return;
        }
        if (this.this$0.isChecked()) {
            this.this$0.setChecked(false, true);
        } else if (InputMethodPreference.access$000(this.this$0)) {
            this.this$0.setChecked(true, true);
        } else {
            InputMethodPreference.access$200(this.this$0, InputMethodPreference.access$100(this.this$0), this.this$0);
        }
    }

    InputMethodPreference$1(InputMethodPreference inputMethodPreference) {
        this.this$0 = inputMethodPreference;
    }
}