package com.jellybyn.settings.tts;

import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceScreen;
import android.speech.tts.TextToSpeech;
import android.speech.tts.TextToSpeech.OnInitListener;
import android.speech.tts.TtsEngines;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.jellybyn.settings.SettingsPreferenceFragment;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Locale;

public class TtsEngineSettingsFragment extends SettingsPreferenceFragment implements OnPreferenceChangeListener, OnPreferenceClickListener {
    private Intent mEngineSettingsIntent;
    private Preference mEngineSettingsPreference;
    private TtsEngines mEnginesHelper;
    private Preference mInstallVoicesPreference;
    private final BroadcastReceiver mLanguagesChangedReceiver = new 2(this);
    private ListPreference mLocalePreference;
    private TextToSpeech mTts;
    private final OnInitListener mTtsInitListener = new 1(this);
    private Intent mVoiceDataDetails;

    private void updateDefaultLocalePref(ArrayList<String> availableLangs) {
        int i;
        String currentLocale = this.mEnginesHelper.getLocalePrefForEngine(getEngineName());
        ArrayList<Pair<String, String>> entryPairs = new ArrayList(availableLangs.size());
        for (i = 0; i < availableLangs.size(); i++) {
            String[] split = ((String) availableLangs.get(i)).split("-");
            Locale locale = null;
            if (split.length == 1) {
                locale = new Intent(split[0]);
            } else if (split.length == 2) {
                locale = new Locale(split[0], split[1]);
            } else if (split.length == 3) {
                locale = new Locale(split[0], split[1], split[2]);
            }
            if (locale != null) {
                entryPairs.add(new Pair(locale.getDisplayName(), availableLangs.get(i)));
            }
        }
        Collections.sort(entryPairs, new 3(this));
        int selectedLanguageIndex = -1;
        CharSequence[] entries = new CharSequence[availableLangs.size()];
        CharSequence[] entryValues = new CharSequence[availableLangs.size()];
        i = 0;
        Iterator i$ = entryPairs.iterator();
        while (i$.hasNext()) {
            Pair pair = (Pair) i$.next();
            if (((String) pair.second).equalsIgnoreCase(currentLocale)) {
                selectedLanguageIndex = i;
            }
            entries[i] = (CharSequence) pair.first;
            int i2 = i + 1;
            entryValues[i] = (CharSequence) pair.second;
            i = i2;
        }
        this.mLocalePreference.setEntries(entries);
        this.mLocalePreference.setEntryValues(entryValues);
        if (selectedLanguageIndex > -1) {
            this.mLocalePreference.setValueIndex(selectedLanguageIndex);
            return;
        }
        this.mLocalePreference.setValueIndex(0);
        updateLanguageTo((String) availableLangs.get(0));
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034157);
        this.mEnginesHelper = new TtsEngines(getActivity());
        PreferenceScreen root = getPreferenceScreen();
        this.mLocalePreference = (ListPreference) root.findPreference("tts_default_lang");
        this.mLocalePreference.setOnPreferenceChangeListener(this);
        this.mEngineSettingsPreference = root.findPreference("tts_engine_settings");
        this.mEngineSettingsPreference.setOnPreferenceClickListener(this);
        this.mInstallVoicesPreference = root.findPreference("tts_install_data");
        this.mInstallVoicesPreference.setOnPreferenceClickListener(this);
        root.removePreference(this.mInstallVoicesPreference);
        root.removePreference(this.mLocalePreference);
        root.setTitle(getEngineLabel());
        root.setKey(getEngineName());
        this.mEngineSettingsPreference.setTitle(getResources().getString(2131428728, new Object[]{getEngineLabel()}));
        this.mEngineSettingsIntent = this.mEnginesHelper.getSettingsIntent(getEngineName());
        if (this.mEngineSettingsIntent == null) {
            this.mEngineSettingsPreference.setEnabled(false);
        }
        this.mInstallVoicesPreference.setEnabled(false);
        this.mLocalePreference.setEnabled(false);
        this.mLocalePreference.setEntries(new CharSequence[0]);
        this.mLocalePreference.setEntryValues(new CharSequence[0]);
        this.mVoiceDataDetails = (Intent) getArguments().getParcelable("voices");
        this.mTts = new TextToSpeech(getActivity().getApplicationContext(), this.mTtsInitListener, getEngineName());
        checkTtsData();
        getActivity().registerReceiver(this.mLanguagesChangedReceiver, new Intent("android.speech.tts.engine.TTS_DATA_INSTALLED"));
    }

    private void updateVoiceDetails() {
        ArrayList<String> available = this.mVoiceDataDetails.getStringArrayListExtra("availableVoices");
        ArrayList<String> unavailable = this.mVoiceDataDetails.getStringArrayListExtra("unavailableVoices");
        if (available == null) {
            Log.e("TtsEngineSettings", "TTS data check failed (available == null).");
            this.mLocalePreference.setEnabled(false);
            getPreferenceScreen().removePreference(this.mLocalePreference);
            return;
        }
        if (unavailable == null || unavailable.size() <= 0) {
            getPreferenceScreen().removePreference(this.mInstallVoicesPreference);
        } else {
            this.mInstallVoicesPreference.setEnabled(true);
            getPreferenceScreen().addPreference(this.mInstallVoicesPreference);
        }
        if (available.size() > 0) {
            this.mLocalePreference.setEnabled(true);
            getPreferenceScreen().addPreference(this.mLocalePreference);
            updateDefaultLocalePref(available);
            return;
        }
        this.mLocalePreference.setEnabled(false);
        getPreferenceScreen().removePreference(this.mLocalePreference);
    }

    private void installVoiceData() {
        if (!TextUtils.isEmpty(getEngineName())) {
            Intent intent = new Intent("android.speech.tts.engine.INSTALL_TTS_DATA");
            intent.addFlags(268435456);
            intent.setPackage(getEngineName());
            try {
                Log.v("TtsEngineSettings", "Installing voice data: " + intent.toUri(0));
                startActivity(intent);
            } catch (ActivityNotFoundException e) {
                Log.e("TtsEngineSettings", "Failed to install TTS data, no acitivty found for " + intent + ")");
            }
        }
    }

    private final void checkTtsData() {
        Intent intent = new Intent("android.speech.tts.engine.CHECK_TTS_DATA");
        intent.setPackage(getEngineName());
        try {
            startActivityForResult(intent, 1977);
        } catch (ActivityNotFoundException e) {
            Log.e("TtsEngineSettings", "Failed to check TTS data, no activity found for " + intent + ")");
        }
    }

    private void updateLanguageTo(String str) {
        this.mEnginesHelper.updateLocalePrefForEngine(getEngineName(), str);
        if (getEngineName().equals(this.mTts.getCurrentEngine())) {
            String[] parseLocalePref = TtsEngines.parseLocalePref(str);
            if (parseLocalePref != null) {
                this.mTts.setLanguage(new Locale(parseLocalePref[0], parseLocalePref[1], parseLocalePref[2]));
            }
        }
    }

    public boolean onPreferenceClick(Preference preference) {
        if (preference == this.mInstallVoicesPreference) {
            installVoiceData();
            return true;
        } else if (preference != this.mEngineSettingsPreference) {
            return false;
        } else {
            startActivity(this.mEngineSettingsIntent);
            return true;
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 1977) {
            this.mVoiceDataDetails = intent;
            updateVoiceDetails();
        }
    }

    public void onDestroy() {
        getActivity().unregisterReceiver(this.mLanguagesChangedReceiver);
        this.mTts.shutdown();
        super.onDestroy();
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (preference != this.mLocalePreference) {
            return false;
        }
        updateLanguageTo((String) obj);
        return true;
    }

    private String getEngineLabel() {
        return getArguments().getString("label");
    }

    private String getEngineName() {
        return getArguments().getString("name");
    }
}