package com.jellybyn.settings.applications;

public class ApplicationsState$Session {
    final com.jellybyn.settings.applications.ApplicationsState.Callbacks mCallbacks;
    java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.AppEntry> mLastAppList;
    boolean mRebuildAsync;
    java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> mRebuildComparator;
    com.jellybyn.settings.applications.ApplicationsState.AppFilter mRebuildFilter;
    boolean mRebuildRequested;
    java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.AppEntry> mRebuildResult;
    final java.lang.Object mRebuildSync;
    boolean mResumed;
    final /* synthetic */ com.jellybyn.settings.applications.ApplicationsState this$0;

    ApplicationsState$Session(com.jellybyn.settings.applications.ApplicationsState r2, com.jellybyn.settings.applications.ApplicationsState.Callbacks r3) {
        r1 = this;
        r1.this$0 = r2;
        r1.<init>();
        r0 = new java.lang.Object;
        r0.<init>();
        r1.mRebuildSync = r0;
        r1.mCallbacks = r3;
        return;
    }

    void handleRebuildList() {
        r11 = this;
        r9 = r11.mRebuildSync;
        monitor-enter(r9);
        r8 = r11.mRebuildRequested;	 Catch:{ all -> 0x0062 }
        if (r8 != 0) goto L_0x0009;
    L_0x0007:
        monitor-exit(r9);	 Catch:{ all -> 0x0062 }
    L_0x0008:
        return;
    L_0x0009:
        r3 = r11.mRebuildFilter;	 Catch:{ all -> 0x0062 }
        r1 = r11.mRebuildComparator;	 Catch:{ all -> 0x0062 }
        r8 = 0;
        r11.mRebuildRequested = r8;	 Catch:{ all -> 0x0062 }
        r8 = 0;
        r11.mRebuildFilter = r8;	 Catch:{ all -> 0x0062 }
        r8 = 0;
        r11.mRebuildComparator = r8;	 Catch:{ all -> 0x0062 }
        monitor-exit(r9);	 Catch:{ all -> 0x0062 }
        r8 = -2;
        android.os.Process.setThreadPriority(r8);
        if (r3 == 0) goto L_0x0020;
    L_0x001d:
        r3.init();
    L_0x0020:
        r8 = r11.this$0;
        r9 = r8.mEntriesMap;
        monitor-enter(r9);
        r0 = new java.util.ArrayList;	 Catch:{ all -> 0x0065 }
        r8 = r11.this$0;	 Catch:{ all -> 0x0065 }
        r8 = r8.mApplications;	 Catch:{ all -> 0x0065 }
        r0.<init>(r8);	 Catch:{ all -> 0x0065 }
        monitor-exit(r9);	 Catch:{ all -> 0x0065 }
        r4 = new java.util.ArrayList;
        r4.<init>();
        r5 = 0;
    L_0x0035:
        r8 = r0.size();
        if (r5 >= r8) goto L_0x006b;
    L_0x003b:
        r6 = r0.get(r5);
        r6 = (android.content.pm.ApplicationInfo) r6;
        if (r3 == 0) goto L_0x0049;
    L_0x0043:
        r8 = r3.filterApp(r6);
        if (r8 == 0) goto L_0x005f;
    L_0x0049:
        r8 = r11.this$0;
        r9 = r8.mEntriesMap;
        monitor-enter(r9);
        r8 = r11.this$0;	 Catch:{ all -> 0x0068 }
        r2 = r8.getEntryLocked(r6);	 Catch:{ all -> 0x0068 }
        r8 = r11.this$0;	 Catch:{ all -> 0x0068 }
        r8 = r8.mContext;	 Catch:{ all -> 0x0068 }
        r2.ensureLabel(r8);	 Catch:{ all -> 0x0068 }
        r4.add(r2);	 Catch:{ all -> 0x0068 }
        monitor-exit(r9);	 Catch:{ all -> 0x0068 }
    L_0x005f:
        r5 = r5 + 1;
        goto L_0x0035;
    L_0x0062:
        r8 = move-exception;
        monitor-exit(r9);
        throw r8;
    L_0x0065:
        r8 = move-exception;
        monitor-exit(r9);
        throw r8;
    L_0x0068:
        r8 = move-exception;
        monitor-exit(r9);
        throw r8;
    L_0x006b:
        java.util.Collections.sort(r4, r1);
        r9 = r11.mRebuildSync;
        monitor-enter(r9);
        r8 = r11.mRebuildRequested;	 Catch:{ all -> 0x00a5 }
        if (r8 != 0) goto L_0x0082;
    L_0x0075:
        r11.mLastAppList = r4;	 Catch:{ all -> 0x00a5 }
        r8 = r11.mRebuildAsync;	 Catch:{ all -> 0x00a5 }
        if (r8 != 0) goto L_0x0089;
    L_0x007b:
        r11.mRebuildResult = r4;	 Catch:{ all -> 0x00a5 }
        r8 = r11.mRebuildSync;	 Catch:{ all -> 0x00a5 }
        r8.notifyAll();	 Catch:{ all -> 0x00a5 }
    L_0x0082:
        monitor-exit(r9);	 Catch:{ all -> 0x00a5 }
        r8 = 10;
        android.os.Process.setThreadPriority(r8);
        goto L_0x0008;
    L_0x0089:
        r8 = r11.this$0;
        r8 = r8.mMainHandler;
        r10 = 1;
        r8 = r8.hasMessages(r10, r11);
        if (r8 != 0) goto L_0x0082;
    L_0x0094:
        r8 = r11.this$0;
        r8 = r8.mMainHandler;
        r10 = 1;
        r7 = r8.obtainMessage(r10, r11);
        r8 = r11.this$0;
        r8 = r8.mMainHandler;
        r8.sendMessage(r7);
        goto L_0x0082;
    L_0x00a5:
        r8 = move-exception;
        monitor-exit(r9);
        throw r8;
    }

    public void pause() {
        r3 = this;
        r0 = r3.this$0;
        r1 = r0.mEntriesMap;
        monitor-enter(r1);
        r0 = r3.mResumed;	 Catch:{ all -> 0x0020 }
        if (r0 == 0) goto L_0x001e;
    L_0x0009:
        r0 = 0;
        r3.mResumed = r0;	 Catch:{ all -> 0x0020 }
        r0 = r3.this$0;	 Catch:{ all -> 0x0020 }
        r2 = 1;
        r0.mSessionsChanged = r2;	 Catch:{ all -> 0x0020 }
        r0 = r3.this$0;	 Catch:{ all -> 0x0020 }
        r0 = r0.mBackgroundHandler;	 Catch:{ all -> 0x0020 }
        r2 = 1;
        r0.removeMessages(r2, r3);	 Catch:{ all -> 0x0020 }
        r0 = r3.this$0;	 Catch:{ all -> 0x0020 }
        r0.doPauseIfNeededLocked();	 Catch:{ all -> 0x0020 }
    L_0x001e:
        monitor-exit(r1);	 Catch:{ all -> 0x0020 }
        return;
    L_0x0020:
        r0 = move-exception;
        monitor-exit(r1);	 Catch:{ all -> 0x0020 }
        throw r0;
    }

    java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.AppEntry> rebuild(com.jellybyn.settings.applications.ApplicationsState.AppFilter r12, java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> r13) {
        r11 = this;
        r6 = r11.mRebuildSync;
        monitor-enter(r6);
        r5 = r11.this$0;	 Catch:{ all -> 0x0056 }
        r7 = r5.mEntriesMap;	 Catch:{ all -> 0x0056 }
        monitor-enter(r7);	 Catch:{ all -> 0x0056 }
        r5 = r11.this$0;	 Catch:{ all -> 0x0053 }
        r5 = r5.mRebuildingSessions;	 Catch:{ all -> 0x0053 }
        r5.add(r11);	 Catch:{ all -> 0x0053 }
        r5 = 1;
        r11.mRebuildRequested = r5;	 Catch:{ all -> 0x0053 }
        r5 = 0;
        r11.mRebuildAsync = r5;	 Catch:{ all -> 0x0053 }
        r11.mRebuildFilter = r12;	 Catch:{ all -> 0x0053 }
        r11.mRebuildComparator = r13;	 Catch:{ all -> 0x0053 }
        r5 = 0;
        r11.mRebuildResult = r5;	 Catch:{ all -> 0x0053 }
        r5 = r11.this$0;	 Catch:{ all -> 0x0053 }
        r5 = r5.mBackgroundHandler;	 Catch:{ all -> 0x0053 }
        r8 = 1;
        r5 = r5.hasMessages(r8);	 Catch:{ all -> 0x0053 }
        if (r5 != 0) goto L_0x0037;
    L_0x0027:
        r5 = r11.this$0;	 Catch:{ all -> 0x0053 }
        r5 = r5.mBackgroundHandler;	 Catch:{ all -> 0x0053 }
        r8 = 1;
        r0 = r5.obtainMessage(r8);	 Catch:{ all -> 0x0053 }
        r5 = r11.this$0;	 Catch:{ all -> 0x0053 }
        r5 = r5.mBackgroundHandler;	 Catch:{ all -> 0x0053 }
        r5.sendMessage(r0);	 Catch:{ all -> 0x0053 }
    L_0x0037:
        monitor-exit(r7);	 Catch:{ all -> 0x0053 }
        r7 = android.os.SystemClock.uptimeMillis();
        r9 = 250; // 0xfa float:3.5E-43 double:1.235E-321;
        r3 = r7 + r9;
    L_0x0040:
        r5 = r11.mRebuildResult;
        if (r5 != 0) goto L_0x004c;
    L_0x0044:
        r1 = android.os.SystemClock.uptimeMillis();
        r5 = (r1 > r3 ? 1 : (r1 == r3 ? 0 : -1));
        if (r5 < 0) goto L_0x0059;
    L_0x004c:
        r5 = 1;
        r11.mRebuildAsync = r5;
        r5 = r11.mRebuildResult;
        monitor-exit(r6);
        return r5;
    L_0x0053:
        r5 = move-exception;
        monitor-exit(r7);
        throw r5;
    L_0x0056:
        r5 = move-exception;
        monitor-exit(r6);
        throw r5;
    L_0x0059:
        r5 = r11.mRebuildSync;	 Catch:{ InterruptedException -> 0x0061 }
        r7 = r3 - r1;
        r5.wait(r7);	 Catch:{ InterruptedException -> 0x0061 }
        goto L_0x0040;
    L_0x0061:
        r5 = move-exception;
        goto L_0x0040;
    }

    public void resume() {
        r3 = this;
        r0 = r3.this$0;
        r1 = r0.mEntriesMap;
        monitor-enter(r1);
        r0 = r3.mResumed;	 Catch:{ all -> 0x0018 }
        if (r0 != 0) goto L_0x0016;
    L_0x0009:
        r0 = 1;
        r3.mResumed = r0;	 Catch:{ all -> 0x0018 }
        r0 = r3.this$0;	 Catch:{ all -> 0x0018 }
        r2 = 1;
        r0.mSessionsChanged = r2;	 Catch:{ all -> 0x0018 }
        r0 = r3.this$0;	 Catch:{ all -> 0x0018 }
        r0.doResumeIfNeededLocked();	 Catch:{ all -> 0x0018 }
    L_0x0016:
        monitor-exit(r1);	 Catch:{ all -> 0x0018 }
        return;
    L_0x0018:
        r0 = move-exception;
        monitor-exit(r1);	 Catch:{ all -> 0x0018 }
        throw r0;
    }
}