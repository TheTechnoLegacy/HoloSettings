package com.jellybyn.settings;

import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.jellybyn.settings.CryptKeeperConfirm.Blank;

class CryptKeeperConfirm$1 implements OnClickListener {
    final /* synthetic */ CryptKeeperConfirm this$0;

    public void onClick(View view) {
        if (!Utils.isMonkeyRunning()) {
            Intent intent = new Intent(this.this$0.getActivity(), Blank.class);
            intent.putExtras(this.this$0.getArguments());
            this.this$0.startActivity(intent);
        }
    }

    CryptKeeperConfirm$1(CryptKeeperConfirm cryptKeeperConfirm) {
        this.this$0 = cryptKeeperConfirm;
    }
}