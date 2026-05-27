package com.jellybyn.settings.applications;

final class RunningState$BackgroundHandler extends android.os.Handler {
    final /* synthetic */ com.jellybyn.settings.applications.RunningState this$0;

    public RunningState$BackgroundHandler(com.jellybyn.settings.applications.RunningState r1, android.os.Looper r2) {
        r0 = this;
        r0.this$0 = r1;
        r0.<init>(r2);
        return;
    }

    public void handleMessage(android.os.Message r6) {
        r5 = this;
        r4 = 2;
        r1 = r6.what;
        switch(r1) {
            case 1: goto L_0x0007;
            case 2: goto L_0x000d;
            default: goto L_0x0006;
        };
    L_0x0006:
        return;
    L_0x0007:
        r1 = r5.this$0;
        com.jellybyn.settings.applications.RunningState.access$000(r1);
        goto L_0x0006;
    L_0x000d:
        r1 = r5.this$0;
        r2 = r1.mLock;
        monitor-enter(r2);
        r1 = r5.this$0;	 Catch:{ all -> 0x001a }
        r1 = r1.mResumed;	 Catch:{ all -> 0x001a }
        if (r1 != 0) goto L_0x001d;
    L_0x0018:
        monitor-exit(r2);	 Catch:{ all -> 0x001a }
        goto L_0x0006;
    L_0x001a:
        r1 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x001a }
        throw r1;
    L_0x001d:
        monitor-exit(r2);
        r1 = r5.this$0;
        r1 = r1.mHandler;
        r2 = 3;
        r0 = r1.obtainMessage(r2);
        r1 = r5.this$0;
        r2 = r5.this$0;
        r2 = r2.mApplicationContext;
        r3 = r5.this$0;
        r3 = r3.mAm;
        r1 = com.jellybyn.settings.applications.RunningState.access$100(r1, r2, r3);
        if (r1 == 0) goto L_0x004e;
    L_0x0037:
        r1 = 1;
    L_0x0038:
        r0.arg1 = r1;
        r1 = r5.this$0;
        r1 = r1.mHandler;
        r1.sendMessage(r0);
        r5.removeMessages(r4);
        r6 = r5.obtainMessage(r4);
        r1 = 2000; // 0x7d0 float:2.803E-42 double:9.88E-321;
        r5.sendMessageDelayed(r6, r1);
        goto L_0x0006;
    L_0x004e:
        r1 = 0;
        goto L_0x0038;
    }
}