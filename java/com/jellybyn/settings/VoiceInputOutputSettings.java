package com.jellybyn.settings;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.provider.Settings.Secure;
import android.speech.tts.TtsEngines;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Xml;
import com.android.internal.R;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import org.xmlpull.v1.XmlPullParserException;

public class VoiceInputOutputSettings implements OnPreferenceChangeListener {
    private HashMap<String, ResolveInfo> mAvailableRecognizersMap;
    private final SettingsPreferenceFragment mFragment;
    private PreferenceGroup mParent;
    private ListPreference mRecognizerPref;
    private Preference mRecognizerSettingsPref;
    private PreferenceScreen mSettingsPref;
    private final TtsEngines mTtsEngines;
    private Preference mTtsSettingsPref;
    private PreferenceCategory mVoiceCategory;

    private void updateSettingsLink(String str) {
        ResolveInfo currentRecognizer = (ResolveInfo) this.mAvailableRecognizersMap.get(str);
        if (currentRecognizer != null) {
            ServiceInfo si = currentRecognizer.serviceInfo;
            XmlResourceParser parser = null;
            String settingsActivity = null;
            try {
                parser = si.loadXmlMetaData(this.mFragment.getPackageManager(), "android.speech");
                if (parser == null) {
                    throw new Intent("No android.speech meta-data for " + si.packageName);
                }
                Resources resourcesForApplication = this.mFragment.getPackageManager().getResourcesForApplication(si.applicationInfo);
                AttributeSet asAttributeSet = Xml.asAttributeSet(parser);
                int next;
                do {
                    next = parser.next();
                    if (next == 1) {
                        break;
                    }
                } while (next != 2);
                if ("recognition-service".equals(parser.getName())) {
                    TypedArray obtainAttributes = resourcesForApplication.obtainAttributes(asAttributeSet, R.styleable.RecognitionService);
                    settingsActivity = obtainAttributes.getString(0);
                    obtainAttributes.recycle();
                    if (parser != null) {
                        parser.close();
                    }
                    if (settingsActivity == null) {
                        Log.w("VoiceInputOutputSettings", "no recognizer settings available for " + si.packageName);
                        this.mSettingsPref.setIntent(null);
                        this.mVoiceCategory.removePreference(this.mSettingsPref);
                        return;
                    }
                    Intent i = new Intent("android.intent.action.MAIN");
                    i.setComponent(new ComponentName(si.packageName, settingsActivity));
                    this.mSettingsPref.setIntent(i);
                    this.mRecognizerPref.setSummary(currentRecognizer.loadLabel(this.mFragment.getPackageManager()));
                    return;
                }
                throw new Intent("Meta-data does not start with recognition-service tag");
            } catch (XmlPullParserException e) {
                Log.e("VoiceInputOutputSettings", "error parsing recognition service meta-data", e);
                if (parser != null) {
                    parser.close();
                }
            } catch (IOException e2) {
                Log.e("VoiceInputOutputSettings", "error parsing recognition service meta-data", e2);
                if (parser != null) {
                    parser.close();
                }
            } catch (NameNotFoundException e3) {
                Log.e("VoiceInputOutputSettings", "error parsing recognition service meta-data", e3);
                if (parser != null) {
                    parser.close();
                }
            } catch (Throwable th) {
                if (parser != null) {
                    parser.close();
                }
            }
        }
    }

    private void populateRecognizerPreference(List<ResolveInfo> recognizers) {
        int size = recognizers.size();
        CharSequence[] entries = new CharSequence[size];
        CharSequence[] values = new CharSequence[size];
        String currentSetting = Secure.getString(this.mFragment.getContentResolver(), "voice_recognition_service");
        for (int i = 0; i < size; i++) {
            ResolveInfo resolveInfo = (ResolveInfo) recognizers.get(i);
            String flattenToShortString = new ComponentName(resolveInfo.serviceInfo.packageName, resolveInfo.serviceInfo.name).flattenToShortString();
            this.mAvailableRecognizersMap.put(flattenToShortString, resolveInfo);
            entries[i] = resolveInfo.loadLabel(this.mFragment.getPackageManager());
            values[i] = flattenToShortString;
        }
        this.mRecognizerPref.setEntries(entries);
        this.mRecognizerPref.setEntryValues(values);
        this.mRecognizerPref.setDefaultValue(currentSetting);
        this.mRecognizerPref.setValue(currentSetting);
        updateSettingsLink(currentSetting);
    }

    private boolean populateOrRemoveRecognizerPrefs() {
        List<ResolveInfo> availableRecognitionServices = this.mFragment.getPackageManager().queryIntentServices(new Intent("android.speech.RecognitionService"), 128);
        int numAvailable = availableRecognitionServices.size();
        if (numAvailable == 0) {
            this.mVoiceCategory.removePreference(this.mRecognizerPref);
            this.mVoiceCategory.removePreference(this.mRecognizerSettingsPref);
            return false;
        }
        if (numAvailable == 1) {
            this.mVoiceCategory.removePreference(this.mRecognizerPref);
            ResolveInfo resolveInfo = (ResolveInfo) availableRecognitionServices.get(0);
            this.mAvailableRecognizersMap.put(new ComponentName(resolveInfo.serviceInfo.packageName, resolveInfo.serviceInfo.name).flattenToShortString(), resolveInfo);
            updateSettingsLink(Secure.getString(this.mFragment.getContentResolver(), "voice_recognition_service"));
        } else {
            populateRecognizerPreference(availableRecognitionServices);
        }
        return true;
    }

    public void onCreate() {
        this.mParent = this.mFragment.getPreferenceScreen();
        this.mVoiceCategory = (PreferenceCategory) this.mParent.findPreference("voice_category");
        this.mRecognizerPref = (ListPreference) this.mVoiceCategory.findPreference("recognizer");
        this.mRecognizerSettingsPref = this.mVoiceCategory.findPreference("recognizer_settings");
        this.mTtsSettingsPref = this.mVoiceCategory.findPreference("tts_settings");
        this.mRecognizerPref.setOnPreferenceChangeListener(this);
        this.mSettingsPref = (PreferenceScreen) this.mVoiceCategory.findPreference("recognizer_settings");
        this.mAvailableRecognizersMap = new HashMap();
        populateOrRemovePreferences();
    }

    private void populateOrRemovePreferences() {
        boolean hasRecognizerPrefs = populateOrRemoveRecognizerPrefs();
        boolean hasTtsPrefs = populateOrRemoveTtsPrefs();
        if (!hasRecognizerPrefs && !hasTtsPrefs) {
            this.mFragment.getPreferenceScreen().removePreference(this.mVoiceCategory);
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (preference == this.mRecognizerPref) {
            String str = (String) obj;
            Secure.putString(this.mFragment.getContentResolver(), "voice_recognition_service", str);
            updateSettingsLink(str);
        }
        return true;
    }

    public VoiceInputOutputSettings(SettingsPreferenceFragment settingsPreferenceFragment) {
        this.mFragment = settingsPreferenceFragment;
        this.mTtsEngines = new TtsEngines(settingsPreferenceFragment.getPreferenceScreen().getContext());
    }

    private boolean populateOrRemoveTtsPrefs() {
        if (!this.mTtsEngines.getEngines().isEmpty()) {
            return true;
        }
        this.mVoiceCategory.removePreference(this.mTtsSettingsPref);
        return false;
    }
}