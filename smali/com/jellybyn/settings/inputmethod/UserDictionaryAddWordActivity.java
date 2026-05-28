package com.jellybyn.settings.inputmethod;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.view.View;

public class UserDictionaryAddWordActivity extends Activity {
    private UserDictionaryAddWordContents mContents;

    public void onCreate(Bundle bundle) {
        int i;
        super.onCreate(bundle);
        setContentView(2130968706);
        Intent intent = getIntent();
        String action = intent.getAction();
        if ("com.jellybyn.settings.USER_DICTIONARY_EDIT".equals(action)) {
            i = 0;
        } else if ("com.jellybyn.settings.USER_DICTIONARY_INSERT".equals(action)) {
            i = 1;
        } else {
            throw new RuntimeException("Unsupported action: " + action);
        }
        Bundle extras = intent.getExtras();
        extras.putInt("mode", i);
        if (bundle != null) {
            extras.putAll(bundle);
        }
        this.mContents = new UserDictionaryAddWordContents(getWindow().getDecorView(), extras);
    }

    private void reportBackToCaller(int i, Bundle bundle) {
        Messenger listener = getIntent().getExtras().get("listener");
        if (listener instanceof Messenger) {
            Messenger messenger = listener;
            Message m = Message.obtain();
            m.obj = bundle;
            m.what = i;
            try {
                messenger.send(m);
            } catch (RemoteException e) {
            }
        }
    }

    public void onClickConfirm(View view) {
        Bundle parameters = new Bundle();
        reportBackToCaller(this.mContents.apply(this, parameters), parameters);
        finish();
    }

    public void onClickCancel(View view) {
        reportBackToCaller(1, null);
        finish();
    }

    public void onSaveInstanceState(Bundle bundle) {
        this.mContents.saveStateIntoBundle(bundle);
    }
}