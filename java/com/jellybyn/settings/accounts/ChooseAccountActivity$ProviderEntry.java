package com.jellybyn.settings.accounts;

import com.android.internal.util.CharSequences;

class ChooseAccountActivity$ProviderEntry implements Comparable<ChooseAccountActivity$ProviderEntry> {
    private final CharSequence name;
    private final String type;

    public int compareTo(ChooseAccountActivity$ProviderEntry chooseAccountActivity$ProviderEntry) {
        if (this.name == null) {
            return -1;
        }
        return chooseAccountActivity$ProviderEntry.name == null ? 1 : CharSequences.compareToIgnoreCase(this.name, chooseAccountActivity$ProviderEntry.name);
    }

    ChooseAccountActivity$ProviderEntry(CharSequence charSequence, String str) {
        this.name = charSequence;
        this.type = str;
    }
}