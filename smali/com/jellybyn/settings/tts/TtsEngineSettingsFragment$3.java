package com.jellybyn.settings.tts;

import android.util.Pair;
import java.util.Comparator;

class TtsEngineSettingsFragment$3 implements Comparator<Pair<String, String>> {
    final /* synthetic */ TtsEngineSettingsFragment this$0;

    TtsEngineSettingsFragment$3(TtsEngineSettingsFragment ttsEngineSettingsFragment) {
        this.this$0 = ttsEngineSettingsFragment;
    }

    public int compare(Pair<String, String> lhs, Pair<String, String> rhs) {
        return ((String) lhs.first).compareToIgnoreCase((String) rhs.first);
    }
}