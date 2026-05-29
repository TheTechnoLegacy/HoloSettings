package com.jellybyn.settings.tts;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class TtsEngineSettingsFragment$2 extends BroadcastReceiver {
    final /* synthetic */ TtsEngineSettingsFragment this$0;

    public void onReceive(Context context, Intent intent) {
        if ("android.speech.tts.engine.TTS_DATA_INSTALLED".equals(intent.getAction())) {
            TtsEngineSettingsFragment.access$100(this.this$0);
        }
    }

    TtsEngineSettingsFragment$2(TtsEngineSettingsFragment ttsEngineSettingsFragment) {
        this.this$0 = ttsEngineSettingsFragment;
    }
}