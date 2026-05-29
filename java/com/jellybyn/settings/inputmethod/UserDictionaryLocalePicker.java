package com.jellybyn.settings.inputmethod;

import com.android.internal.app.LocalePicker;

public class UserDictionaryLocalePicker extends LocalePicker {
    public UserDictionaryLocalePicker(UserDictionaryAddWordFragment userDictionaryAddWordFragment) {
        setLocaleSelectionListener(userDictionaryAddWordFragment);
    }
}