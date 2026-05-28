package com.jellybyn.settings.accounts;

public class AddAccountSettings extends android.app.Activity {
    private boolean mAddAccountCalled;
    private final android.accounts.AccountManagerCallback<android.os.Bundle> mCallback;
    private android.app.PendingIntent mPendingIntent;

    class 1 implements android.accounts.AccountManagerCallback<android.os.Bundle> {
        final /* synthetic */ com.jellybyn.settings.accounts.AddAccountSettings this$0;

        1(com.jellybyn.settings.accounts.AddAccountSettings r1) {
            r0 = this;
            r0.this$0 = r1;
            r0.<init>();
            return;
        }

        public void run(android.accounts.AccountManagerFuture<android.os.Bundle> r9) {
            r8 = this;
            r2 = 1;
            r1 = r9.getResult();	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r1 = (android.os.Bundle) r1;	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r5 = "intent";
            r4 = r1.get(r5);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r4 = (android.content.Intent) r4;	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            if (r4 == 0) goto L_0x005f;
        L_0x0011:
            r2 = 0;
            r0 = new android.os.Bundle;	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r0.<init>();	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r5 = "pendingIntent";
            r6 = r8.this$0;	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r6 = com.jellybyn.settings.accounts.AddAccountSettings.access$000(r6);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r0.putParcelable(r5, r6);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r5 = "hasMultipleUsers";
            r6 = r8.this$0;	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r6 = com.jellybyn.settings.Utils.hasMultipleUsers(r6);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r0.putBoolean(r5, r6);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r4.putExtras(r0);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r5 = r8.this$0;	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r6 = 2;
            r5.startActivityForResult(r4, r6);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
        L_0x0036:
            r5 = "AccountSettings";
            r6 = 2;
            r5 = android.util.Log.isLoggable(r5, r6);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            if (r5 == 0) goto L_0x0057;
        L_0x003f:
            r5 = "AccountSettings";
            r6 = new java.lang.StringBuilder;	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r6.<init>();	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r7 = "account added: ";
            r6 = r6.append(r7);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r6 = r6.append(r1);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            r6 = r6.toString();	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
            android.util.Log.v(r5, r6);	 Catch:{ OperationCanceledException -> 0x007d, IOException -> 0x0096, AuthenticatorException -> 0x00c0 }
        L_0x0057:
            if (r2 == 0) goto L_0x005e;
        L_0x0059:
            r5 = r8.this$0;
            r5.finish();
        L_0x005e:
            return;
        L_0x005f:
            r5 = r8.this$0;
            r6 = -1;
            r5.setResult(r6);
            r5 = r8.this$0;
            r5 = com.jellybyn.settings.accounts.AddAccountSettings.access$000(r5);
            if (r5 == 0) goto L_0x0036;
        L_0x006d:
            r5 = r8.this$0;
            r5 = com.jellybyn.settings.accounts.AddAccountSettings.access$000(r5);
            r5.cancel();
            r5 = r8.this$0;
            r6 = 0;
            com.jellybyn.settings.accounts.AddAccountSettings.access$002(r5, r6);
            goto L_0x0036;
        L_0x007d:
            r3 = move-exception;
            r5 = "AccountSettings";
            r6 = 2;
            r5 = android.util.Log.isLoggable(r5, r6);	 Catch:{ all -> 0x00eb }
            if (r5 == 0) goto L_0x008e;
        L_0x0087:
            r5 = "AccountSettings";
            r6 = "addAccount was canceled";
            android.util.Log.v(r5, r6);	 Catch:{ all -> 0x00eb }
        L_0x008e:
            if (r2 == 0) goto L_0x005e;
        L_0x0090:
            r5 = r8.this$0;
            r5.finish();
            goto L_0x005e;
        L_0x0096:
            r3 = move-exception;
            r5 = "AccountSettings";
            r6 = 2;
            r5 = android.util.Log.isLoggable(r5, r6);
            if (r5 == 0) goto L_0x00b8;
        L_0x00a0:
            r5 = "AccountSettings";
            r6 = new java.lang.StringBuilder;
            r6.<init>();
            r7 = "addAccount failed: ";
            r6 = r6.append(r7);
            r6 = r6.append(r3);
            r6 = r6.toString();
            android.util.Log.v(r5, r6);
        L_0x00b8:
            if (r2 == 0) goto L_0x005e;
        L_0x00ba:
            r5 = r8.this$0;
            r5.finish();
            goto L_0x005e;
        L_0x00c0:
            r3 = move-exception;
            r5 = "AccountSettings";
            r6 = 2;
            r5 = android.util.Log.isLoggable(r5, r6);
            if (r5 == 0) goto L_0x00e2;
        L_0x00ca:
            r5 = "AccountSettings";
            r6 = new java.lang.StringBuilder;
            r6.<init>();
            r7 = "addAccount failed: ";
            r6 = r6.append(r7);
            r6 = r6.append(r3);
            r6 = r6.toString();
            android.util.Log.v(r5, r6);
        L_0x00e2:
            if (r2 == 0) goto L_0x005e;
        L_0x00e4:
            r5 = r8.this$0;
            r5.finish();
            goto L_0x005e;
        L_0x00eb:
            r5 = move-exception;
            if (r2 == 0) goto L_0x00f3;
        L_0x00ee:
            r6 = r8.this$0;
            r6.finish();
        L_0x00f3:
            throw r5;
        }
    }

    public AddAccountSettings() {
        r1 = this;
        r1.<init>();
        r0 = new com.jellybyn.settings.accounts.AddAccountSettings$1;
        r0.<init>(r1);
        r1.mCallback = r0;
        r0 = 0;
        r1.mAddAccountCalled = r0;
        return;
    }

    static /* synthetic */ android.app.PendingIntent access$000(com.jellybyn.settings.accounts.AddAccountSettings r1) {
        r0 = r1.mPendingIntent;
        return r0;
    }

    static /* synthetic */ android.app.PendingIntent access$002(com.jellybyn.settings.accounts.AddAccountSettings r0, android.app.PendingIntent r1) {
        r0.mPendingIntent = r1;
        return r1;
    }

    private void addAccount(java.lang.String r9) {
        r8 = this;
        r1 = 0;
        r2 = 0;
        r4 = new android.os.Bundle;
        r4.<init>();
        r0 = new android.content.Intent;
        r0.<init>();
        r0 = android.app.PendingIntent.getBroadcast(r8, r1, r0, r1);
        r8.mPendingIntent = r0;
        r0 = "pendingIntent";
        r1 = r8.mPendingIntent;
        r4.putParcelable(r0, r1);
        r0 = "hasMultipleUsers";
        r1 = com.jellybyn.settings.Utils.hasMultipleUsers(r8);
        r4.putBoolean(r0, r1);
        r0 = android.accounts.AccountManager.get(r8);
        r6 = r8.mCallback;
        r1 = r9;
        r3 = r2;
        r5 = r2;
        r7 = r2;
        r0.addAccount(r1, r2, r3, r4, r5, r6, r7);
        r0 = 1;
        r8.mAddAccountCalled = r0;
        return;
    }

    public void onActivityResult(int r2, int r3, android.content.Intent r4) {
        r1 = this;
        switch(r2) {
            case 1: goto L_0x0004;
            case 2: goto L_0x0017;
            default: goto L_0x0003;
        };
    L_0x0003:
        return;
    L_0x0004:
        if (r3 != 0) goto L_0x000d;
    L_0x0006:
        r1.setResult(r3);
        r1.finish();
        goto L_0x0003;
    L_0x000d:
        r0 = "selected_account";
        r0 = r4.getStringExtra(r0);
        r1.addAccount(r0);
        goto L_0x0003;
    L_0x0017:
        r1.setResult(r3);
        r0 = r1.mPendingIntent;
        if (r0 == 0) goto L_0x0026;
    L_0x001e:
        r0 = r1.mPendingIntent;
        r0.cancel();
        r0 = 0;
        r1.mPendingIntent = r0;
    L_0x0026:
        r1.finish();
        goto L_0x0003;
    }

    public void onCreate(android.os.Bundle r6) {
        r5 = this;
        r4 = 1;
        super.onCreate(r6);
        if (r6 == 0) goto L_0x001e;
    L_0x0006:
        r0 = "AddAccountCalled";
        r0 = r6.getBoolean(r0);
        r5.mAddAccountCalled = r0;
        r0 = "AccountSettings";
        r1 = 2;
        r0 = android.util.Log.isLoggable(r0, r1);
        if (r0 == 0) goto L_0x001e;
    L_0x0017:
        r0 = "AccountSettings";
        r1 = "restored";
        android.util.Log.v(r0, r1);
    L_0x001e:
        r0 = "user";
        r0 = r5.getSystemService(r0);
        r0 = (android.os.UserManager) r0;
        r1 = "no_modify_accounts";
        r0 = r0.hasUserRestriction(r1);
        if (r0 == 0) goto L_0x003c;
    L_0x002e:
        r0 = 2131429093; // 0x7f0b06e5 float:1.847985E38 double:1.0530658914E-314;
        r0 = android.widget.Toast.makeText(r5, r0, r4);
        r0.show();
        r5.finish();
    L_0x003b:
        return;
    L_0x003c:
        r0 = r5.mAddAccountCalled;
        if (r0 == 0) goto L_0x0044;
    L_0x0040:
        r5.finish();
        goto L_0x003b;
    L_0x0044:
        r0 = r5.getIntent();
        r1 = "authorities";
        r0 = r0.getStringArrayExtra(r1);
        r1 = r5.getIntent();
        r2 = "account_types";
        r1 = r1.getStringArrayExtra(r2);
        r2 = new android.content.Intent;
        r3 = com.jellybyn.settings.accounts.ChooseAccountActivity.class;
        r2.<init>(r5, r3);
        if (r0 == 0) goto L_0x0066;
    L_0x0061:
        r3 = "authorities";
        r2.putExtra(r3, r0);
    L_0x0066:
        if (r1 == 0) goto L_0x006d;
    L_0x0068:
        r0 = "account_types";
        r2.putExtra(r0, r1);
    L_0x006d:
        r5.startActivityForResult(r2, r4);
        goto L_0x003b;
    }

    protected void onSaveInstanceState(android.os.Bundle r3) {
        r2 = this;
        super.onSaveInstanceState(r3);
        r0 = "AddAccountCalled";
        r1 = r2.mAddAccountCalled;
        r3.putBoolean(r0, r1);
        r0 = "AccountSettings";
        r1 = 2;
        r0 = android.util.Log.isLoggable(r0, r1);
        if (r0 == 0) goto L_0x001a;
    L_0x0013:
        r0 = "AccountSettings";
        r1 = "saved";
        android.util.Log.v(r0, r1);
    L_0x001a:
        return;
    }
}