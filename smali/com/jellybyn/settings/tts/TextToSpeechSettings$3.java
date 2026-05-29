package com.jellybyn.settings.tts;

import android.speech.tts.UtteranceProgressListener;
import android.util.Log;

class TextToSpeechSettings$3 extends UtteranceProgressListener {
    final /* synthetic */ TextToSpeechSettings this$0;

    public void onError(String str) {
        Log.e("TextToSpeechSettings", "Error while trying to synthesize sample text");
    }

    TextToSpeechSettings$3(TextToSpeechSettings textToSpeechSettings) {
        this.this$0 = textToSpeechSettings;
    }

    public void onDone(String str) {
    }

    public void onStart(String str) {
    }
}