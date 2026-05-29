package com.jellybyn.settings;

import android.os.IBinder;
import android.os.ServiceManager;
import android.os.storage.IMountService.Stub;
import android.util.Log;
import com.jellybyn.settings.CryptKeeperConfirm.Blank;

class CryptKeeperConfirm$Blank$1 implements Runnable {
    final /* synthetic */ Blank this$0;

    public void run() {
        IBinder service = ServiceManager.getService("mount");
        if (service == null) {
            Log.e("CryptKeeper", "Failed to find the mount service");
            this.this$0.finish();
            return;
        }
        try {
            Stub.asInterface(service).encryptStorage(this.this$0.getIntent().getExtras().getString("password"));
        } catch (Exception e) {
            Log.e("CryptKeeper", "Error while encrypting...", e);
        }
    }

    CryptKeeperConfirm$Blank$1(Blank blank) {
        this.this$0 = blank;
    }
}