package com.jellybyn.settings;

public class SubSettings extends Settings {
    public boolean onNavigateUp() {
        finish();
        return true;
    }
}