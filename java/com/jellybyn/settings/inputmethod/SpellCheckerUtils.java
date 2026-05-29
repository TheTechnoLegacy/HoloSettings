package com.jellybyn.settings.inputmethod;

import android.view.textservice.SpellCheckerInfo;
import android.view.textservice.TextServicesManager;

public class SpellCheckerUtils {
    private static final String TAG = SpellCheckerUtils.class.getSimpleName();

    public static SpellCheckerInfo getCurrentSpellChecker(TextServicesManager textServicesManager) {
        return textServicesManager.getCurrentSpellChecker();
    }

    public static SpellCheckerInfo[] getEnabledSpellCheckers(TextServicesManager textServicesManager) {
        return textServicesManager.getEnabledSpellCheckers();
    }

    public static void setCurrentSpellChecker(TextServicesManager textServicesManager, SpellCheckerInfo spellCheckerInfo) {
    }
}