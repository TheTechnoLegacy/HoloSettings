package com.jellybyn.settings;

class SoundSettings$3 implements Runnable {
    final /* synthetic */ SoundSettings this$0;

    public void run() {
        if (SoundSettings.access$000(this.this$0) != null) {
            SoundSettings.access$300(this.this$0, 1, SoundSettings.access$000(this.this$0), 1);
        }
        if (SoundSettings.access$100(this.this$0) != null) {
            SoundSettings.access$300(this.this$0, 2, SoundSettings.access$100(this.this$0), 2);
        }
    }

    SoundSettings$3(SoundSettings soundSettings) {
        this.this$0 = soundSettings;
    }
}