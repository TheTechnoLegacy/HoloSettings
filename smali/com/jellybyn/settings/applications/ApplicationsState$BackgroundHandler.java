package com.jellybyn.settings.applications;

class ApplicationsState$BackgroundHandler extends android.os.Handler {
    boolean mRunning;
    final android.content.pm.IPackageStatsObserver.Stub mStatsObserver;
    final /* synthetic */ com.jellybyn.settings.applications.ApplicationsState this$0;

    class 1 extends android.content.pm.IPackageStatsObserver.Stub {
        final /* synthetic */ com.jellybyn.settings.applications.ApplicationsState$BackgroundHandler this$1;

        1(com.jellybyn.settings.applications.ApplicationsState$BackgroundHandler r1) {
            r0 = this;
            r0.this$1 = r1;
            r0.<init>();
            return;
        }

        public void onGetStatsCompleted(android.content.pm.PackageStats r17, boolean r18) {
            r16 = this;
            r9 = 0;
            r0 = r16;
            r10 = r0.this$1;
            r10 = r10.this$0;
            r11 = r10.mEntriesMap;
            monitor-enter(r11);
            r0 = r16;
            r10 = r0.this$1;	 Catch:{ all -> 0x013a }
            r10 = r10.this$0;	 Catch:{ all -> 0x013a }
            r10 = r10.mEntriesMap;	 Catch:{ all -> 0x013a }
            r0 = r17;
            r12 = r0.packageName;	 Catch:{ all -> 0x013a }
            r1 = r10.get(r12);	 Catch:{ all -> 0x013a }
            r1 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r1;	 Catch:{ all -> 0x013a }
            if (r1 == 0) goto L_0x0108;
        L_0x001e:
            monitor-enter(r1);	 Catch:{ all -> 0x013a }
            r10 = 0;
            r1.sizeStale = r10;	 Catch:{ all -> 0x0137 }
            r12 = 0;
            r1.sizeLoadStart = r12;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r12 = r0.externalCodeSize;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r14 = r0.externalObbSize;	 Catch:{ all -> 0x0137 }
            r2 = r12 + r14;
            r0 = r17;
            r12 = r0.externalDataSize;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r14 = r0.externalMediaSize;	 Catch:{ all -> 0x0137 }
            r4 = r12 + r14;
            r12 = r2 + r4;
            r0 = r16;
            r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
            r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r14 = com.jellybyn.settings.applications.ApplicationsState.access$100(r10, r0);	 Catch:{ all -> 0x0137 }
            r7 = r12 + r14;
            r12 = r1.size;	 Catch:{ all -> 0x0137 }
            r10 = (r12 > r7 ? 1 : (r12 == r7 ? 0 : -1));
            if (r10 != 0) goto L_0x0084;
        L_0x0050:
            r12 = r1.cacheSize;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r14 = r0.cacheSize;	 Catch:{ all -> 0x0137 }
            r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
            if (r10 != 0) goto L_0x0084;
        L_0x005a:
            r12 = r1.codeSize;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r14 = r0.codeSize;	 Catch:{ all -> 0x0137 }
            r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
            if (r10 != 0) goto L_0x0084;
        L_0x0064:
            r12 = r1.dataSize;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r14 = r0.dataSize;	 Catch:{ all -> 0x0137 }
            r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
            if (r10 != 0) goto L_0x0084;
        L_0x006e:
            r12 = r1.externalCodeSize;	 Catch:{ all -> 0x0137 }
            r10 = (r12 > r2 ? 1 : (r12 == r2 ? 0 : -1));
            if (r10 != 0) goto L_0x0084;
        L_0x0074:
            r12 = r1.externalDataSize;	 Catch:{ all -> 0x0137 }
            r10 = (r12 > r4 ? 1 : (r12 == r4 ? 0 : -1));
            if (r10 != 0) goto L_0x0084;
        L_0x007a:
            r12 = r1.externalCacheSize;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r14 = r0.externalCacheSize;	 Catch:{ all -> 0x0137 }
            r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
            if (r10 == 0) goto L_0x00e9;
        L_0x0084:
            r1.size = r7;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r12 = r0.cacheSize;	 Catch:{ all -> 0x0137 }
            r1.cacheSize = r12;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r12 = r0.codeSize;	 Catch:{ all -> 0x0137 }
            r1.codeSize = r12;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r12 = r0.dataSize;	 Catch:{ all -> 0x0137 }
            r1.dataSize = r12;	 Catch:{ all -> 0x0137 }
            r1.externalCodeSize = r2;	 Catch:{ all -> 0x0137 }
            r1.externalDataSize = r4;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r12 = r0.externalCacheSize;	 Catch:{ all -> 0x0137 }
            r1.externalCacheSize = r12;	 Catch:{ all -> 0x0137 }
            r0 = r16;
            r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
            r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
            r12 = r1.size;	 Catch:{ all -> 0x0137 }
            r10 = com.jellybyn.settings.applications.ApplicationsState.access$200(r10, r12);	 Catch:{ all -> 0x0137 }
            r1.sizeStr = r10;	 Catch:{ all -> 0x0137 }
            r0 = r16;
            r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
            r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r12 = com.jellybyn.settings.applications.ApplicationsState.access$100(r10, r0);	 Catch:{ all -> 0x0137 }
            r1.internalSize = r12;	 Catch:{ all -> 0x0137 }
            r0 = r16;
            r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
            r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
            r12 = r1.internalSize;	 Catch:{ all -> 0x0137 }
            r10 = com.jellybyn.settings.applications.ApplicationsState.access$200(r10, r12);	 Catch:{ all -> 0x0137 }
            r1.internalSizeStr = r10;	 Catch:{ all -> 0x0137 }
            r0 = r16;
            r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
            r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
            r0 = r17;
            r12 = com.jellybyn.settings.applications.ApplicationsState.access$300(r10, r0);	 Catch:{ all -> 0x0137 }
            r1.externalSize = r12;	 Catch:{ all -> 0x0137 }
            r0 = r16;
            r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
            r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
            r12 = r1.externalSize;	 Catch:{ all -> 0x0137 }
            r10 = com.jellybyn.settings.applications.ApplicationsState.access$200(r10, r12);	 Catch:{ all -> 0x0137 }
            r1.externalSizeStr = r10;	 Catch:{ all -> 0x0137 }
            r9 = 1;
        L_0x00e9:
            monitor-exit(r1);	 Catch:{ all -> 0x0137 }
            if (r9 == 0) goto L_0x0108;
        L_0x00ec:
            r0 = r16;
            r10 = r0.this$1;
            r10 = r10.this$0;
            r10 = r10.mMainHandler;
            r12 = 4;
            r0 = r17;
            r13 = r0.packageName;
            r6 = r10.obtainMessage(r12, r13);
            r0 = r16;
            r10 = r0.this$1;
            r10 = r10.this$0;
            r10 = r10.mMainHandler;
            r10.sendMessage(r6);
        L_0x0108:
            r0 = r16;
            r10 = r0.this$1;
            r10 = r10.this$0;
            r10 = r10.mCurComputingSizePkg;
            if (r10 == 0) goto L_0x0124;
        L_0x0112:
            r0 = r16;
            r10 = r0.this$1;
            r10 = r10.this$0;
            r10 = r10.mCurComputingSizePkg;
            r0 = r17;
            r12 = r0.packageName;
            r10 = r10.equals(r12);
            if (r10 == 0) goto L_0x0135;
        L_0x0124:
            r0 = r16;
            r10 = r0.this$1;
            r10 = r10.this$0;
            r12 = 0;
            r10.mCurComputingSizePkg = r12;
            r0 = r16;
            r10 = r0.this$1;
            r12 = 4;
            r10.sendEmptyMessage(r12);
        L_0x0135:
            monitor-exit(r11);
            return;
        L_0x0137:
            r10 = move-exception;
            monitor-exit(r1);
            throw r10;
        L_0x013a:
            r10 = move-exception;
            monitor-exit(r11);
            throw r10;
        }
    }

    ApplicationsState$BackgroundHandler(com.jellybyn.settings.applications.ApplicationsState r2, android.os.Looper r3) {
        r1 = this;
        r1.this$0 = r2;
        r1.<init>(r3);
        r0 = new com.jellybyn.settings.applications.ApplicationsState$BackgroundHandler$1;
        r0.<init>(r1);
        r1.mStatsObserver = r0;
        return;
    }

    public void handleMessage(android.os.Message r17) {
        r16 = this;
        r8 = 0;
        r0 = r16;
        r10 = r0.this$0;
        r11 = r10.mEntriesMap;
        monitor-enter(r11);
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x003f }
        r10 = r10.mRebuildingSessions;	 Catch:{ all -> 0x003f }
        r10 = r10.size();	 Catch:{ all -> 0x003f }
        if (r10 <= 0) goto L_0x0029;
    L_0x0014:
        r9 = new java.util.ArrayList;	 Catch:{ all -> 0x003f }
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x003f }
        r10 = r10.mRebuildingSessions;	 Catch:{ all -> 0x003f }
        r9.<init>(r10);	 Catch:{ all -> 0x003f }
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x022e }
        r10 = r10.mRebuildingSessions;	 Catch:{ all -> 0x022e }
        r10.clear();	 Catch:{ all -> 0x022e }
        r8 = r9;
    L_0x0029:
        monitor-exit(r11);
        if (r8 == 0) goto L_0x0042;
    L_0x002c:
        r2 = 0;
    L_0x002d:
        r10 = r8.size();
        if (r2 >= r10) goto L_0x0042;
    L_0x0033:
        r10 = r8.get(r2);
        r10 = (com.jellybyn.settings.applications.ApplicationsState.Session) r10;
        r10.handleRebuildList();
        r2 = r2 + 1;
        goto L_0x002d;
    L_0x003f:
        r10 = move-exception;
    L_0x0040:
        monitor-exit(r11);
        throw r10;
    L_0x0042:
        r0 = r17;
        r10 = r0.what;
        switch(r10) {
            case 1: goto L_0x0049;
            case 2: goto L_0x004a;
            case 3: goto L_0x00c1;
            case 4: goto L_0x015d;
            default: goto L_0x0049;
        };
    L_0x0049:
        return;
    L_0x004a:
        r7 = 0;
        r0 = r16;
        r10 = r0.this$0;
        r11 = r10.mEntriesMap;
        monitor-enter(r11);
        r2 = 0;
    L_0x0053:
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
        r10 = r10.mApplications;	 Catch:{ all -> 0x00b7 }
        r10 = r10.size();	 Catch:{ all -> 0x00b7 }
        if (r2 >= r10) goto L_0x00ac;
    L_0x005f:
        r10 = 6;
        if (r7 >= r10) goto L_0x00ac;
    L_0x0062:
        r0 = r16;
        r10 = r0.mRunning;	 Catch:{ all -> 0x00b7 }
        if (r10 != 0) goto L_0x0086;
    L_0x0068:
        r10 = 1;
        r0 = r16;
        r0.mRunning = r10;	 Catch:{ all -> 0x00b7 }
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
        r10 = r10.mMainHandler;	 Catch:{ all -> 0x00b7 }
        r12 = 6;
        r13 = 1;
        r13 = java.lang.Integer.valueOf(r13);	 Catch:{ all -> 0x00b7 }
        r4 = r10.obtainMessage(r12, r13);	 Catch:{ all -> 0x00b7 }
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
        r10 = r10.mMainHandler;	 Catch:{ all -> 0x00b7 }
        r10.sendMessage(r4);	 Catch:{ all -> 0x00b7 }
    L_0x0086:
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
        r10 = r10.mApplications;	 Catch:{ all -> 0x00b7 }
        r3 = r10.get(r2);	 Catch:{ all -> 0x00b7 }
        r3 = (android.content.pm.ApplicationInfo) r3;	 Catch:{ all -> 0x00b7 }
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
        r10 = r10.mEntriesMap;	 Catch:{ all -> 0x00b7 }
        r12 = r3.packageName;	 Catch:{ all -> 0x00b7 }
        r10 = r10.get(r12);	 Catch:{ all -> 0x00b7 }
        if (r10 != 0) goto L_0x00a9;
    L_0x00a0:
        r7 = r7 + 1;
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
        r10.getEntryLocked(r3);	 Catch:{ all -> 0x00b7 }
    L_0x00a9:
        r2 = r2 + 1;
        goto L_0x0053;
    L_0x00ac:
        monitor-exit(r11);	 Catch:{ all -> 0x00b7 }
        r10 = 6;
        if (r7 < r10) goto L_0x00ba;
    L_0x00b0:
        r10 = 2;
        r0 = r16;
        r0.sendEmptyMessage(r10);
        goto L_0x0049;
    L_0x00b7:
        r10 = move-exception;
        monitor-exit(r11);
        throw r10;
    L_0x00ba:
        r10 = 3;
        r0 = r16;
        r0.sendEmptyMessage(r10);
        goto L_0x0049;
    L_0x00c1:
        r7 = 0;
        r0 = r16;
        r10 = r0.this$0;
        r11 = r10.mEntriesMap;
        monitor-enter(r11);
        r2 = 0;
    L_0x00ca:
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x012d }
        r10 = r10.mAppEntries;	 Catch:{ all -> 0x012d }
        r10 = r10.size();	 Catch:{ all -> 0x012d }
        if (r2 >= r10) goto L_0x0130;
    L_0x00d6:
        r10 = 2;
        if (r7 >= r10) goto L_0x0130;
    L_0x00d9:
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x012d }
        r10 = r10.mAppEntries;	 Catch:{ all -> 0x012d }
        r1 = r10.get(r2);	 Catch:{ all -> 0x012d }
        r1 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r1;	 Catch:{ all -> 0x012d }
        r10 = r1.icon;	 Catch:{ all -> 0x012d }
        if (r10 == 0) goto L_0x00ed;
    L_0x00e9:
        r10 = r1.mounted;	 Catch:{ all -> 0x012d }
        if (r10 != 0) goto L_0x0127;
    L_0x00ed:
        monitor-enter(r1);	 Catch:{ all -> 0x012d }
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x012a }
        r10 = r10.mContext;	 Catch:{ all -> 0x012a }
        r0 = r16;
        r12 = r0.this$0;	 Catch:{ all -> 0x012a }
        r12 = r12.mPm;	 Catch:{ all -> 0x012a }
        r10 = r1.ensureIconLocked(r10, r12);	 Catch:{ all -> 0x012a }
        if (r10 == 0) goto L_0x0126;
    L_0x0100:
        r0 = r16;
        r10 = r0.mRunning;	 Catch:{ all -> 0x012a }
        if (r10 != 0) goto L_0x0124;
    L_0x0106:
        r10 = 1;
        r0 = r16;
        r0.mRunning = r10;	 Catch:{ all -> 0x012a }
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x012a }
        r10 = r10.mMainHandler;	 Catch:{ all -> 0x012a }
        r12 = 6;
        r13 = 1;
        r13 = java.lang.Integer.valueOf(r13);	 Catch:{ all -> 0x012a }
        r4 = r10.obtainMessage(r12, r13);	 Catch:{ all -> 0x012a }
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x012a }
        r10 = r10.mMainHandler;	 Catch:{ all -> 0x012a }
        r10.sendMessage(r4);	 Catch:{ all -> 0x012a }
    L_0x0124:
        r7 = r7 + 1;
    L_0x0126:
        monitor-exit(r1);	 Catch:{ all -> 0x012a }
    L_0x0127:
        r2 = r2 + 1;
        goto L_0x00ca;
    L_0x012a:
        r10 = move-exception;
        monitor-exit(r1);	 Catch:{ all -> 0x012a }
        throw r10;
    L_0x012d:
        r10 = move-exception;
        monitor-exit(r11);
        throw r10;
    L_0x0130:
        monitor-exit(r11);
        if (r7 <= 0) goto L_0x014a;
    L_0x0133:
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mMainHandler;
        r11 = 3;
        r10 = r10.hasMessages(r11);
        if (r10 != 0) goto L_0x014a;
    L_0x0140:
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mMainHandler;
        r11 = 3;
        r10.sendEmptyMessage(r11);
    L_0x014a:
        r10 = 2;
        if (r7 < r10) goto L_0x0155;
    L_0x014d:
        r10 = 3;
        r0 = r16;
        r0.sendEmptyMessage(r10);
        goto L_0x0049;
    L_0x0155:
        r10 = 4;
        r0 = r16;
        r0.sendEmptyMessage(r10);
        goto L_0x0049;
    L_0x015d:
        r0 = r16;
        r10 = r0.this$0;
        r11 = r10.mEntriesMap;
        monitor-enter(r11);
        r0 = r16;
        r10 = r0.this$0;	 Catch:{ all -> 0x016f }
        r10 = r10.mCurComputingSizePkg;	 Catch:{ all -> 0x016f }
        if (r10 == 0) goto L_0x0172;
    L_0x016c:
        monitor-exit(r11);	 Catch:{ all -> 0x016f }
        goto L_0x0049;
    L_0x016f:
        r10 = move-exception;
        monitor-exit(r11);	 Catch:{ all -> 0x016f }
        throw r10;
    L_0x0172:
        r5 = android.os.SystemClock.uptimeMillis();
        r2 = 0;
    L_0x0177:
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mAppEntries;
        r10 = r10.size();
        if (r2 >= r10) goto L_0x01f6;
    L_0x0183:
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mAppEntries;
        r1 = r10.get(r2);
        r1 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r1;
        r12 = r1.size;
        r14 = -1;
        r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
        if (r10 == 0) goto L_0x019b;
    L_0x0197:
        r10 = r1.sizeStale;
        if (r10 == 0) goto L_0x01f3;
    L_0x019b:
        r12 = r1.sizeLoadStart;
        r14 = 0;
        r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
        if (r10 == 0) goto L_0x01ad;
    L_0x01a3:
        r12 = r1.sizeLoadStart;
        r14 = 20000; // 0x4e20 float:2.8026E-41 double:9.8813E-320;
        r14 = r5 - r14;
        r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
        if (r10 >= 0) goto L_0x01f0;
    L_0x01ad:
        r0 = r16;
        r10 = r0.mRunning;
        if (r10 != 0) goto L_0x01d1;
    L_0x01b3:
        r10 = 1;
        r0 = r16;
        r0.mRunning = r10;
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mMainHandler;
        r12 = 6;
        r13 = 1;
        r13 = java.lang.Integer.valueOf(r13);
        r4 = r10.obtainMessage(r12, r13);
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mMainHandler;
        r10.sendMessage(r4);
    L_0x01d1:
        r1.sizeLoadStart = r5;
        r0 = r16;
        r10 = r0.this$0;
        r12 = r1.info;
        r12 = r12.packageName;
        r10.mCurComputingSizePkg = r12;
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mPm;
        r0 = r16;
        r12 = r0.this$0;
        r12 = r12.mCurComputingSizePkg;
        r0 = r16;
        r13 = r0.mStatsObserver;
        r10.getPackageSizeInfo(r12, r13);
    L_0x01f0:
        monitor-exit(r11);
        goto L_0x0049;
    L_0x01f3:
        r2 = r2 + 1;
        goto L_0x0177;
    L_0x01f6:
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mMainHandler;
        r12 = 5;
        r10 = r10.hasMessages(r12);
        if (r10 != 0) goto L_0x022b;
    L_0x0203:
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mMainHandler;
        r12 = 5;
        r10.sendEmptyMessage(r12);
        r10 = 0;
        r0 = r16;
        r0.mRunning = r10;
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mMainHandler;
        r12 = 6;
        r13 = 0;
        r13 = java.lang.Integer.valueOf(r13);
        r4 = r10.obtainMessage(r12, r13);
        r0 = r16;
        r10 = r0.this$0;
        r10 = r10.mMainHandler;
        r10.sendMessage(r4);
    L_0x022b:
        monitor-exit(r11);
        goto L_0x0049;
    L_0x022e:
        r10 = move-exception;
        r8 = r9;
        goto L_0x0040;
    }
}