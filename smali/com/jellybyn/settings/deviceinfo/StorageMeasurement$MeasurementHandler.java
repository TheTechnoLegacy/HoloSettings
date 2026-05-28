package com.jellybyn.settings.deviceinfo;

class StorageMeasurement$MeasurementHandler extends android.os.Handler {
    private volatile boolean mBound;
    private com.jellybyn.settings.deviceinfo.StorageMeasurement.MeasurementDetails mCached;
    private final java.lang.ref.WeakReference<android.content.Context> mContext;
    private final android.content.ServiceConnection mDefContainerConn;
    private com.android.internal.app.IMediaContainerService mDefaultContainer;
    private java.lang.Object mLock;
    final /* synthetic */ com.jellybyn.settings.deviceinfo.StorageMeasurement this$0;

    public StorageMeasurement$MeasurementHandler(com.jellybyn.settings.deviceinfo.StorageMeasurement r2, android.content.Context r3, android.os.Looper r4) {
        r1 = this;
        r1.this$0 = r2;
        r1.<init>(r4);
        r0 = new java.lang.Object;
        r0.<init>();
        r1.mLock = r0;
        r0 = 0;
        r1.mBound = r0;
        r0 = new com.jellybyn.settings.deviceinfo.StorageMeasurement$MeasurementHandler$1;
        r0.<init>(r1);
        r1.mDefContainerConn = r0;
        r0 = new java.lang.ref.WeakReference;
        r0.<init>(r3);
        r1.mContext = r0;
        return;
    }

    static /* synthetic */ com.android.internal.app.IMediaContainerService access$102(com.jellybyn.settings.deviceinfo.StorageMeasurement$MeasurementHandler r0, com.android.internal.app.IMediaContainerService r1) {
        r0.mDefaultContainer = r1;
        return r1;
    }

    static /* synthetic */ boolean access$202(com.jellybyn.settings.deviceinfo.StorageMeasurement$MeasurementHandler r0, boolean r1) {
        r0.mBound = r1;
        return r1;
    }

    private void measureApproximateStorage(com.android.internal.app.IMediaContainerService r7) {
        r6 = this;
        r3 = r6.this$0;
        r3 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$400(r3);
        if (r3 == 0) goto L_0x002c;
    L_0x0008:
        r3 = r6.this$0;
        r3 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$400(r3);
        r1 = r3.getPath();
    L_0x0012:
        r2 = r7.getFileSystemStats(r1);	 Catch:{ Exception -> 0x0035 }
        r3 = r6.this$0;	 Catch:{ Exception -> 0x0035 }
        r4 = 0;
        r4 = r2[r4];	 Catch:{ Exception -> 0x0035 }
        com.jellybyn.settings.deviceinfo.StorageMeasurement.access$502(r3, r4);	 Catch:{ Exception -> 0x0035 }
        r3 = r6.this$0;	 Catch:{ Exception -> 0x0035 }
        r4 = 1;
        r4 = r2[r4];	 Catch:{ Exception -> 0x0035 }
        com.jellybyn.settings.deviceinfo.StorageMeasurement.access$602(r3, r4);	 Catch:{ Exception -> 0x0035 }
    L_0x0026:
        r3 = r6.this$0;
        com.jellybyn.settings.deviceinfo.StorageMeasurement.access$700(r3);
        return;
    L_0x002c:
        r3 = android.os.Environment.getDataDirectory();
        r1 = r3.getPath();
        goto L_0x0012;
    L_0x0035:
        r0 = move-exception;
        r3 = "StorageMeasurement";
        r4 = "Problem in container service";
        android.util.Log.w(r3, r4, r0);
        goto L_0x0026;
    }

    private void measureExactStorage(com.android.internal.app.IMediaContainerService r28) {
        r27 = this;
        r0 = r27;
        r4 = r0.mContext;
        if (r4 == 0) goto L_0x0014;
    L_0x0006:
        r0 = r27;
        r4 = r0.mContext;
        r4 = r4.get();
        r4 = (android.content.Context) r4;
        r11 = r4;
    L_0x0011:
        if (r11 != 0) goto L_0x0016;
    L_0x0013:
        return;
    L_0x0014:
        r11 = 0;
        goto L_0x0011;
    L_0x0016:
        r5 = new com.jellybyn.settings.deviceinfo.StorageMeasurement$MeasurementDetails;
        r5.<init>();
        r4 = 4;
        r0 = r27;
        r7 = r0.obtainMessage(r4, r5);
        r0 = r27;
        r4 = r0.this$0;
        r25 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$500(r4);
        r0 = r25;
        r5.totalSize = r0;
        r0 = r27;
        r4 = r0.this$0;
        r25 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$600(r4);
        r0 = r25;
        r5.availSize = r0;
        r4 = "user";
        r23 = r11.getSystemService(r4);
        r23 = (android.os.UserManager) r23;
        r24 = r23.getUsers();
        r6 = android.app.ActivityManager.getCurrentUser();
        r12 = new android.os.Environment$UserEnvironment;
        r12.<init>(r6);
        r0 = r27;
        r4 = r0.this$0;
        r4 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$800(r4);
        if (r4 == 0) goto L_0x005f;
    L_0x0059:
        r4 = android.os.Environment.isExternalStorageEmulated();
        if (r4 != 0) goto L_0x0069;
    L_0x005f:
        r0 = r27;
        r4 = r0.this$0;
        r4 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$900(r4);
        if (r4 == 0) goto L_0x009c;
    L_0x0069:
        r15 = 1;
    L_0x006a:
        if (r15 == 0) goto L_0x009e;
    L_0x006c:
        r4 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$1000();
        r13 = r4.iterator();
    L_0x0074:
        r4 = r13.hasNext();
        if (r4 == 0) goto L_0x009e;
    L_0x007a:
        r20 = r13.next();
        r20 = (java.lang.String) r20;
        r0 = r20;
        r16 = r12.getExternalStoragePublicDirectory(r0);
        r0 = r28;
        r1 = r16;
        r18 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$1100(r0, r1);
        r4 = r5.mediaSize;
        r25 = java.lang.Long.valueOf(r18);
        r0 = r20;
        r1 = r25;
        r4.put(r0, r1);
        goto L_0x0074;
    L_0x009c:
        r15 = 0;
        goto L_0x006a;
    L_0x009e:
        if (r15 == 0) goto L_0x00be;
    L_0x00a0:
        r0 = r27;
        r4 = r0.this$0;
        r4 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$800(r4);
        if (r4 == 0) goto L_0x00f3;
    L_0x00aa:
        r16 = r12.getExternalStorageDirectory();
    L_0x00ae:
        r0 = r27;
        r4 = r0.this$0;
        r0 = r28;
        r1 = r16;
        r25 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$1200(r4, r0, r1);
        r0 = r25;
        r5.miscSize = r0;
    L_0x00be:
        r13 = r24.iterator();
    L_0x00c2:
        r4 = r13.hasNext();
        if (r4 == 0) goto L_0x0100;
    L_0x00c8:
        r21 = r13.next();
        r21 = (android.content.pm.UserInfo) r21;
        r22 = new android.os.Environment$UserEnvironment;
        r0 = r21;
        r4 = r0.id;
        r0 = r22;
        r0.<init>(r4);
        r4 = r22.getExternalStorageDirectory();
        r0 = r28;
        r18 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$1100(r0, r4);
        r4 = r5.usersSize;
        r0 = r21;
        r0 = r0.id;
        r25 = r0;
        r0 = r25;
        r1 = r18;
        com.jellybyn.settings.deviceinfo.StorageMeasurement.access$000(r4, r0, r1);
        goto L_0x00c2;
    L_0x00f3:
        r0 = r27;
        r4 = r0.this$0;
        r4 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$400(r4);
        r16 = r4.getPathFile();
        goto L_0x00ae;
    L_0x0100:
        r17 = r11.getPackageManager();
        r0 = r27;
        r4 = r0.this$0;
        r4 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$800(r4);
        if (r4 != 0) goto L_0x0118;
    L_0x010e:
        r0 = r27;
        r4 = r0.this$0;
        r4 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$900(r4);
        if (r4 == 0) goto L_0x0167;
    L_0x0118:
        r4 = 8704; // 0x2200 float:1.2197E-41 double:4.3003E-320;
        r0 = r17;
        r10 = r0.getInstalledApplications(r4);
        r4 = r24.size();
        r25 = r10.size();
        r8 = r4 * r25;
        r3 = new com.jellybyn.settings.deviceinfo.StorageMeasurement$StatsObserver;
        r0 = r27;
        r4 = r0.this$0;
        r4 = com.jellybyn.settings.deviceinfo.StorageMeasurement.access$800(r4);
        r3.<init>(r4, r5, r6, r7, r8);
        r13 = r24.iterator();
    L_0x013b:
        r4 = r13.hasNext();
        if (r4 == 0) goto L_0x0013;
    L_0x0141:
        r21 = r13.next();
        r21 = (android.content.pm.UserInfo) r21;
        r14 = r10.iterator();
    L_0x014b:
        r4 = r14.hasNext();
        if (r4 == 0) goto L_0x013b;
    L_0x0151:
        r9 = r14.next();
        r9 = (android.content.pm.ApplicationInfo) r9;
        r4 = r9.packageName;
        r0 = r21;
        r0 = r0.id;
        r25 = r0;
        r0 = r17;
        r1 = r25;
        r0.getPackageSizeInfo(r4, r1, r3);
        goto L_0x014b;
    L_0x0167:
        r7.sendToTarget();
        goto L_0x0013;
    }

    public void handleMessage(android.os.Message r8) {
        r7 = this;
        r0 = 0;
        r3 = r8.what;
        switch(r3) {
            case 1: goto L_0x0007;
            case 2: goto L_0x0050;
            case 3: goto L_0x005b;
            case 4: goto L_0x0080;
            case 5: goto L_0x008f;
            default: goto L_0x0006;
        };
    L_0x0006:
        return;
    L_0x0007:
        r3 = r7.mCached;
        if (r3 == 0) goto L_0x0013;
    L_0x000b:
        r3 = r7.this$0;
        r4 = r7.mCached;
        com.jellybyn.settings.deviceinfo.StorageMeasurement.access$300(r3, r4);
        goto L_0x0006;
    L_0x0013:
        r3 = r7.mContext;
        if (r3 == 0) goto L_0x0020;
    L_0x0017:
        r3 = r7.mContext;
        r3 = r3.get();
        r3 = (android.content.Context) r3;
        r0 = r3;
    L_0x0020:
        if (r0 == 0) goto L_0x0006;
    L_0x0022:
        r4 = r7.mLock;
        monitor-enter(r4);
        r3 = r7.mBound;	 Catch:{ all -> 0x0039 }
        if (r3 == 0) goto L_0x003c;
    L_0x0029:
        r3 = 3;
        r7.removeMessages(r3);	 Catch:{ all -> 0x0039 }
        r3 = 2;
        r5 = r7.mDefaultContainer;	 Catch:{ all -> 0x0039 }
        r3 = r7.obtainMessage(r3, r5);	 Catch:{ all -> 0x0039 }
        r7.sendMessage(r3);	 Catch:{ all -> 0x0039 }
    L_0x0037:
        monitor-exit(r4);	 Catch:{ all -> 0x0039 }
        goto L_0x0006;
    L_0x0039:
        r3 = move-exception;
        monitor-exit(r4);	 Catch:{ all -> 0x0039 }
        throw r3;
    L_0x003c:
        r3 = new android.content.Intent;
        r3.<init>();
        r5 = com.jellybyn.settings.deviceinfo.StorageMeasurement.DEFAULT_CONTAINER_COMPONENT;
        r2 = r3.setComponent(r5);
        r3 = r7.mDefContainerConn;
        r5 = 1;
        r6 = android.os.UserHandle.OWNER;
        r0.bindServiceAsUser(r2, r3, r5, r6);
        goto L_0x0037;
    L_0x0050:
        r1 = r8.obj;
        r1 = (com.android.internal.app.IMediaContainerService) r1;
        r7.measureApproximateStorage(r1);
        r7.measureExactStorage(r1);
        goto L_0x0006;
    L_0x005b:
        r4 = r7.mLock;
        monitor-enter(r4);
        r3 = r7.mBound;	 Catch:{ all -> 0x0073 }
        if (r3 == 0) goto L_0x007e;
    L_0x0062:
        r3 = r7.mContext;	 Catch:{ all -> 0x0073 }
        if (r3 == 0) goto L_0x006f;
    L_0x0066:
        r3 = r7.mContext;	 Catch:{ all -> 0x0073 }
        r3 = r3.get();	 Catch:{ all -> 0x0073 }
        r3 = (android.content.Context) r3;	 Catch:{ all -> 0x0073 }
        r0 = r3;
    L_0x006f:
        if (r0 != 0) goto L_0x0076;
    L_0x0071:
        monitor-exit(r4);	 Catch:{ all -> 0x0073 }
        goto L_0x0006;
    L_0x0073:
        r3 = move-exception;
        monitor-exit(r4);	 Catch:{ all -> 0x0073 }
        throw r3;
    L_0x0076:
        r3 = 0;
        r7.mBound = r3;
        r3 = r7.mDefContainerConn;
        r0.unbindService(r3);
    L_0x007e:
        monitor-exit(r4);
        goto L_0x0006;
    L_0x0080:
        r3 = r8.obj;
        r3 = (com.jellybyn.settings.deviceinfo.StorageMeasurement.MeasurementDetails) r3;
        r7.mCached = r3;
        r3 = r7.this$0;
        r4 = r7.mCached;
        com.jellybyn.settings.deviceinfo.StorageMeasurement.access$300(r3, r4);
        goto L_0x0006;
    L_0x008f:
        r7.mCached = r0;
        goto L_0x0006;
    }
}