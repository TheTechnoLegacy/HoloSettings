package com.jellybyn.settings;

import android.security.KeyStore.State;

/* synthetic */ class CredentialStorage$1 {
    static final /* synthetic */ int[] $SwitchMap$android$security$KeyStore$State = new int[State.values().length];

    static {
        try {
            $SwitchMap$android$security$KeyStore$State[State.UNINITIALIZED.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            $SwitchMap$android$security$KeyStore$State[State.LOCKED.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            $SwitchMap$android$security$KeyStore$State[State.UNLOCKED.ordinal()] = 3;
        } catch (NoSuchFieldError e3) {
        }
    }
}