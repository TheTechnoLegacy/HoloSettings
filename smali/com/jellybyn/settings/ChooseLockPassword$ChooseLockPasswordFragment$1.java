package com.jellybyn.settings;

import android.os.Handler;
import android.os.Message;
import com.jellybyn.settings.ChooseLockPassword.ChooseLockPasswordFragment;
import com.jellybyn.settings.ChooseLockPassword.ChooseLockPasswordFragment.Stage;

class ChooseLockPassword$ChooseLockPasswordFragment$1 extends Handler {
    final /* synthetic */ ChooseLockPasswordFragment this$0;

    public void handleMessage(Message message) {
        if (message.what == 1) {
            this.this$0.updateStage((Stage) message.obj);
        }
    }

    ChooseLockPassword$ChooseLockPasswordFragment$1(ChooseLockPasswordFragment chooseLockPasswordFragment) {
        this.this$0 = chooseLockPasswordFragment;
    }
}