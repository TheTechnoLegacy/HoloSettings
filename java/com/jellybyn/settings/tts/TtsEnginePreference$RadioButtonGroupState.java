package com.jellybyn.settings.tts;

import android.widget.Checkable;

public interface TtsEnginePreference$RadioButtonGroupState {
    Checkable getCurrentChecked();

    String getCurrentKey();

    void setCurrentChecked(Checkable checkable);

    void setCurrentKey(String str);
}