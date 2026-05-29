package com.jellybyn.settings;

import android.content.Intent;
import android.os.AsyncTask;
import android.util.Log;
import android.widget.TextView;
import com.jellybyn.settings.CryptKeeper.FadeToBlack;

class CryptKeeper$DecryptTask extends AsyncTask<String, Void, Integer> {
    final /* synthetic */ CryptKeeper this$0;

    protected void onPostExecute(Integer num) {
        if (num.intValue() == 0) {
            Intent intent = new Intent(this.this$0, FadeToBlack.class);
            this.this$0.finish();
            this.this$0.startActivity(intent);
        } else if (num.intValue() == 30) {
            this.this$0.sendBroadcast(new Intent("android.intent.action.MASTER_CLEAR"));
        } else if (num.intValue() % 10 == 0) {
            CryptKeeper.access$102(this.this$0, 30);
            CryptKeeper.access$200(this.this$0);
        } else {
            ((TextView) this.this$0.findViewById(2131230740)).setText(2131428890);
            CryptKeeper.access$300(this.this$0).setEnabled(true);
        }
    }

    protected Integer doInBackground(String... strArr) {
        try {
            return Integer.valueOf(CryptKeeper.access$000(this.this$0).decryptStorage(strArr[0]));
        } catch (Exception e) {
            Log.e("CryptKeeper", "Error while decrypting...", e);
            return Integer.valueOf(-1);
        }
    }

    private CryptKeeper$DecryptTask(CryptKeeper cryptKeeper) {
        this.this$0 = cryptKeeper;
    }
}