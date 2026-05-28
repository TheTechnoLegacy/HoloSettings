package com.jellybyn.settings.inputmethod;

import android.content.ActivityNotFoundException;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Toast;

class InputMethodPreference$3 implements OnClickListener {
    final /* synthetic */ InputMethodPreference this$0;

    public void onClick(View view) {
        try {
            InputMethodPreference.access$300(this.this$0).startActivity(InputMethodPreference.access$400(this.this$0));
        } catch (ActivityNotFoundException e) {
            Log.d(InputMethodPreference.access$500(), "IME's Settings Activity Not Found: " + e);
            Toast.makeText(InputMethodPreference.access$300(this.this$0).getActivity(), InputMethodPreference.access$300(this.this$0).getString(2131428486, new Object[]{InputMethodPreference.access$100(this.this$0).loadLabel(InputMethodPreference.access$300(this.this$0).getActivity().getPackageManager())}), 1).show();
        }
    }

    InputMethodPreference$3(InputMethodPreference inputMethodPreference) {
        this.this$0 = inputMethodPreference;
    }
}