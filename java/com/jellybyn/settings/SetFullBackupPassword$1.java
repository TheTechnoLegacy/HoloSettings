package com.jellybyn.settings;

import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Toast;

class SetFullBackupPassword$1 implements OnClickListener {
    final /* synthetic */ SetFullBackupPassword this$0;

    public void onClick(View view) {
        if (view == this.this$0.mSet) {
            String obj = this.this$0.mCurrentPw.getText().toString();
            String obj2 = this.this$0.mNewPw.getText().toString();
            if (!obj2.equals(this.this$0.mConfirmNewPw.getText().toString())) {
                Log.i("SetFullBackupPassword", "password mismatch");
                Toast.makeText(this.this$0, 2131428797, 1).show();
            } else if (SetFullBackupPassword.access$000(this.this$0, obj, obj2)) {
                Log.i("SetFullBackupPassword", "password set successfully");
                Toast.makeText(this.this$0, 2131428796, 1).show();
                this.this$0.finish();
            } else {
                Log.i("SetFullBackupPassword", "failure; password mismatch?");
                Toast.makeText(this.this$0, 2131428798, 1).show();
            }
        } else if (view == this.this$0.mCancel) {
            this.this$0.finish();
        } else {
            Log.w("SetFullBackupPassword", "Click on unknown view");
        }
    }

    SetFullBackupPassword$1(SetFullBackupPassword setFullBackupPassword) {
        this.this$0 = setFullBackupPassword;
    }
}