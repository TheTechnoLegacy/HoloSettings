package com.jellybyn.settings.inputmethod;

import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.os.Handler;
import android.provider.Settings.Secure;

class InputMethodAndLanguageSettings$SettingsObserver extends ContentObserver {
    private Context mContext;
    final /* synthetic */ InputMethodAndLanguageSettings this$0;

    public InputMethodAndLanguageSettings$SettingsObserver(InputMethodAndLanguageSettings inputMethodAndLanguageSettings, Handler handler, Context context) {
        this.this$0 = inputMethodAndLanguageSettings;
        super(handler);
        this.mContext = context;
    }

    public void resume() {
        ContentResolver cr = this.mContext.getContentResolver();
        cr.registerContentObserver(Secure.getUriFor("default_input_method"), false, this);
        cr.registerContentObserver(Secure.getUriFor("selected_input_method_subtype"), false, this);
    }

    public void onChange(boolean z) {
        InputMethodAndLanguageSettings.access$100(this.this$0);
    }

    public void pause() {
        this.mContext.getContentResolver().unregisterContentObserver(this);
    }
}