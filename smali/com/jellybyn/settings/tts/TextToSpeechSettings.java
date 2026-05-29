package com.jellybyn.settings.tts;

import android.app.AlertDialog.Builder;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;
import android.provider.Settings.Secure;
import android.provider.Settings.SettingNotFoundException;
import android.speech.tts.TextToSpeech;
import android.speech.tts.TextToSpeech.EngineInfo;
import android.speech.tts.TextToSpeech.OnInitListener;
import android.speech.tts.TtsEngines;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Checkable;
import com.jellybyn.settings.SettingsPreferenceFragment;
import com.jellybyn.settings.tts.TtsEnginePreference.RadioButtonGroupState;
import java.util.HashMap;
import java.util.Locale;
import java.util.Set;

public class TextToSpeechSettings extends SettingsPreferenceFragment implements OnPreferenceChangeListener, OnPreferenceClickListener, RadioButtonGroupState {
    private Checkable mCurrentChecked;
    private String mCurrentEngine;
    private int mDefaultRate = 100;
    private ListPreference mDefaultRatePref;
    private PreferenceCategory mEnginePreferenceCategory;
    private TtsEngines mEnginesHelper = null;
    private final OnInitListener mInitListener = new 1(this);
    private Preference mPlayExample;
    private String mPreviousEngine;
    private TextToSpeech mTts = null;
    private final OnInitListener mUpdateListener = new 2(this);

    private void initSettings() {
        try {
            this.mDefaultRate = Secure.getInt(getContentResolver(), "tts_default_rate");
        } catch (SettingNotFoundException e) {
            this.mDefaultRate = 100;
        }
        this.mDefaultRatePref.setValue(String.valueOf(this.mDefaultRate));
        this.mDefaultRatePref.setOnPreferenceChangeListener(this);
        this.mCurrentEngine = this.mTts.getCurrentEngine();
        if (getActivity() instanceof PreferenceActivity) {
            PreferenceActivity preferenceActivity = (PreferenceActivity) getActivity();
            this.mEnginePreferenceCategory.removeAll();
            for (EngineInfo ttsEnginePreference : this.mEnginesHelper.getEngines()) {
                this.mEnginePreferenceCategory.addPreference(new TtsEnginePreference(getActivity(), ttsEnginePreference, this, preferenceActivity));
            }
            checkVoiceData(this.mCurrentEngine);
            return;
        }
        throw new Intent("TextToSpeechSettings used outside a PreferenceActivity");
    }

    private void onVoiceDataIntegrityCheckDone(Intent intent) {
        String engine = this.mTts.getCurrentEngine();
        if (engine == null) {
            Log.e("TextToSpeechSettings", "Voice data check complete, but no engine bound");
        } else if (intent == null) {
            Log.e("TextToSpeechSettings", "Engine failed voice data integrity check (null return)" + this.mTts.getCurrentEngine());
        } else {
            Secure.putString(getContentResolver(), "tts_default_synth", engine);
            int engineCount = this.mEnginePreferenceCategory.getPreferenceCount();
            for (int i = 0; i < engineCount; i++) {
                Preference p = this.mEnginePreferenceCategory.getPreference(i);
                if (p instanceof TtsEnginePreference) {
                    TtsEnginePreference ttsEnginePreference = (TtsEnginePreference) p;
                    if (ttsEnginePreference.getKey().equals(engine)) {
                        ttsEnginePreference.setVoiceDataDetails(intent);
                        break;
                    }
                }
            }
            updateWidgetState(true);
        }
    }

    private void getSampleText() {
        String currentEngine = this.mTts.getCurrentEngine();
        if (TextUtils.isEmpty(currentEngine)) {
            currentEngine = this.mTts.getDefaultEngine();
        }
        Locale defaultLocale = this.mTts.getDefaultLanguage();
        if (defaultLocale == null) {
            Log.e("TextToSpeechSettings", "Failed to get default language from engine " + currentEngine);
            return;
        }
        this.mTts.setLanguage(defaultLocale);
        Intent intent = new Intent("android.speech.tts.engine.GET_SAMPLE_TEXT");
        intent.putExtra("language", defaultLocale.getLanguage());
        intent.putExtra("country", defaultLocale.getCountry());
        intent.putExtra("variant", defaultLocale.getVariant());
        intent.setPackage(currentEngine);
        try {
            startActivityForResult(intent, 1983);
        } catch (ActivityNotFoundException e) {
            Log.e("TextToSpeechSettings", "Failed to get sample text, no activity found for " + intent + ")");
        }
    }

    private void onSampleTextReceived(int i, Intent intent) {
        String sample = getDefaultSampleString();
        if (!(i != 0 || intent == null || intent == null || intent.getStringExtra("sampleText") == null)) {
            sample = intent.getStringExtra("sampleText");
        }
        if (sample == null || this.mTts == null) {
            Log.e("TextToSpeechSettings", "Did not have a sample string for the requested language");
            return;
        }
        boolean isNetworkRequiredForSynthesis = isNetworkRequiredForSynthesis();
        if (!isNetworkRequiredForSynthesis || (isNetworkRequiredForSynthesis && this.mTts.isLanguageAvailable(this.mTts.getLanguage()) >= 0)) {
            HashMap hashMap = new HashMap();
            hashMap.put("utteranceId", "Sample");
            this.mTts.speak(sample, 0, hashMap);
            return;
        }
        Log.w("TextToSpeechSettings", "Network required for sample synthesis for requested language");
        displayNetworkAlert();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034158);
        getActivity().setVolumeControlStream(3);
        this.mPlayExample = findPreference("tts_play_example");
        this.mPlayExample.setOnPreferenceClickListener(this);
        this.mEnginePreferenceCategory = (PreferenceCategory) findPreference("tts_engine_preference_section");
        this.mDefaultRatePref = (ListPreference) findPreference("tts_default_rate");
        this.mTts = new TextToSpeech(getActivity().getApplicationContext(), this.mInitListener);
        this.mEnginesHelper = new TtsEngines(getActivity().getApplicationContext());
        setTtsUtteranceProgressListener();
        initSettings();
    }

    private String getDefaultSampleString() {
        if (!(this.mTts == null || this.mTts.getLanguage() == null)) {
            String iSO3Language = this.mTts.getLanguage().getISO3Language();
            String[] stringArray = getActivity().getResources().getStringArray(2131165198);
            String[] stringArray2 = getActivity().getResources().getStringArray(2131165199);
            for (int i = 0; i < stringArray.length; i++) {
                if (stringArray2[i].equals(iSO3Language)) {
                    return stringArray[i];
                }
            }
        }
        return null;
    }

    private void updateDefaultEngine(String str) {
        updateWidgetState(false);
        this.mPreviousEngine = this.mTts.getCurrentEngine();
        if (this.mTts != null) {
            try {
                this.mTts.shutdown();
                this.mTts = null;
            } catch (Exception e) {
                Log.e("TextToSpeechSettings", "Error shutting down TTS engine" + e);
            }
        }
        this.mTts = new TextToSpeech(getActivity().getApplicationContext(), this.mUpdateListener, str);
        setTtsUtteranceProgressListener();
    }

    private void displayNetworkAlert() {
        Builder builder = new Builder(getActivity());
        builder.setTitle(17039380);
        builder.setIconAttribute(16843605);
        builder.setMessage(getActivity().getString(2131428722));
        builder.setCancelable(false);
        builder.setPositiveButton(17039370, null);
        builder.create().show();
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if ("tts_default_rate".equals(preference.getKey())) {
            this.mDefaultRate = Integer.parseInt((String) obj);
            try {
                Secure.putInt(getContentResolver(), "tts_default_rate", this.mDefaultRate);
                if (this.mTts != null) {
                    this.mTts.setSpeechRate(((float) this.mDefaultRate) / 100.0f);
                }
            } catch (NumberFormatException e) {
                Log.e("TextToSpeechSettings", "could not persist default TTS rate setting", e);
            }
        }
        return true;
    }

    public void onUpdateEngine(int i) {
        if (i == 0) {
            checkVoiceData(this.mTts.getCurrentEngine());
            return;
        }
        if (this.mPreviousEngine != null) {
            this.mTts = new TextToSpeech(getActivity().getApplicationContext(), this.mInitListener, this.mPreviousEngine);
            setTtsUtteranceProgressListener();
        }
        this.mPreviousEngine = null;
    }

    private void checkVoiceData(String str) {
        Intent intent = new Intent("android.speech.tts.engine.CHECK_TTS_DATA");
        intent.setPackage(str);
        try {
            startActivityForResult(intent, 1977);
        } catch (ActivityNotFoundException e) {
            Log.e("TextToSpeechSettings", "Failed to check TTS data, no activity found for " + intent + ")");
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 1983) {
            onSampleTextReceived(i2, intent);
        } else if (i == 1977) {
            onVoiceDataIntegrityCheckDone(intent);
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mTts != null) {
            this.mTts.shutdown();
            this.mTts = null;
        }
    }

    public void onInitEngine(int i) {
        if (i == 0) {
            updateWidgetState(true);
        } else {
            updateWidgetState(false);
        }
    }

    public boolean onPreferenceClick(Preference preference) {
        if (preference != this.mPlayExample) {
            return false;
        }
        getSampleText();
        return true;
    }

    private void setTtsUtteranceProgressListener() {
        if (this.mTts != null) {
            this.mTts.setOnUtteranceProgressListener(new 3(this));
        }
    }

    private void updateWidgetState(boolean z) {
        this.mPlayExample.setEnabled(z);
        this.mDefaultRatePref.setEnabled(z);
    }

    public void setCurrentKey(String str) {
        this.mCurrentEngine = str;
        updateDefaultEngine(this.mCurrentEngine);
    }

    private boolean isNetworkRequiredForSynthesis() {
        Set<String> features = this.mTts.getFeatures(this.mTts.getLanguage());
        return features.contains("networkTts") && !features.contains("embeddedTts");
    }

    public void setCurrentChecked(Checkable checkable) {
        this.mCurrentChecked = checkable;
    }

    public Checkable getCurrentChecked() {
        return this.mCurrentChecked;
    }

    public String getCurrentKey() {
        return this.mCurrentEngine;
    }
}