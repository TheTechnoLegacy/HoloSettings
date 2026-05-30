package com.jellybyn.settings.tts;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.widget.CompoundButton;

class TtsEnginePreference$5 implements OnClickListener {
    final /* synthetic */ TtsEnginePreference this$0;
    final /* synthetic */ CompoundButton val$buttonView;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.val$buttonView.setChecked(false);
    }

    TtsEnginePreference$5(TtsEnginePreference ttsEnginePreference, CompoundButton compoundButton) {
        this.this$0 = ttsEnginePreference;
        this.val$buttonView = compoundButton;
    }
}