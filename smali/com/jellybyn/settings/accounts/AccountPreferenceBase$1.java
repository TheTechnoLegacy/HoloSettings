package com.jellybyn.settings.accounts;

import android.content.SyncStatusObserver;

class AccountPreferenceBase$1 implements SyncStatusObserver {
    final /* synthetic */ AccountPreferenceBase this$0;

    public void onStatusChanged(int i) {
        AccountPreferenceBase.access$000(this.this$0).post(new Runnable() {
            public void run() {
                AccountPreferenceBase$1.this.this$0.onSyncStateUpdated();
            }
        });
    }

    AccountPreferenceBase$1(AccountPreferenceBase accountPreferenceBase) {
        this.this$0 = accountPreferenceBase;
    }
}