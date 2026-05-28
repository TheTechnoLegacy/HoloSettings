package com.jellybyn.settings.inputmethod;

import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources.NotFoundException;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.provider.Settings.Secure;
import android.provider.Settings.SettingNotFoundException;
import android.text.TextUtils;
import android.text.TextUtils.SimpleStringSplitter;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;
import com.jellybyn.settings.SettingsPreferenceFragment;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class InputMethodAndSubtypeUtil {
    private static final Locale ENGLISH_LOCALE = new Locale("en");
    private static final SimpleStringSplitter sStringInputMethodSplitter = new SimpleStringSplitter(':');
    private static final SimpleStringSplitter sStringInputMethodSubtypeSplitter = new SimpleStringSplitter(';');

    public static void saveInputMethodSubtypeList(SettingsPreferenceFragment settingsPreferenceFragment, ContentResolver contentResolver, List<InputMethodInfo> inputMethodInfos, boolean z) {
        String currentInputMethodId = Secure.getString(contentResolver, "default_input_method");
        int selectedInputMethodSubtype = getInputMethodSubtypeSelected(contentResolver);
        HashMap<String, HashSet<String>> enabledIMEAndSubtypesMap = getEnabledInputMethodsAndSubtypeList(contentResolver);
        HashSet<String> disabledSystemIMEs = getDisabledSystemIMEs(contentResolver);
        int imiCount = inputMethodInfos.size();
        boolean needsToResetSelectedSubtype = false;
        for (InputMethodInfo inputMethodInfo : inputMethodInfos) {
            String id = inputMethodInfo.getId();
            Preference findPreference = settingsPreferenceFragment.findPreference(id);
            if (findPreference != null) {
                boolean isChecked = findPreference instanceof CheckBoxPreference ? ((CheckBoxPreference) findPreference).isChecked() : enabledIMEAndSubtypesMap.containsKey(id);
                boolean equals = id.equals(currentInputMethodId);
                boolean isSystemIme = isSystemIme(inputMethodInfo);
                if ((z || !isAlwaysCheckedIme(inputMethodInfo, settingsPreferenceFragment.getActivity(), imiCount)) && !isChecked) {
                    enabledIMEAndSubtypesMap.remove(id);
                    if (equals) {
                        currentInputMethodId = null;
                    }
                } else {
                    if (!enabledIMEAndSubtypesMap.containsKey(id)) {
                        enabledIMEAndSubtypesMap.put(id, new HashSet());
                    }
                    HashSet hashSet = (HashSet) enabledIMEAndSubtypesMap.get(id);
                    Object obj = null;
                    int subtypeCount = inputMethodInfo.getSubtypeCount();
                    for (int i = 0; i < subtypeCount; i++) {
                        InputMethodSubtype subtypeAt = inputMethodInfo.getSubtypeAt(i);
                        String valueOf = String.valueOf(subtypeAt.hashCode());
                        CheckBoxPreference checkBoxPreference = (CheckBoxPreference) settingsPreferenceFragment.findPreference(id + valueOf);
                        if (checkBoxPreference != null) {
                            if (obj == null) {
                                hashSet.clear();
                                needsToResetSelectedSubtype = true;
                                obj = 1;
                            }
                            if (checkBoxPreference.isChecked()) {
                                hashSet.add(valueOf);
                                if (equals && selectedInputMethodSubtype == subtypeAt.hashCode()) {
                                    needsToResetSelectedSubtype = false;
                                }
                            } else {
                                hashSet.remove(valueOf);
                            }
                        }
                    }
                }
                if (isSystemIme && z) {
                    if (disabledSystemIMEs.contains(id)) {
                        if (isChecked) {
                            disabledSystemIMEs.remove(id);
                        }
                    } else if (!isChecked) {
                        disabledSystemIMEs.add(id);
                    }
                }
            }
        }
        StringBuilder builder = new StringBuilder();
        buildInputMethodsAndSubtypesString(builder, enabledIMEAndSubtypesMap);
        StringBuilder disabledSysImesBuilder = new StringBuilder();
        buildDisabledSystemInputMethods(disabledSysImesBuilder, disabledSystemIMEs);
        if (needsToResetSelectedSubtype || !isInputMethodSubtypeSelected(contentResolver)) {
            putSelectedInputMethodSubtype(contentResolver, -1);
        }
        Secure.putString(contentResolver, "enabled_input_methods", builder.toString());
        if (disabledSysImesBuilder.length() > 0) {
            Secure.putString(contentResolver, "disabled_system_input_methods", disabledSysImesBuilder.toString());
        }
        String str = "default_input_method";
        if (currentInputMethodId == null) {
            currentInputMethodId = "";
        }
        Secure.putString(contentResolver, str, currentInputMethodId);
    }

    private static HashMap<String, HashSet<String>> getEnabledInputMethodsAndSubtypeList(ContentResolver contentResolver) {
        String enabledInputMethodsStr = Secure.getString(contentResolver, "enabled_input_methods");
        HashMap<String, HashSet<String>> imsList = new HashMap();
        if (!TextUtils.isEmpty(enabledInputMethodsStr)) {
            sStringInputMethodSplitter.setString(enabledInputMethodsStr);
            while (sStringInputMethodSplitter.hasNext()) {
                sStringInputMethodSubtypeSplitter.setString(sStringInputMethodSplitter.next());
                if (sStringInputMethodSubtypeSplitter.hasNext()) {
                    HashSet<String> subtypeHashes = new HashSet();
                    String imeId = sStringInputMethodSubtypeSplitter.next();
                    while (sStringInputMethodSubtypeSplitter.hasNext()) {
                        subtypeHashes.add(sStringInputMethodSubtypeSplitter.next());
                    }
                    imsList.put(imeId, subtypeHashes);
                }
            }
        }
        return imsList;
    }

    public static void loadInputMethodSubtypeList(SettingsPreferenceFragment settingsPreferenceFragment, ContentResolver contentResolver, List<InputMethodInfo> inputMethodInfos, Map<String, List<Preference>> inputMethodPrefsMap) {
        HashMap<String, HashSet<String>> enabledSubtypes = getEnabledInputMethodsAndSubtypeList(contentResolver);
        for (InputMethodInfo id : inputMethodInfos) {
            String id2 = id.getId();
            Preference findPreference = settingsPreferenceFragment.findPreference(id2);
            if (findPreference != null && (findPreference instanceof CheckBoxPreference)) {
                CheckBoxPreference checkBoxPreference = (CheckBoxPreference) findPreference;
                boolean containsKey = enabledSubtypes.containsKey(id2);
                checkBoxPreference.setChecked(containsKey);
                if (inputMethodPrefsMap != null) {
                    for (Preference enabled : (List) inputMethodPrefsMap.get(id2)) {
                        enabled.setEnabled(containsKey);
                    }
                }
                setSubtypesPreferenceEnabled(settingsPreferenceFragment, inputMethodInfos, id2, containsKey);
            }
        }
        updateSubtypesPreferenceChecked(settingsPreferenceFragment, inputMethodInfos, enabledSubtypes);
    }

    public static void updateSubtypesPreferenceChecked(SettingsPreferenceFragment settingsPreferenceFragment, List<InputMethodInfo> inputMethodProperties, HashMap<String, HashSet<String>> enabledSubtypes) {
        PreferenceScreen preferenceScreen = settingsPreferenceFragment.getPreferenceScreen();
        for (InputMethodInfo imi : inputMethodProperties) {
            String id = imi.getId();
            if (enabledSubtypes.containsKey(id)) {
                HashSet<String> enabledSubtypesSet = (HashSet) enabledSubtypes.get(id);
                int subtypeCount = imi.getSubtypeCount();
                for (int i = 0; i < subtypeCount; i++) {
                    String hashCode = String.valueOf(imi.getSubtypeAt(i).hashCode());
                    CheckBoxPreference pref = (CheckBoxPreference) preferenceScreen.findPreference(id + hashCode);
                    if (pref != null) {
                        pref.setChecked(enabledSubtypesSet.contains(hashCode));
                    }
                }
            } else {
                return;
            }
        }
    }

    public static CharSequence getCurrentInputMethodName(Context context, ContentResolver contentResolver, InputMethodManager inputMethodManager, List<InputMethodInfo> imis, PackageManager packageManager) {
        CharSequence charSequence = null;
        if (!(contentResolver == null || imis == null)) {
            String currentInputMethodId = Secure.getString(contentResolver, "default_input_method");
            if (!TextUtils.isEmpty(currentInputMethodId)) {
                for (InputMethodInfo imi : imis) {
                    if (currentInputMethodId.equals(imi.getId())) {
                        InputMethodSubtype subtype = inputMethodManager.getCurrentInputMethodSubtype();
                        CharSequence imiLabel = imi.loadLabel(packageManager);
                        if (subtype != null) {
                            CharSequence[] charSequenceArr = new CharSequence[2];
                            charSequenceArr[0] = subtype.getDisplayName(context, imi.getPackageName(), imi.getServiceInfo().applicationInfo);
                            charSequenceArr[1] = TextUtils.isEmpty(imiLabel) ? "" : " - " + imiLabel;
                            charSequence = TextUtils.concat(charSequenceArr);
                        } else {
                            charSequence = imiLabel;
                        }
                    }
                }
            }
        }
        return charSequence;
    }

    public static void setSubtypesPreferenceEnabled(SettingsPreferenceFragment settingsPreferenceFragment, List<InputMethodInfo> inputMethodProperties, String str, boolean z) {
        PreferenceScreen preferenceScreen = settingsPreferenceFragment.getPreferenceScreen();
        for (InputMethodInfo inputMethodInfo : inputMethodProperties) {
            if (str.equals(inputMethodInfo.getId())) {
                int subtypeCount = inputMethodInfo.getSubtypeCount();
                for (int i = 0; i < subtypeCount; i++) {
                    CheckBoxPreference checkBoxPreference = (CheckBoxPreference) preferenceScreen.findPreference(str + inputMethodInfo.getSubtypeAt(i).hashCode());
                    if (checkBoxPreference != null) {
                        checkBoxPreference.setEnabled(z);
                    }
                }
            }
        }
    }

    public static boolean isAlwaysCheckedIme(InputMethodInfo inputMethodInfo, Context context, int i) {
        if (i <= 1) {
            return true;
        }
        if (!isSystemIme(inputMethodInfo)) {
            return false;
        }
        if (isAuxiliaryIme(inputMethodInfo)) {
            return false;
        }
        return !isValidDefaultIme(inputMethodInfo, context) ? containsSubtypeOf(inputMethodInfo, ENGLISH_LOCALE.getLanguage()) : true;
    }

    public static void buildDisabledSystemInputMethods(StringBuilder stringBuilder, HashSet<String> imes) {
        boolean needsAppendSeparator = false;
        Iterator i$ = imes.iterator();
        while (i$.hasNext()) {
            String str = (String) i$.next();
            if (needsAppendSeparator) {
                stringBuilder.append(':');
            } else {
                needsAppendSeparator = true;
            }
            stringBuilder.append(str);
        }
    }

    public static void buildInputMethodsAndSubtypesString(StringBuilder stringBuilder, HashMap<String, HashSet<String>> imsList) {
        boolean needsAppendSeparator = false;
        for (String str : imsList.keySet()) {
            if (needsAppendSeparator) {
                stringBuilder.append(':');
            } else {
                needsAppendSeparator = true;
            }
            buildEnabledInputMethodsString(stringBuilder, str, (HashSet) imsList.get(str));
        }
    }

    private static boolean containsSubtypeOf(InputMethodInfo inputMethodInfo, String str) {
        int N = inputMethodInfo.getSubtypeCount();
        for (int i = 0; i < N; i++) {
            if (inputMethodInfo.getSubtypeAt(i).getLocale().startsWith(str)) {
                return true;
            }
        }
        return false;
    }

    private static HashSet<String> getDisabledSystemIMEs(ContentResolver contentResolver) {
        HashSet<String> set = new HashSet();
        String disabledIMEsStr = Secure.getString(contentResolver, "disabled_system_input_methods");
        if (!TextUtils.isEmpty(disabledIMEsStr)) {
            sStringInputMethodSplitter.setString(disabledIMEsStr);
            while (sStringInputMethodSplitter.hasNext()) {
                set.add(sStringInputMethodSplitter.next());
            }
        }
        return set;
    }

    private static boolean isValidDefaultIme(InputMethodInfo inputMethodInfo, Context context) {
        if (inputMethodInfo.getIsDefaultResourceId() == 0) {
            return false;
        }
        try {
            return context.createPackageContext(inputMethodInfo.getPackageName(), 0).getResources().getBoolean(inputMethodInfo.getIsDefaultResourceId()) && containsSubtypeOf(inputMethodInfo, context.getResources().getConfiguration().locale.getLanguage());
        } catch (NameNotFoundException e) {
            return false;
        } catch (NotFoundException e2) {
            return false;
        }
    }

    private static void buildEnabledInputMethodsString(StringBuilder stringBuilder, String str, HashSet<String> subtypes) {
        stringBuilder.append(str);
        Iterator i$ = subtypes.iterator();
        while (i$.hasNext()) {
            stringBuilder.append(';').append((String) i$.next());
        }
    }

    private static int getInputMethodSubtypeSelected(ContentResolver contentResolver) {
        try {
            return Secure.getInt(contentResolver, "selected_input_method_subtype");
        } catch (SettingNotFoundException e) {
            return -1;
        }
    }

    private static void putSelectedInputMethodSubtype(ContentResolver contentResolver, int i) {
        Secure.putInt(contentResolver, "selected_input_method_subtype", i);
    }

    public static boolean isAuxiliaryIme(InputMethodInfo inputMethodInfo) {
        return inputMethodInfo.isAuxiliaryIme();
    }

    private static boolean isInputMethodSubtypeSelected(ContentResolver contentResolver) {
        return getInputMethodSubtypeSelected(contentResolver) != -1;
    }

    public static boolean isSystemIme(InputMethodInfo inputMethodInfo) {
        return (inputMethodInfo.getServiceInfo().applicationInfo.flags & 1) != 0;
    }
}