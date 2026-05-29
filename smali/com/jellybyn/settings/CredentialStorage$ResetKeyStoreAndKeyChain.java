package com.jellybyn.settings;

import android.os.AsyncTask;
import android.os.RemoteException;
import android.security.KeyChain;
import android.security.KeyChain.KeyChainConnection;
import android.widget.Toast;

class CredentialStorage$ResetKeyStoreAndKeyChain extends AsyncTask<Void, Void, Boolean> {
    final /* synthetic */ CredentialStorage this$0;

    protected Boolean doInBackground(Void... voidArr) {
        CredentialStorage.access$400(this.this$0).reset();
        try {
            Boolean valueOf;
            KeyChainConnection keyChainConnection = KeyChain.bind(this.this$0);
            try {
                valueOf = Boolean.valueOf(keyChainConnection.getService().reset());
            } catch (RemoteException e) {
                valueOf = Boolean.valueOf(false);
            } finally {
                keyChainConnection.close();
            }
            return valueOf;
        } catch (InterruptedException e2) {
            Thread.currentThread().interrupt();
            return Boolean.valueOf(false);
        }
    }

    protected void onPostExecute(Boolean bool) {
        if (bool.booleanValue()) {
            Toast.makeText(this.this$0, 2131428777, 0).show();
        } else {
            Toast.makeText(this.this$0, 2131428778, 0).show();
        }
        this.this$0.finish();
    }

    private CredentialStorage$ResetKeyStoreAndKeyChain(CredentialStorage credentialStorage) {
        this.this$0 = credentialStorage;
    }
}