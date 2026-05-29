package com.jellybyn.settings.tts;

import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;

class TtsEnginePreference$3 implements OnClickListener {
    final /* synthetic */ TtsEnginePreference this$0;

    public void onClick(View view) {
        Bundle bundle = new Bundle();
        bundle.putString("name", TtsEnginePreference.access$100(this.this$0).name);
        bundle.putString("label", TtsEnginePreference.access$100(this.this$0).label);
        if (TtsEnginePreference.access$200(this.this$0) != null) {
            bundle.putParcelable("voices", TtsEnginePreference.access$200(this.this$0));
        }
        TtsEnginePreference.access$300(this.this$0).startPreferencePanel(TtsEngineSettingsFragment.class.getName(), bundle, 0, TtsEnginePreference.access$100(this.this$0).label, null, 0);
    }

    TtsEnginePreference$3(TtsEnginePreference ttsEnginePreference) {
        this.this$0 = ttsEnginePreference;
    }
}