package com.jellybyn.settings.tts;

import android.speech.tts.TextToSpeech.OnInitListener;

class TextToSpeechSettings$1 implements OnInitListener {
    final /* synthetic */ TextToSpeechSettings this$0;

    public void onInit(int i) {
        this.this$0.onInitEngine(i);
    }

    TextToSpeechSettings$1(TextToSpeechSettings textToSpeechSettings) {
        this.this$0 = textToSpeechSettings;
    }
}