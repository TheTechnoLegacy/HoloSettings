package com.jellybyn.settings;

import android.os.AsyncTask;
import android.os.RemoteException;
import android.os.storage.IMountService;
import android.util.Log;

class CryptKeeper$ValidationTask extends AsyncTask<Void, Void, Boolean> {
    final /* synthetic */ CryptKeeper this$0;

    protected Boolean doInBackground(Void... voidArr) {
        IMountService service = CryptKeeper.access$000(this.this$0);
        try {
            Log.d("CryptKeeper", "Validating encryption state.");
            int encryptionState = service.getEncryptionState();
            if (encryptionState == 1) {
                Log.w("CryptKeeper", "Unexpectedly in CryptKeeper even though there is no encryption.");
                return Boolean.valueOf(true);
            }
            return Boolean.valueOf(encryptionState == 0);
        } catch (RemoteException e) {
            Log.w("CryptKeeper", "Unable to get encryption state properly");
            return Boolean.valueOf(true);
        }
    }

    protected void onPostExecute(Boolean bool) {
        CryptKeeper.access$402(this.this$0, true);
        if (Boolean.FALSE.equals(bool)) {
            Log.w("CryptKeeper", "Incomplete, or corrupted encryption detected. Prompting user to wipe.");
            CryptKeeper.access$502(this.this$0, true);
        } else {
            Log.d("CryptKeeper", "Encryption state validated. Proceeding to configure UI");
        }
        CryptKeeper.access$600(this.this$0);
    }

    private CryptKeeper$ValidationTask(CryptKeeper cryptKeeper) {
        this.this$0 = cryptKeeper;
    }
}