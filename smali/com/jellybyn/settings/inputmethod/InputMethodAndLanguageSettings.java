package com.jellybyn.settings.inputmethod;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.hardware.input.InputManager;
import android.hardware.input.InputManager.InputDeviceListener;
import android.hardware.input.KeyboardLayout;
import android.os.Bundle;
import android.os.Handler;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.provider.Settings.System;
import android.text.TextUtils;
import android.view.InputDevice;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import com.jellybyn.settings.Settings.KeyboardLayoutPickerActivity;
import com.jellybyn.settings.Settings.SpellCheckersSettingsActivity;
import com.jellybyn.settings.SettingsPreferenceFragment;
import com.jellybyn.settings.UserDictionarySettings;
import com.jellybyn.settings.Utils;
import com.jellybyn.settings.VoiceInputOutputSettings;
import com.jellybyn.settings.inputmethod.KeyboardLayoutDialogFragment.OnSetupKeyboardLayoutsListener;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

public class InputMethodAndLanguageSettings extends SettingsPreferenceFragment implements InputDeviceListener, OnPreferenceChangeListener, OnSetupKeyboardLayoutsListener {
    private static final String[] sHardKeyboardKeys = new String[]{"auto_replace", "auto_caps", "auto_punctuate"};
    private static final String[] sSystemSettingNames = new String[]{"auto_replace", "auto_caps", "auto_punctuate"};
    private int mDefaultInputMethodSelectorVisibility = 0;
    private PreferenceCategory mGameControllerCategory;
    private Handler mHandler;
    private PreferenceCategory mHardKeyboardCategory;
    private final ArrayList<PreferenceScreen> mHardKeyboardPreferenceList = new ArrayList();
    private InputManager mIm;
    private List<InputMethodInfo> mImis;
    private InputMethodManager mImm;
    private final ArrayList<InputMethodPreference> mInputMethodPreferenceList = new ArrayList();
    private Intent mIntentWaitingForResult;
    private boolean mIsOnlyImeSettings;
    private PreferenceCategory mKeyboardSettingsCategory;
    private Preference mLanguagePref;
    private SettingsObserver mSettingsObserver;

    public void onCreate(Bundle bundle) {
        int i = 0;
        super.onCreate(bundle);
        addPreferencesFromResource(2131034131);
        try {
            this.mDefaultInputMethodSelectorVisibility = Integer.valueOf(getString(2131427333)).intValue();
        } catch (NumberFormatException e) {
        }
        if (getActivity().getAssets().getLocales().length == 1) {
            getPreferenceScreen().removePreference(findPreference("phone_language"));
        } else {
            this.mLanguagePref = findPreference("phone_language");
        }
        new VoiceInputOutputSettings(this).onCreate();
        this.mHardKeyboardCategory = (PreferenceCategory) findPreference("hard_keyboard");
        this.mKeyboardSettingsCategory = (PreferenceCategory) findPreference("keyboard_settings_category");
        this.mGameControllerCategory = (PreferenceCategory) findPreference("game_controller_settings_category");
        this.mIsOnlyImeSettings = "jellybyn.settings.INPUT_METHOD_SETTINGS".equals(getActivity().getIntent().getAction());
        getActivity().getIntent().setAction(null);
        if (this.mIsOnlyImeSettings) {
            getPreferenceScreen().removeAll();
            getPreferenceScreen().addPreference(this.mHardKeyboardCategory);
            getPreferenceScreen().addPreference(this.mKeyboardSettingsCategory);
        }
        this.mImm = (InputMethodManager) getSystemService("input_method");
        this.mImis = this.mImm.getInputMethodList();
        this.mKeyboardSettingsCategory.removeAll();
        if (!this.mIsOnlyImeSettings) {
            PreferenceScreen preferenceScreen = new PreferenceScreen(getActivity(), null);
            preferenceScreen.setKey("current_input_method");
            preferenceScreen.setTitle(getResources().getString(2131428535));
            this.mKeyboardSettingsCategory.addPreference(preferenceScreen);
        }
        this.mInputMethodPreferenceList.clear();
        int size = this.mImis == null ? 0 : this.mImis.size();
        for (int i2 = 0; i2 < size; i2++) {
            this.mInputMethodPreferenceList.add(getInputMethodPreference((InputMethodInfo) this.mImis.get(i2), size));
        }
        if (!this.mInputMethodPreferenceList.isEmpty()) {
            Collections.sort(this.mInputMethodPreferenceList);
            while (i < size) {
                this.mKeyboardSettingsCategory.addPreference((Preference) this.mInputMethodPreferenceList.get(i));
                i++;
            }
        }
        this.mIm = (InputManager) getActivity().getSystemService("input");
        updateInputDevices();
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.setClass(getActivity(), SpellCheckersSettingsActivity.class);
        SpellCheckersPreference spellCheckersPreference = (SpellCheckersPreference) findPreference("spellcheckers_settings");
        if (spellCheckersPreference != null) {
            spellCheckersPreference.setFragmentIntent(this, intent);
        }
        this.mHandler = new Handler();
        this.mSettingsObserver = new SettingsObserver(this, this.mHandler, getActivity());
    }

    private void updateHardKeyboards() {
        int i;
        this.mHardKeyboardPreferenceList.clear();
        if (getResources().getConfiguration().keyboard == 2) {
            int[] deviceIds = InputDevice.getDeviceIds();
            for (int device : deviceIds) {
                InputDevice device2 = InputDevice.getDevice(device);
                if (!(device2 == null || device2.isVirtual() || !device2.isFullKeyboard())) {
                    String descriptor = device2.getDescriptor();
                    String currentKeyboardLayoutForInputDevice = this.mIm.getCurrentKeyboardLayoutForInputDevice(descriptor);
                    KeyboardLayout keyboardLayout = currentKeyboardLayoutForInputDevice != null ? this.mIm.getKeyboardLayout(currentKeyboardLayoutForInputDevice) : null;
                    PreferenceScreen preferenceScreen = new PreferenceScreen(getActivity(), null);
                    preferenceScreen.setTitle(device2.getName());
                    if (keyboardLayout != null) {
                        preferenceScreen.setSummary(keyboardLayout.toString());
                    } else {
                        preferenceScreen.setSummary(2131428495);
                    }
                    preferenceScreen.setOnPreferenceClickListener(new 1(this, descriptor));
                    this.mHardKeyboardPreferenceList.add(preferenceScreen);
                }
            }
        }
        if (this.mHardKeyboardPreferenceList.isEmpty()) {
            getPreferenceScreen().removePreference(this.mHardKeyboardCategory);
            return;
        }
        Preference preference;
        int preferenceCount = this.mHardKeyboardCategory.getPreferenceCount();
        while (true) {
            i = preferenceCount - 1;
            if (preferenceCount <= 0) {
                break;
            }
            preference = this.mHardKeyboardCategory.getPreference(i);
            if (preference.getOrder() < 1000) {
                this.mHardKeyboardCategory.removePreference(preference);
            }
            preferenceCount = i;
        }
        Collections.sort(this.mHardKeyboardPreferenceList);
        int size = this.mHardKeyboardPreferenceList.size();
        for (i = 0; i < size; i++) {
            preference = (Preference) this.mHardKeyboardPreferenceList.get(i);
            preference.setOrder(i);
            this.mHardKeyboardCategory.addPreference(preference);
        }
        getPreferenceScreen().addPreference(this.mHardKeyboardCategory);
    }

    public void onResume() {
        super.onResume();
        this.mSettingsObserver.resume();
        this.mIm.registerInputDeviceListener(this, null);
        if (!this.mIsOnlyImeSettings) {
            if (this.mLanguagePref != null) {
                String str;
                Configuration configuration = getResources().getConfiguration();
                String language = configuration.locale.getLanguage();
                if (language.equals("zz")) {
                    String country = configuration.locale.getCountry();
                    str = country.equals("ZZ") ? "[Developer] Accented English (zz_ZZ)" : country.equals("ZY") ? "[Developer] Fake Bi-Directional (zz_ZY)" : "";
                } else {
                    str = hasOnlyOneLanguageInstance(language, Resources.getSystem().getAssets().getLocales()) ? configuration.locale.getDisplayLanguage(configuration.locale) : configuration.locale.getDisplayName(configuration.locale);
                }
                if (str.length() > 1) {
                    this.mLanguagePref.setSummary(Character.toUpperCase(str.charAt(0)) + str.substring(1));
                }
            }
            updateUserDictionaryPreference(findPreference("key_user_dictionary_settings"));
        }
        if (!this.mHardKeyboardPreferenceList.isEmpty()) {
            for (int i = 0; i < sHardKeyboardKeys.length; i++) {
                ((CheckBoxPreference) this.mHardKeyboardCategory.findPreference(sHardKeyboardKeys[i])).setChecked(System.getInt(getContentResolver(), sSystemSettingNames[i], 1) > 0);
            }
        }
        updateInputDevices();
        InputMethodAndSubtypeUtil.loadInputMethodSubtypeList(this, getContentResolver(), this.mImis, null);
        updateActiveInputMethodsSummary();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        int i = 0;
        if (Utils.isMonkeyRunning()) {
            return false;
        }
        if (preference instanceof PreferenceScreen) {
            if (preference.getFragment() == null && "current_input_method".equals(preference.getKey())) {
                ((InputMethodManager) getSystemService("input_method")).showInputMethodPicker();
            }
        } else if (preference instanceof CheckBoxPreference) {
            ContentResolver contentResolver;
            String str;
            Preference chkPref = (CheckBoxPreference) preference;
            if (!this.mHardKeyboardPreferenceList.isEmpty()) {
                for (int i2 = 0; i2 < sHardKeyboardKeys.length; i2++) {
                    if (chkPref == this.mHardKeyboardCategory.findPreference(sHardKeyboardKeys[i2])) {
                        contentResolver = getContentResolver();
                        str = sSystemSettingNames[i2];
                        if (chkPref.isChecked()) {
                            i = 1;
                        }
                        System.putInt(contentResolver, str, i);
                        return true;
                    }
                }
            }
            if (chkPref == this.mGameControllerCategory.findPreference("vibrate_input_devices")) {
                contentResolver = getContentResolver();
                str = "vibrate_input_devices";
                if (chkPref.isChecked()) {
                    i = 1;
                }
                System.putInt(contentResolver, str, i);
                return true;
            }
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    private void updateUserDictionaryPreference(Preference preference) {
        TreeSet userDictionaryLocalesSet = UserDictionaryList.getUserDictionaryLocalesSet(getActivity());
        if (userDictionaryLocalesSet == null) {
            getPreferenceScreen().removePreference(preference);
        } else if (userDictionaryLocalesSet.size() <= 1) {
            Intent intent = new Intent("jellybyn.settings.USER_DICTIONARY_SETTINGS");
            preference.setTitle(2131428498);
            preference.setIntent(intent);
            preference.setFragment(UserDictionarySettings.class.getName());
            if (userDictionaryLocalesSet.size() == 1) {
                preference.getExtras().putString("locale", (String) userDictionaryLocalesSet.toArray()[0]);
            }
        } else {
            preference.setTitle(2131428499);
            preference.setFragment(UserDictionaryList.class.getName());
        }
    }

    private InputMethodPreference getInputMethodPreference(InputMethodInfo inputMethodInfo, int i) {
        Intent intent;
        CharSequence label = inputMethodInfo.loadLabel(getPackageManager());
        String settingsActivity = inputMethodInfo.getSettingsActivity();
        if (TextUtils.isEmpty(settingsActivity)) {
            intent = null;
        } else {
            intent = new Intent("android.intent.action.MAIN");
            intent.setClassName(inputMethodInfo.getPackageName(), settingsActivity);
        }
        InputMethodPreference inputMethodPreference = new InputMethodPreference(this, intent, this.mImm, inputMethodInfo, i);
        inputMethodPreference.setKey(inputMethodInfo.getId());
        inputMethodPreference.setTitle(label);
        return inputMethodPreference;
    }

    private void updateCurrentImeName() {
        Context context = getActivity();
        if (context != null && this.mImm != null) {
            Preference curPref = getPreferenceScreen().findPreference("current_input_method");
            if (curPref != null) {
                CharSequence curIme = InputMethodAndSubtypeUtil.getCurrentInputMethodName(context, getContentResolver(), this.mImm, this.mImis, getPackageManager());
                if (!TextUtils.isEmpty(curIme)) {
                    synchronized (this) {
                        curPref.setSummary(curIme);
                    }
                }
            }
        }
    }

    private boolean hasOnlyOneLanguageInstance(String str, String[] strArr) {
        boolean z = true;
        int count = 0;
        for (String str2 : strArr) {
            if (str2.length() > 2 && str2.startsWith(str)) {
                count++;
                if (count > 1) {
                    return false;
                }
            }
        }
        if (count != 1) {
            z = false;
        }
        return z;
    }

    private boolean haveInputDeviceWithVibrator() {
        int[] devices = InputDevice.getDeviceIds();
        for (int device : devices) {
            InputDevice device2 = InputDevice.getDevice(device);
            if (device2 != null && !device2.isVirtual() && device2.getVibrator().hasVibrator()) {
                return true;
            }
        }
        return false;
    }

    private void updateGameControllers() {
        boolean z = true;
        if (haveInputDeviceWithVibrator()) {
            getPreferenceScreen().addPreference(this.mGameControllerCategory);
            CheckBoxPreference checkBoxPreference = (CheckBoxPreference) this.mGameControllerCategory.findPreference("vibrate_input_devices");
            if (System.getInt(getContentResolver(), "vibrate_input_devices", 1) <= 0) {
                z = false;
            }
            checkBoxPreference.setChecked(z);
            return;
        }
        getPreferenceScreen().removePreference(this.mGameControllerCategory);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (this.mIntentWaitingForResult != null) {
            String stringExtra = this.mIntentWaitingForResult.getStringExtra("input_device_descriptor");
            this.mIntentWaitingForResult = null;
            showKeyboardLayoutDialog(stringExtra);
        }
    }

    public void onPause() {
        super.onPause();
        this.mIm.unregisterInputDeviceListener(this);
        this.mSettingsObserver.pause();
        InputMethodAndSubtypeUtil.saveInputMethodSubtypeList(this, getContentResolver(), this.mImis, !this.mHardKeyboardPreferenceList.isEmpty());
    }

    public void onSetupKeyboardLayouts(String str) {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.setClass(getActivity(), KeyboardLayoutPickerActivity.class);
        intent.putExtra("input_device_descriptor", str);
        this.mIntentWaitingForResult = intent;
        startActivityForResult(intent, 0);
    }

    private void updateActiveInputMethodsSummary() {
        Iterator i$ = this.mInputMethodPreferenceList.iterator();
        while (i$.hasNext()) {
            InputMethodPreference inputMethodPreference = (InputMethodPreference) i$.next();
            if (inputMethodPreference instanceof InputMethodPreference) {
                inputMethodPreference.updateSummary();
            }
        }
        updateCurrentImeName();
    }

    private void showKeyboardLayoutDialog(String str) {
        KeyboardLayoutDialogFragment fragment = new Intent(str);
        fragment.setTargetFragment(this, 0);
        fragment.show(getActivity().getFragmentManager(), "keyboardLayout");
    }

    private void updateInputDevices() {
        updateHardKeyboards();
        updateGameControllers();
    }

    public void onInputDeviceAdded(int i) {
        updateInputDevices();
    }

    public void onInputDeviceChanged(int i) {
        updateInputDevices();
    }

    public void onInputDeviceRemoved(int i) {
        updateInputDevices();
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        return false;
    }
}