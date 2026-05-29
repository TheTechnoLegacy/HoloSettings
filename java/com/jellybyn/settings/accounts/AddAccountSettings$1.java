package com.jellybyn.settings.accounts;

class AddAccountSettings$1 implements android.accounts.AccountManagerCallback<android.os.Bundle> {
    final /* synthetic */ com.jellybyn.settings.accounts.AddAccountSettings this$0;

    AddAccountSettings$1(com.jellybyn.settings.accounts.AddAccountSettings r1) {
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