package com.jellybyn.settings.tts;

import android.speech.tts.TextToSpeech.OnInitListener;

class TtsEngineSettingsFragment$1 implements OnInitListener {
    final /* synthetic */ TtsEngineSettingsFragment this$0;

    public void onInit(int i) {
        if (i != 0) {
            this.this$0.finishFragment();
        } else {
            this.this$0.getActivity().runOnUiThread(new 1(this));
        }
    }

    TtsEngineSettingsFragment$1(TtsEngineSettingsFragment ttsEngineSettingsFragment) {
        this.this$0 = ttsEngineSettingsFragment;
    }
}