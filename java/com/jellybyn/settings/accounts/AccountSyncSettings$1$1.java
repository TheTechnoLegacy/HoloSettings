package com.jellybyn.settings.accounts;

import android.accounts.AccountManagerCallback;
import android.accounts.AccountManagerFuture;
import android.accounts.AuthenticatorException;
import android.accounts.OperationCanceledException;
import com.jellybyn.settings.accounts.AccountSyncSettings.1;
import java.io.IOException;

class AccountSyncSettings$1$1 implements AccountManagerCallback<Boolean> {
    final /* synthetic */ 1 this$1;

    public void run(AccountManagerFuture<Boolean> future) {
        if (this.this$1.this$0.isResumed()) {
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
                AccountSyncSettings.access$100(this.this$1.this$0, 101);
            } else {
                this.this$1.this$0.finish();
            }
        }
    }

    AccountSyncSettings$1$1(1 1) {
        this.this$1 = 1;
    }
}