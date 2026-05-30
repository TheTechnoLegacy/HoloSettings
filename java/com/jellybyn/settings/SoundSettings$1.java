package com.jellybyn.settings;

import android.os.Handler;
import android.os.Message;

class SoundSettings$1 extends Handler {
    final /* synthetic */ SoundSettings this$0;

    public void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                SoundSettings.access$000(this.this$0).setSummary((CharSequence) message.obj);
                return;
            case 2:
                SoundSettings.access$100(this.this$0).setSummary((CharSequence) message.obj);
                return;
            default:
                return;
        }
    }

    SoundSettings$1(SoundSettings soundSettings) {
        this.this$0 = soundSettings;
    }
}