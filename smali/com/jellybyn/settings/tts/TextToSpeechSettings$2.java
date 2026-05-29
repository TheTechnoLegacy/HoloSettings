package com.jellybyn.settings.tts;

import android.speech.tts.TextToSpeech.OnInitListener;

class TextToSpeechSettings$2 implements OnInitListener {
    final /* synthetic */ TextToSpeechSettings this$0;

    public void onInit(int i) {
        this.this$0.onUpdateEngine(i);
    }

    TextToSpeechSettings$2(TextToSpeechSettings textToSpeechSettings) {
        this.this$0 = textToSpeechSettings;
    }
}