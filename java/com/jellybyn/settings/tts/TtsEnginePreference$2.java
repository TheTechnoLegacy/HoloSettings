package com.jellybyn.settings.tts;

import android.view.View;
import android.view.View.OnClickListener;
import android.widget.RadioButton;

class TtsEnginePreference$2 implements OnClickListener {
    final /* synthetic */ TtsEnginePreference this$0;
    final /* synthetic */ RadioButton val$rb;

    public void onClick(View view) {
        TtsEnginePreference.access$000(this.this$0, this.val$rb, !this.val$rb.isChecked());
    }

    TtsEnginePreference$2(TtsEnginePreference ttsEnginePreference, RadioButton radioButton) {
        this.this$0 = ttsEnginePreference;
        this.val$rb = radioButton;
    }
}