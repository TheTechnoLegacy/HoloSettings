package com.jellybyn.settings.applications;

class RunningState$2 extends android.os.Handler {
    int mNextUpdate;
    final /* synthetic */ com.jellybyn.settings.applications.RunningState this$0;

    RunningState$2(com.jellybyn.settings.applications.RunningState r2) {
        r1 = this;
        r1.this$0 = r2;
        r1.<init>();
        r0 = 0;
        r1.mNextUpdate = r0;
        return;
    }

    public void handleMessage(android.os.Message r5) {
        r4 = this;
        r3 = 4;
        r1 = r5.what;
        switch(r1) {
            case 3: goto L_0x0007;
            case 4: goto L_0x0011;
            default: goto L_0x0006;
        };
    L_0x0006:
        return;
    L_0x0007:
        r1 = r5.arg1;
        if (r1 == 0) goto L_0x000f;
    L_0x000b:
        r1 = 2;
    L_0x000c:
        r4.mNextUpdate = r1;
        goto L_0x0006;
    L_0x000f:
        r1 = 1;
        goto L_0x000c;
    L_0x0011:
        r1 = r4.this$0;
        r2 = r1.mLock;
        monitor-enter(r2);
        r1 = r4.this$0;	 Catch:{ all -> 0x001e }
        r1 = r1.mResumed;	 Catch:{ all -> 0x001e }
        if (r1 != 0) goto L_0x0021;
    L_0x001c:
        monitor-exit(r2);	 Catch:{ all -> 0x001e }
        goto L_0x0006;
    L_0x001e:
        r1 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x001e }
        throw r1;
    L_0x0021:
        monitor-exit(r2);
        r4.removeMessages(r3);
        r0 = r4.obtainMessage(r3);
        r1 = 1000; // 0x3e8 float:1.401E-42 double:4.94E-321;
        r4.sendMessageDelayed(r0, r1);
        r1 = r4.this$0;
        r1 = r1.mRefreshUiListener;
        if (r1 == 0) goto L_0x0006;
    L_0x0034:
        r1 = r4.this$0;
        r1 = r1.mRefreshUiListener;
        r2 = r4.mNextUpdate;
        r1.onRefreshUi(r2);
        r1 = 0;
        r4.mNextUpdate = r1;
        goto L_0x0006;
    }
}