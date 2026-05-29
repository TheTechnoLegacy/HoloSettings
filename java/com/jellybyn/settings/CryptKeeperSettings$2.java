package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.view.View;
import android.view.View.OnClickListener;

class CryptKeeperSettings$2 implements OnClickListener {
    final /* synthetic */ CryptKeeperSettings this$0;

    public void onClick(View view) {
        if (!CryptKeeperSettings.access$300(this.this$0, 55)) {
            new Builder(this.this$0.getActivity()).setTitle(2131427624).setIconAttribute(16843605).setMessage(2131427625).setPositiveButton(17039370, null).create().show();
        }
    }

    CryptKeeperSettings$2(CryptKeeperSettings cryptKeeperSettings) {
        this.this$0 = cryptKeeperSettings;
    }
}