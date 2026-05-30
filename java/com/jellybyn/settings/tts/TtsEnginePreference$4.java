package com.jellybyn.settings.tts;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.widget.CompoundButton;

class TtsEnginePreference$4 implements OnClickListener {
    final /* synthetic */ TtsEnginePreference this$0;
    final /* synthetic */ CompoundButton val$buttonView;

    public void onClick(DialogInterface dialogInterface, int i) {
        TtsEnginePreference.access$400(this.this$0, this.val$buttonView);
    }

    TtsEnginePreference$4(TtsEnginePreference ttsEnginePreference, CompoundButton compoundButton) {
        this.this$0 = ttsEnginePreference;
        this.val$buttonView = compoundButton;
    }
}