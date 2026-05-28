package com.jellybyn.settings.accounts;

import android.accounts.AccountManager;
import android.accounts.AccountManagerCallback;
import android.accounts.AccountManagerFuture;
import android.accounts.AuthenticatorException;
import android.accounts.OperationCanceledException;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import java.io.IOException;

class AccountSyncSettings$1 implements OnClickListener {
    final /* synthetic */ AccountSyncSettings this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        AccountManager.get(this.this$0.getActivity()).removeAccount(AccountSyncSettings.access$000(this.this$0), new AccountManagerCallback<Boolean>() {
            public void run(AccountManagerFuture<Boolean> future) {
                if (AccountSyncSettings$1.this.this$0.isResumed()) {
                    boolean failed = true;
                    try {
                        if (((Boolean) future.getResult()).booleanValue()) {
                            failed = false;
                        }
                    } catch (OperationCanceledException e) {
                    } catch (IOException e2) {
                    } catch (AuthenticatorException e3) {
                    }
                    if (failed) {
                        AccountSyncSettings.access$100(AccountSyncSettings$1.this.this$0, 101);
                    } else {
                        AccountSyncSettings$1.this.this$0.finish();
                    }
                }
            }
        }, null);
    }

    AccountSyncSettings$1(AccountSyncSettings accountSyncSettings) {
        this.this$0 = accountSyncSettings;
    }
}